install-tmux-config: uninstall-tmux-config
	@echo "[-] installing tmux configuration"
	@git clone -q https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
	@mkdir -p ~/.config/tmux/plugins/tmux/
	@cp ./tmux/config/*.conf ~/.config/tmux/
	@~/.tmux/plugins/tpm/bin/install_plugins 2>/dev/null 1>/dev/null
	@cp ./tmux/config/plugins/tmux/* ~/.config/tmux/plugins/tmux/
	@echo "[*] installing tmux configuration completed"

uninstall-tmux-config:
	@echo "[-] uninstalling tmux configuration"
	@rm -rf \
		~/.config/tmux/ \
		~/.tmux/
	@rm -f ~/.tmux.conf
	@echo "[-] uninstalling tmux configuration completed"

