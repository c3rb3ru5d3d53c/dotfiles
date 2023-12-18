build-polybar:
	@docker image inspect polybar:${VERSION_POLYBAR} 1>/dev/null 2>/dev/null && \
		docker run \
		--rm \
		-u ${USER_ID}:${GROUP_ID} \
		-v ${PWD}:${PWD} \
		-it polybar:${VERSION_POLYBAR} bash -c "cd ${PWD}; make build-polybar-0" || \
		docker build \
		--build-arg THREADS=${THREADS} \
		--build-arg VERSION=${VERSION_POLYBAR} \
		-t polybar:${VERSION_POLYBAR} ./polybar/

build-polybar-0:
	@echo "[-] building polybar"
	@mkdir -p ./build/polybar/
	@wget -qO ./build/polybar/polybar-${VERSION_POLYBAR}.tar.gz \
		https://github.com/polybar/polybar/releases/download/${VERSION_POLYBAR}/polybar-${VERSION_POLYBAR}.tar.gz
	@tar -xzf ./build/polybar/polybar-${VERSION_POLYBAR}.tar.gz -C ./build/polybar/
	@cd ./build/polybar/polybar-${VERSION_POLYBAR}/ && \
		mkdir -p build/ && \
		cd build/ && \
		cmake \
    	-DCMAKE_CXX_COMPILER="g++" \
    	-DENABLE_ALSA:BOOL="ON" \
    	-DENABLE_PULSEAUDIO:BOOL="ON" \
    	-DENABLE_I3:BOOL="ON" \
    	-DENABLE_MPD:BOOL="ON" \
    	-DENABLE_NETWORK:BOOL="ON" \
    	-DENABLE_CURL:BOOL="ON" \
    	-DBUILD_POLYBAR_MSG:BOOL="ON" \
    	-DWITH_XCURSOR="OFF" \
    	.. && \
    	make -j${THREADS}
	@echo "[*] building polybar completed"

install-polybar:
	@echo "[*] installing polybar"
	@cp ./build/polybar/polybar-${VERSION_POLYBAR}/build/bin/polybar \
		~/.local/bin/polybar
	@cp ./build/polybar/polybar-${VERSION_POLYBAR}/build/bin/polybar-msg \
		~/.local/bin/polybar-msg
	@echo "[*] installing polybar completed"

install-polybar-config:
	@echo "[-] installing polybar configuration"
	@mkdir -p ~/.config/polybar/
	@cp ./polybar/config/config.ini ~/.config/polybar/config.ini
	@echo "[*] installing polybar configuration completed"

uninstall-polybar:
	@echo "[-] uninstalling polybar"
	@rm -f ~/.local/bin/polybar
	@rm -f ~/.local/bin/polybar-msg
	@echo "[*] uninstalling polybar completed"

