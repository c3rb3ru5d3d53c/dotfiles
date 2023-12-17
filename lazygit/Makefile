.PHONY: lazygit

lazygit:
	@echo "[-] building lazygit"
	@mkdir -p ./build/lazygit/
	@wget \
		-qO ./build/lazygit/lazygit_${VERSION_LAZYGIT}_Linux_32-bit.tar.gz \
		https://github.com/jesseduffield/lazygit/releases/download/v${VERSION_LAZYGIT}/lazygit_${VERSION_LAZYGIT}_Linux_32-bit.tar.gz
	@tar -xzf ./build/lazygit/lazygit_${VERSION_LAZYGIT}_Linux_32-bit.tar.gz -C ./build/lazygit/
	@echo "[*] building lazygit completed"

install-lazygit: uninstall-lazygit
	@echo "[-] installing lazygit"
	@mkdir -p ~/.local/bin/
	@cp ./build/lazygit/lazygit ~/.local/bin/
	@echo "[*] installing lazygit completed"

install-lazygit-config: uninstall-lazygit-config
	@echo "[-] installing lazygit configuration"
	@mkdir -p ~/.config/lazygit/
	@cp -r ./lazygit/config/* ~/.config/lazygit/
	@echo "[*] installing lazygit configuration completed"

uninstall-lazygit-config:
	@echo "[-] uninstalling lazygit configuration"
	@rm -rf ~/.config/lazygit/
	@echo "[*] uninstalling lazygit configuration completed"

uninstall-lazygit:
	@echo "[-] uninstalling lazy-git"
	@rm -f ~/.local/bin/lazygit
	@echo "[*] uninstalling lazy-git completed"
	
