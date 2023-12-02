all: build-fonts

install: \
	install-fonts \
	install-fzf \
	install-lazygit \
	install-weechat \
	install-kitty \
	install-fish \
	install-youtube-dl \
	install-pyright \
	install-yls \
	install-tmux \
	install-nvim

uninstall: \
	uninstall-nvim \
	uninstall-fzf \
	uinstall-lazygit \
	uninstall-weechat \
	uninstall-tmux \
	uninstall-kitty \
	uninstall-youtube-dl \
	uninstall-pyright \
	uninstall-yls \
	uninstall-tmux \
	uninstall-fish

clean: clean-build

install-lazygit: uninstall-lazygit
	@echo "[-] installing lazygit"
	@mkdir -p ./build/lazygit/
	@wget \
		-qO ./build/lazygit/lazygit_0.40.2_Linux_32-bit.tar.gz \
		https://github.com/jesseduffield/lazygit/releases/download/v0.40.2/lazygit_0.40.2_Linux_32-bit.tar.gz
	@tar -xzf ./build/lazygit/lazygit_0.40.2_Linux_32-bit.tar.gz -C ./build/lazygit/
	@mkdir -p ~/.local/bin/
	@cp ./build/lazygit/lazygit ~/.local/bin/
	@mkdir -p ~/.config/lazygit/
	@cp -r ./lazygit/* ~/.config/lazygit/
	@echo "[*] installing lazygit completed"

uninstall-lazygit:
	@echo "[-] uninstalling lazy-git"
	@rm -f ~/.local/bin/lazygit
	@rm -rf ~/.config/lazygit/
	@echo "[*] uninstalling lazy-git completed"

install-fzf: uninstall-fzf
	@echo "[-] installing fzf"
	@mkdir -p ./build/fzf/
	@wget -qO ./build/fzf/fzf-0.44.1-linux_amd64.tar.gz https://github.com/junegunn/fzf/releases/download/0.44.1/fzf-0.44.1-linux_amd64.tar.gz
	@tar -xzf ./build/fzf/fzf-0.44.1-linux_amd64.tar.gz -C ./build/fzf/
	@chmod +x ./build/fzf/fzf
	@cp ./build/fzf/fzf ~/.local/bin/
	@echo "[*] installing fzf completed"

uninstall-fzf:
	@echo "[-] uninstalling fzf"
	@rm -f ~/.local/bin/fzf
	@echo "[*] uninstalling fzf completed"

install-lf:
	@echo "[-] installing lf"
	@mkdir -p ./build/lf/
	@wget -qO ./build/lf/lf-linux-amd64.tar.gz https://github.com/gokcehan/lf/releases/download/r31/lf-linux-amd64.tar.gz
	@tar -xzf ./build/lf/lf-linux-amd64.tar.gz -C ./build/lf/
	@chmod +x ./build/lf/lf
	@cp ./build/lf/lf ~/.local/bin/lf
	@echo "[*] installing lf completed"

uninstall-lf:
	@echo "[-] uninstalling lf"
	@rm -f ~/.local/bin/lf
	@echo "[-] uninstalling lf completed"

build-alacritty:
	@echo "[-] building alacritty"
	@mkdir -p ./build/
	@git clone -q https://github.com/alacritty/alacritty.git ./build/alacritty
	@cd build/alacritty/ && \
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
	@cp -r ./alacritty/* ~/.config/alacritty/
	@echo "[*] installing alacritty config completed"

uninstall-alacritty-config:
	@echo "[-] uninstalling alacritty config"
	@rm -f ~/.config/fish/conf.d/alacritty.fish
	@rm -rf ~/.config/alacritty/
	@echo "[*] uninstalling alacritty config completed"

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
		pip install -q .
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
	@git clone -q --depth 1 https://github.com/AstroNvim/AstroNvim ~/.config/nvim
	@nvim --headless +q
	@mkdir -p ~/.config/nvim/lua/user/
	@cp -r ./nvim/* ~/.config/nvim/lua/user/
	@nvim --headless +q
	echo "[*] installing nvim completed"

uninstall-nvim:
	@echo "[-] uninstalling nvim"
	@rm -rf \
		~/.cache/nvim/ \
		~/.config/nvim/ \
		~/.local/state/nvim/ \
		~/.local/share/nvim/
	@echo "[*] uninstalling nvim completed"

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
	@wget -qO ./build/bin/lsd/lsd-v1.0.0-i686-unknown-linux-gnu.tar.gz https://github.com/lsd-rs/lsd/releases/download/v1.0.0/lsd-v1.0.0-i686-unknown-linux-gnu.tar.gz
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

