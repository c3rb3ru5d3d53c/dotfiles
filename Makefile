all: build-fonts

install: \
	install-fonts \
	install-weechat \
	install-kitty \
	install-fish \
	install-youtube-dl \
	install-pyright \
	install-yls \
	install-tmux \
	install-nvchad \
	install-nvim

uninstall: \
	uninstall-nvim \
	uninstall-weechat \
	uninstall-tmux \
	uninstall-kitty \
	uninstall-youtube-dl \
	uninstall-pyright \
	uninstall-yls \
	uninstall-tmux \
	uninstall-fish

clean: clean-build

install-weechat: uninstall-weechat
	@echo "[-] installing weechat"
	@mkdir -p ~/.config/weechat/
	@cp -r ./weechat/* ~/.config/weechat/
	@echo "[*] installing weechat completed"

uninstall-weechat:
	@echo "[-] uninstalling weechat"
	@rm -rf \
		~/.config/weechat/ \
		~/.cache/weechat/ \
		~/.local/share/weechat/
	@echo "[*] uninstalling weechat completed"

install-youtube-dl: uninstall-youtube-dl
	@echo "[-] installing youtube-dl"
	@mkdir -p ~/.local/bin/
	@git clone -q https://github.com/ytdl-org/youtube-dl.git ~/.local/bin/.youtube-dl
	@cd ~/.local/bin/.youtube-dl/ && \
		virtualenv -q -p python3 venv && \
		. venv/bin/activate && \
		pip install .
	@ln -s ~/.local/bin/.youtube-dl/venv/bin/youtube-dl ~/.local/bin/youtube-dl
	@echo "[*] installing youtube-dl completed"

uninstall-youtube-dl:
	@echo "[-] uninstalling youtube-dl"
	@rm -rf ~/.local/bin/.youtube-dl/
	@rm -f ~/.local/bin/youtube-dl
	@echo "[*] uninstalling youtube-dl completed"

install-ncmpcpp: uninstall-ncmpcpp
	@echo "[-] installing ncmpcpp"
	@mkdir -p ~/Music/PlayLists/
	@mkdir -p ~/.config/mpd/
	@touch ~/.config/mpd/mpd.log
	@touch ~/.config/mpd/mpd.db
	@cp ./mpd/mpd.conf ~/.config/mpd/mpd.conf
	@mkdir -p ~/.config/ncmpcpp/
	@cp -r ./ncmpcpp/* ~/.config/ncmpcpp/
	@echo "[*] installing ncmpcpp completed"

uninstall-ncmpcpp:
	@echo "[-] uninstalling ncmpcpp"
	@rm -rf ~/.config/mpd/
	@rm -rf ~/.config/ncmpcpp/
	@echo "[*] uninstalling ncmpcpp"

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

install-kitty: uninstall-kitty
	@echo "[-] installing kitty"
	@mkdir -p ~/.config/kitty/
	@cp ./kitty/kitty.conf ~/.config/kitty/kitty.conf
	@echo "[*] installing kitty completed"

uninstall-kitty:
	@echo "[-] uninstalling kitty"
	@rm -rf ~/.config/kitty/
	@echo "[*] uninstalling kitty completed"

install-tmux: uninstall-tmux
	@echo "[-] installing tmux"
	@git clone -q https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
	@mkdir -p ~/.config/tmux/
	@cp ./tmux/tmux.conf ~/.config/tmux/tmux.conf
	@echo "[*] installing tmux completed"

install-fish: uninstall-fish
	@echo "[-] installing fish"
	@mkdir -p ~/.config/fish/functions/
	@cp -r ./fish/functions/* ~/.config/fish/functions/
	@curl -s https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish --init-command "set argv --noninteractive"
	@echo "omf install lambda" | fish
	@mkdir -p ./build/bin/lsd/
	@wget -O ./build/bin/lsd/lsd-v1.0.0-i686-unknown-linux-gnu.tar.gz https://github.com/lsd-rs/lsd/releases/download/v1.0.0/lsd-v1.0.0-i686-unknown-linux-gnu.tar.gz
	@tar -xzvf ./build/bin/lsd/lsd-v1.0.0-i686-unknown-linux-gnu.tar.gz -C ./build/bin/lsd/
	@chmod +x ./build/bin/lsd/lsd-v1.0.0-i686-unknown-linux-gnu/lsd
	@cp ./build/bin/lsd/lsd-v1.0.0-i686-unknown-linux-gnu/lsd ~/.local/bin/lsd
	@echo "[*] installing fish completed"

uninstall-fish:
	@echo "[-] uninstalling fish"
	@rm -rf \
		~/.config/fish/functions/ \
		~/.local/share/omf/ \
		~/.cache/omf/ \
		~/.config/omf/
	@rm -f ~/.config/fish/conf.d/omf.fish
	@echo "[*] uninstalling fish completed"

uninstall-tmux:
	@echo "[-] uninstalling tmux"
	@rm -rf \
		~/.config/tmux/ \
		~/.tmux/
	@rm -f ~/.tmux.conf
	@echo "[-] uninstalling tmux completed"

install-yls: uninstall-yls
	@echo "[-] installing yls"
	@git clone -q https://github.com/avast/yls.git ~/.local/bin/.yls
	@cd ~/.local/bin/.yls/ && \
		virtualenv -q -p python3 venv && \
		. venv/bin/activate && \
		pip install -q .
	@ln -s ~/.local/bin/.yls/venv/bin/yls ~/.local/bin/yls
	@echo "[*] installing yls completed"

uninstall-yls:
	@echo "[-] uninstalling yls"
	@rm -rf ~/.local/bin/.yls/
	@rm -f ~/.local/bin/yls
	@echo "[*] uninstalling yls completed"

install-pyright: uninstall-pyright
	@echo "[-] building pyright language server"
	@mkdir -p ~/.local/bin/.pyright/
	@cd ~/.local/bin/.pyright/ && \
		virtualenv -q -p python3 venv && \
		. venv/bin/activate && \
		pip install -q pyright
	@ln -s ~/.local/bin/.pyright/venv/bin/pyright-langserver ~/.local/bin/pyright-langserver
	@echo "[*] building pyright language server completed"

uninstall-pyright:
	@echo "[-] uninstalling pyright"
	@rm -rf ~/.local/bin/.pyright/
	@rm -f ~/.local/bin/pyright-langserver
	@echo "[*] uninstalling pyright completed"

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
