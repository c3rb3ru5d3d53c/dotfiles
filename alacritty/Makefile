build-alacritty:
	@echo "[-] building alacritty"
	@mkdir -p ./build/
	@git clone -q https://github.com/alacritty/alacritty.git ./build/alacritty
	@cd build/alacritty/ && \
		git checkout -q ${VERSION_ALACRITTY} && \
		cargo build --release
	@echo "[-] building alacritty completed"

install-alacritty: uninstall-alacritty
	@echo "[-] installing alacritty"
	@cp ./build/alacritty/target/release/alacritty /usr/local/bin/alacritty
	@cp ./build/alacritty/extra/logo/alacritty-term.svg /usr/share/pixmaps/Alacritty.svg
	@cp ./build/alacritty/extra/linux/Alacritty.desktop /usr/share/applications/alacritty.desktop
	@echo "[*] installing alacritty completed"

uninstall-alacritty:
	@echo "[-] uninstalling alacritty"
	@rm -f /usr/local/bin/alacritty
	@rm -f /usr/share/pixmaps/Alacritty.svg
	@rm -f /usre/share/applications/alacritty.desktop
	@echo "[*] uninstalling alacritty completed"

install-alacritty-config: uninstall-alacritty-config
	@echo "[-] installing alacritty config"
	@mkdir -p ~/.config/fish/conf.d/
	@mkdir -p ~/.config/alacritty/
	@cp ./build/alacritty/extra/completions/alacritty.fish ~/.config/fish/conf.d/alacritty.fish
	@cp -r ./alacritty/config/* ~/.config/alacritty/
	@echo "[*] installing alacritty config completed"

uninstall-alacritty-config:
	@echo "[-] uninstalling alacritty config"
	@rm -f ~/.config/fish/conf.d/alacritty.fish
	@rm -rf ~/.config/alacritty/
	@echo "[*] uninstalling alacritty config completed"

