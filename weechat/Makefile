install-weechat-config: uninstall-weechat-config
	@echo "[-] installing weechat configuration"
	@mkdir -p ~/.config/weechat/
	@cp -r ./weechat/config/* ~/.config/weechat/
	@echo "[*] installing weechat configuration completed"

uninstall-weechat-config:
	@echo "[-] uninstalling weechat configuration"
	@rm -rf \
		~/.config/weechat/ \
		~/.cache/weechat/ \
		~/.local/share/weechat/
	@echo "[*] uninstalling weechat configuration completed"

