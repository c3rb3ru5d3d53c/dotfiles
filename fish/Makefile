install-fish-config: uninstall-fish-config
	@echo "[-] installing fish"
	@mkdir -p ~/.config/fish/functions/
	@cp -r ./fish/config/functions/* ~/.config/fish/functions/
	@curl -s https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish --init-command "set argv --noninteractive" 2>/dev/null 1>/dev/null
	@echo "omf install lambda" | fish 2>/dev/null 1>/dev/null
	@echo "[*] installing fish completed"

uninstall-fish-config:
	@echo "[-] uninstalling fish"
	@rm -rf \
		~/.config/fish/functions/ \
		~/.local/share/omf/ \
		~/.cache/omf/ \
		~/.config/omf/
	@rm -f ~/.config/fish/conf.d/omf.fish
	@echo "[*] uninstalling fish completed"

