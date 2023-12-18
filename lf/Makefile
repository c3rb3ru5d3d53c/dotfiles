build-lf:
	@echo "[-] building lf"
	@mkdir -p ./build/lf/
	@wget -qO ./build/lf/lf-linux-amd64.tar.gz \
		https://github.com/gokcehan/lf/releases/download/${VERSION_LF}/lf-linux-amd64.tar.gz
	@tar -xzf ./build/lf/lf-linux-amd64.tar.gz -C ./build/lf/
	@chmod +x ./build/lf/lf
	@echo "[*] building lf completed"

install-lf: uninstall-lf
	@echo "[-] installing lf"
	@mkdir -p ~/.local/bin/
	@cp ./build/lf/lf ~/.local/bin/lf
	@echo "[*] installing lf completed"

install-lf-config: uninstall-lf-config
	@echo "[-] installin lf configuration"
	@mkdir -p ~/.config/lf/
	@cp -r ./lf/config/* ~/.config/lf/
	@echo "[*] installing lf configuration completed"

uninstall-lf-config:
	@echo "[-] uninstalling lf configuration"	
	@rm -rf ~/.config/lf/
	@echo "[*] uninstalling lf configuration completed"

uninstall-lf:
	@echo "[-] uninstalling lf"
	@kill `pidof lf` 2>/dev/null || true
	@rm -f ~/.local/bin/lf
	@echo "[-] uninstalling lf completed"

