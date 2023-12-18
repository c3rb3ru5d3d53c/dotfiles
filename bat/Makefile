build-bat:
	@echo "[-] building bat"
	@mkdir -p ./build/bat/
	@wget -qO ./build/bat/bat-v${VERSION_BAT}-i686-unknown-linux-gnu.tar.gz \
		https://github.com/sharkdp/bat/releases/download/v${VERSION_BAT}/bat-v${VERSION_BAT}-i686-unknown-linux-gnu.tar.gz
	@tar -xzf ./build/bat/bat-v${VERSION_BAT}-i686-unknown-linux-gnu.tar.gz -C ./build/bat/
	@chmod +x ./build/bat/bat-v${VERSION_BAT}-i686-unknown-linux-gnu/bat
	@echo "[*] building bat completed"

install-bat: uninstall-bat
	@echo "[-] installing bat"
	@cp ./build/bat/bat-v${VERSION_BAT}-i686-unknown-linux-gnu/bat ~/.local/bin/
	@echo "[*] installing bat completed"

uninstall-bat:
	@echo "[-] uninstalling bat"
	@rm -f ~/.local/bin/bat
	@echo "[*] uninstalling bat completed"

