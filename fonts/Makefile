build-fonts:
	@echo "[-] building fonts"
	@rm -rf ./build/fonts/
	@mkdir -p ./build/fonts/
	@wget -qO ./build/fonts/DroidSansMono.zip https://github.com/ryanoasis/nerd-fonts/releases/download/v${VERSION_NERDFONTS}/DroidSansMono.zip	
	@cd ./build/fonts/ && \
		unzip -q DroidSansMono.zip -d . && \
		rm -rf *.md *.zip *.txt
	@echo "[*] building fonts completed"

install-fonts:
	@echo "[-] installing fonts"
	@mkdir -p ~/.fonts/
	@cp ./build/fonts/* ~/.fonts/
	@fc-cache -f
	@echo "[*] installing fonts completed"

