all: build-fonts build-yls build-pyright

install: install-fonts install-tmux install-nvchad install-nvim

uninstall: uninstall-nvim uninstall-tmux

clean: clean-build

install-nvim: uninstall-nvim
	@echo "[-] installing nvim"
	@mkdir -p ~/.config/nvim/lua/custom/
	@cp -r ./nvim/* ~/.config/nvim/lua/custom/
	@echo "[*] installing nvim completed"

install-nvchad:
	@echo "[-] installing nvchad"
	@if [ ! -d ~/.config/nvim/ ]; then \
		git clone -q https://github.com/NvChad/NvChad.git ~/.config/nvim --depth 1; \
		echo "[*] installing nvchad completed"; \
	else \
		echo "[*] installing nvchad completed"; \
	fi

install-tmux:
	@echo "[-] installing tmux"
	@git clone -q https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
	@mkdir -p ~/.config/tmux/
	@cp ./tmux/tmux.conf ~/.config/tmux/tmux.conf
	@echo "[*] installing tmux completed"

uninstall-tmux:
	@echo "[-] uninstalling tmux"
	@rm -rf \
		~/.config/tmux/ \
		~/.tmux/
	@rm -f ~/.tmux.conf
	@echo "[-] uninstalling tmux completed"

build-yls:
	@echo "[-] building yara language server"
	@git clone -q https://github.com/avast/yls.git build/bin/yls/
	@cd build/bin/yls/ && \
		virtualenv -q -p python3 venv && \
		. venv/bin/activate && \
		pip install -q .
	@echo "[*] building yara language server completed"

build-pyright:
	@echo "[-] building pyright language server"
	@mkdir -p ./build/bin/pyright/
	@cd ./build/bin/pyright/ && \
		virtualenv -q -p python3 venv && \
		. venv/bin/activate && \
		pip install -q pyright
	@echo "[*] building pyright language server completed"

build-fonts:
	@echo "[-] building fonts"
	@mkdir -p ./build/fonts/
	@wget -qO ./build/fonts/DroidSansMono.zip https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/DroidSansMono.zip	
	@cd ./build/fonts/ && \
		unzip -q DroidSansMono.zip -d . && \
		rm -rf *.md *.zip *.txt
	@echo "[*] building fonts completed"

install-fonts:
	@echo "[-] installing fonts"
	@mkdir -p ~/.fonts/
	@cd ./build/fonts/ && \
		cp -r . ~/fonts/
	@fc-cache -f
	@echo "[*] installing fonts completed"

clean-yls:
	rm -rf ./build/bin/yls/

clean-pyright:
	rm -rf ./build/bin/pyright/

clean-build:
	rm -rf ./build/

clean-fonts:
	rm -rf ./build/fonts/

uninstall-nvim:
	@echo "[-] uninstalling nvim"
	@rm -rf ~/.config/nvim/lua/custom/
	@echo "[*] uninstalling nvim completed"

uninstall-nvchad:
	rm -rf \
		~/.cache/nvim/ \
		~/.config/nvim/ \
		~/.local/state/nvim/ \
		~/.local/share/nvim/
