build-lsd:
	@echo "[-] building lsd"
	@mkdir -p ./build/bin/lsd/
	@wget -qO ./build/bin/lsd/lsd-v${VERSION_LSD}-i686-unknown-linux-gnu.tar.gz \
		https://github.com/lsd-rs/lsd/releases/download/v${VERSION_LSD}/lsd-v${VERSION_LSD}-i686-unknown-linux-gnu.tar.gz
	@tar -xzf ./build/bin/lsd/lsd-v${VERSION_LSD}-i686-unknown-linux-gnu.tar.gz -C ./build/bin/lsd/
	@chmod +x ./build/bin/lsd/lsd-v${VERSION_LSD}-i686-unknown-linux-gnu/lsd
	@echo "[*] building lsd completed"

install-lsd: uninstall-lsd
	@echo "[-] installing lsd"
	@mkdir -p ~/.local/bin/
	@cp ./build/bin/lsd/lsd-v${VERSION_LSD}-i686-unknown-linux-gnu/lsd \
		~/.local/bin/lsd
	@echo "[*] installing lsd completed"

uninstall-lsd:
	@echo "[-] uninstalling lsd"
	@rm -f ~/.local/bin/lsd
	@echo "[*] uninstalling lsd completed"

