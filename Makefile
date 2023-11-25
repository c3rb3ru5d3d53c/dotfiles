all: build-fonts build-yls build-pyright

install: install-fonts install-nvchad install-config

uninstall: uninstall-config

clean: clean-bin clean-fonts

install-config: uninstall-config
	@echo "[-] installing configuration"
	@mkdir -p ~/.config/nvim/lua/custom/
	@cp -r . ~/.config/nvim/lua/custom/
	@echo "[*] installing configuration completed"

install-nvchad:
	@echo "[-] installing nvchad"
	@if [ ! -d ~/.config/nvim/ ]; then \
		git clone -q https://github.com/NvChad/NvChad.git ~/.config/nvim --depth 1; \
		echo "[*] installing nvchad completed"; \
	else \
		echo "[*] installing nvchad completed"; \
	fi

build-yls:
	@echo "[-] building yara language server"
	@git clone -q https://github.com/avast/yls.git bin/yls/
	@cd bin/yls/ && \
		virtualenv -q -p python3 venv && \
		. venv/bin/activate && \
		pip install -q .
	@echo "[*] building yara language server completed"

build-pyright:
	@echo "[-] building pyright language server"
	@mkdir -p bin/pyright/
	@cd bin/pyright/ && \
		virtualenv -q -p python3 venv && \
		. venv/bin/activate && \
		pip install -q pyright
	@echo "[*] building pyright language server completed"

build-fonts:
	@echo "[-] building fonts"
	@mkdir -p fonts/
	@wget -qO fonts/DroidSansMono.zip https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/DroidSansMono.zip	
	@cd fonts/ && \
		unzip -q DroidSansMono.zip -d . && \
		rm -rf *.md *.zip *.txt
	@echo "[*] building fonts completed"

install-fonts:
	@echo "[-] installing fonts"
	@mkdir -p ~/.fonts/
	@cd fonts/ && \
		cp -r . ~/fonts/
	@fc-cache -f
	@echo "[*] installing fonts completed"

clean-yls:
	rm -rf bin/yls/

clean-pyright:
	rm -rf bin/pyright/

clean-bin:
	rm -rf bin/

clean-fonts:
	rm -rf fonts/

uninstall-config:
	@rm -rf ~/.config/nvim/lua/custom/

uninstall-nvchad:
	rm -rf \
		~/.cache/nvim/ \
		~/.config/nvim/ \
		~/.local/state/nvim/ \
		~/.local/share/nvim/
