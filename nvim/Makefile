install-nvim-config: uninstall-nvim-config
	@echo "[-] installing nvim"
	@git clone -q --depth 1 https://github.com/AstroNvim/template ~/.config/nvim
	@nvim --headless +q 2>/dev/null 1>/dev/null
	@mkdir -p ~/.config/nvim/lua/user/
	@cp -r ./nvim/config/* ~/.config/nvim/lua/user/
	@nvim --headless +q 2>/dev/null 1>/dev/null
	@echo "[*] installing nvim completed"

uninstall-nvim-config:
	@echo "[-] uninstalling nvim"
	@rm -rf \
		~/.cache/nvim/ \
		~/.config/nvim/ \
		~/.local/state/nvim/ \
		~/.local/share/nvim/
	@echo "[*] uninstalling nvim completed"

