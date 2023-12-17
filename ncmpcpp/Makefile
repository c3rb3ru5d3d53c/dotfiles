install-ncmpcpp-config: uninstall-ncmpcpp-config
	@echo "[-] installing ncmpcpp configuration"
	@mkdir -p ~/Music/PlayLists/
	@mkdir -p ~/.config/mpd/
	@touch ~/.config/mpd/mpd.log
	@touch ~/.config/mpd/mpd.db
	@cp ./mpd/mpd.conf ~/.config/mpd/mpd.conf
	@mkdir -p ~/.config/ncmpcpp/
	@cp -r ./ncmpcpp/config/* ~/.config/ncmpcpp/
	@echo "[*] installing ncmpcpp configuration completed"

uninstall-ncmpcpp-config:
	@echo "[-] uninstalling ncmpcpp configuration"
	@rm -rf ~/.config/mpd/
	@rm -rf ~/.config/ncmpcpp/
	@echo "[*] uninstalling ncmpcpp configuration"
