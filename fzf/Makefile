.PHONY: fzf

fzf:
	@echo "[-] building fzf"
	@mkdir -p ./build/fzf/
	@wget -qO ./build/fzf/fzf-${VERSION_FZF}-linux_amd64.tar.gz https://github.com/junegunn/fzf/releases/download/${VERSION_FZF}/fzf-${VERSION_FZF}-linux_amd64.tar.gz
	@tar -xzf ./build/fzf/fzf-${VERSION_FZF}-linux_amd64.tar.gz -C ./build/fzf/
	@chmod +x ./build/fzf/fzf
	@echo "[*] building fzf completed"

install-fzf: uninstall-fzf
	@echo "[-] installing fzf"
	@cp ./build/fzf/fzf ~/.local/bin/
	@echo "[*] installing fzf completed"

uninstall-fzf:
	@echo "[-] uninstalling fzf"
	@rm -f ~/.local/bin/fzf
	@echo "[*] uninstalling fzf completed"

