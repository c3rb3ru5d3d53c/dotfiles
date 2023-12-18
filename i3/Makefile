build-i3-0:
	@echo "[-] building i3"
	@mkdir -p ./build/i3/
	@rm -rf ./build/i3/
	@git clone -q https://github.com/i3/i3.git ./build/i3/src/
	@cd ./build/i3/src/ && \
		git checkout -q ${VERSION_I3}; \
		dpkg-buildpackage -sa -j${THREADS}
	@echo "[*] building i3 completed"

install-i3-config: uninstall-i3-config install-autotiling
	@echo "[-] installing i3 configuration"
	@mkdir -p ~/.config/i3/
	@cp -r ./i3/config/. ~/.config/i3/
	@echo "[*] installing i3 configuration completed"

uninstall-i3-config:
	@echo "[-] uninstalling i3 configuration"
	@rm -rf ~/.config/i3/
	@echo "[*] uninstalling i3 configuration completed"

install-i3: uninstall-i3
	@cd ./build/i3/ && \
		apt install -y ./i3-wm_4.22-1_amd64.deb

uninstall-i3:
	@apt autoremove -y i3-wm

build-i3:
	@if [ -z $$(docker images -q i3:${VERSION_I3}) ]; then \
		docker build \
			--build-arg THREADS=${THREADS} \
			--build-arg VERSION=${VERSION_I3} \
			-t i3:${VERSION_I3} ./i3/; \
  fi
	@docker run \
		--rm \
		-u ${USER_ID}:${GROUP_ID} \
		-v ${PWD}:${PWD} \
		-it i3:${VERSION_I3} bash -c "cd ${PWD}; make build-i3-0"; \

