.PHONY: i3
.PHONY: polybar

THREADS=1
DATE=$(shell date '+%Y-%m-%d')
USER := $(shell whoami 2>/dev/null)
USER_ID := $(shell id -u ${USER})
GROUP_ID := $(shell id -g ${USER})

VERSION_BAT=0.24.0
VERSION_LAZYGIT=0.40.2
VERSION_FZF=0.44.1
VERSION_LF=r31
VERSION_ALACRITTY=0.12.3
VERSION_LSD=1.0.0
VERSION_I3=4.23
VERSION_AUTOTILING=1.8
VERSION_PIPER=2023.11.14-2
VERSION_OLLAMA=0.1.16
VERSION_POLYBAR=3.7.1

include ./lazygit/Makefile
include ./bat/Makefile
include ./gtk/Makefile
include ./ncmpcpp/Makefile
include ./rofi/Makefile
include ./ollama/Makefile
include ./piper/Makefile
include ./fzf/Makefile
include ./youtube-dl/Makefile
include ./lf/Makefile

clean: clean-build

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

install-nvim: uninstall-nvim
	@echo "[-] installing nvim"
	@git clone -q --depth 1 https://github.com/AstroNvim/AstroNvim ~/.config/nvim
	@nvim --headless +q 2>/dev/null 1>/dev/null
	@mkdir -p ~/.config/nvim/lua/user/
	@cp -r ./nvim/* ~/.config/nvim/lua/user/
	@nvim --headless +q 2>/dev/null 1>/dev/null
	@echo "[*] installing nvim completed"

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
	@mkdir -p ~/.config/tmux/plugins/tmux/
	@cp ./tmux/*.conf ~/.config/tmux/
	@~/.tmux/plugins/tpm/bin/install_plugins 2>/dev/null 1>/dev/null
	@cp ./tmux/plugins/tmux/* ~/.config/tmux/plugins/tmux/
	@echo "[*] installing tmux completed"

install-fish: uninstall-fish
	@echo "[-] installing fish"
	@mkdir -p ~/.config/fish/functions/
	@cp -r ./fish/functions/* ~/.config/fish/functions/
	@curl -s https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish --init-command "set argv --noninteractive" 2>/dev/null 1>/dev/null
	@echo "omf install lambda" | fish 2>/dev/null 1>/dev/null
	@echo "[*] installing fish completed"

install-lsd: uninstall-lsd
	@echo "[-] installing lsd"
	@mkdir -p ./build/bin/lsd/
	@wget -qO ./build/bin/lsd/lsd-v${VERSION_LSD}-i686-unknown-linux-gnu.tar.gz \
		https://github.com/lsd-rs/lsd/releases/download/v${VERSION_LSD}/lsd-v${VERSION_LSD}-i686-unknown-linux-gnu.tar.gz
	@tar -xzf ./build/bin/lsd/lsd-v${VERSION_LSD}-i686-unknown-linux-gnu.tar.gz -C ./build/bin/lsd/
	@chmod +x ./build/bin/lsd/lsd-v${VERSION_LSD}-i686-unknown-linux-gnu/lsd
	@cp ./build/bin/lsd/lsd-v${VERSION_LSD}-i686-unknown-linux-gnu/lsd ~/.local/bin/lsd
	@echo "[*] installing lsd completed"

uninstall-lsd:
	@echo "[-] uninstalling lsd"
	@rm -f ~/.local/bin/lsd
	@echo "[*] uninstalling lsd completed"

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

install-autotiling: uninstall-autotiling
	@echo "[-] installing autotiling"
	@mkdir -p ~/.local/bin/.autotiling/
	@cd ~/.local/bin/.autotiling/ && \
		virtualenv -q -p python3 venv && \
		. venv/bin/activate && \
		pip install -q autotiling==${VERSION_AUTOTILING}
	@ln -s ~/.local/bin/.autotiling/venv/bin/autotiling ~/.local/bin/autotiling
	@echo "[*] installing autotiling completed"

uninstall-autotiling:
	@echo "[-] uninstalling autotiling"
	@rm -rf ~/.local/bin/.autotiling/
	@rm -f ~/.local/bin/autotiling
	@echo "[*] uninstalling autotiling completed"

uninstall-pyright:
	@echo "[-] uninstalling pyright"
	@rm -rf ~/.local/bin/.pyright/
	@rm -f ~/.local/bin/pyright-langserver
	@echo "[*] uninstalling pyright completed"

build-polybar:
	@echo "[-] building polybar"
	@mkdir -p ./build/polybar/
	@wget -qO ./build/polybar/polybar-${VERSION_POLYBAR}.tar.gz \
		https://github.com/polybar/polybar/releases/download/${VERSION_POLYBAR}/polybar-${VERSION_POLYBAR}.tar.gz
	@tar -xzf ./build/polybar/polybar-${VERSION_POLYBAR}.tar.gz -C ./build/polybar/
	@cd ./build/polybar/polybar-${VERSION_POLYBAR}/ && \
		mkdir -p build/ && \
		cd build/ && \
		cmake \
    	-DCMAKE_CXX_COMPILER="g++" \
    	-DENABLE_ALSA:BOOL="ON" \
    	-DENABLE_PULSEAUDIO:BOOL="ON" \
    	-DENABLE_I3:BOOL="ON" \
    	-DENABLE_MPD:BOOL="ON" \
    	-DENABLE_NETWORK:BOOL="ON" \
    	-DENABLE_CURL:BOOL="ON" \
    	-DBUILD_POLYBAR_MSG:BOOL="ON" \
    	-DWITH_XCURSOR="OFF" \
    	.. && \
    	make -j${THREADS}
	@echo "[*] building polybar completed"

install-polybar:
	@echo "[*] installing polybar"
	@cp ./build/polybar/polybar-${VERSION_POLYBAR}/build/bin/polybar \
		~/.local/bin/polybar
	@cp ./build/polybar/polybar-${VERSION_POLYBAR}/build/bin/polybar-msg \
		~/.local/bin/polybar-msg
	@echo "[*] installing polybar completed"

install-polybar-config:
	@echo "[-] installing polybar configuration"
	@mkdir -p ~/.config/polybar/
	@cp ./polybar/config/config.ini ~/.config/polybar/config.ini
	@echo "[*] installing polybar configuration completed"

uninstall-polybar:
	@echo "[-] uninstalling polybar"
	@rm -f ~/.local/bin/polybar
	@rm -f ~/.local/bin/polybar-msg
	@echo "[*] uninstalling polybar completed"

polybar:
	@docker image inspect polybar:${VERSION_POLYBAR} 1>/dev/null 2>/dev/null && \
		docker run \
		--rm \
		-u ${USER_ID}:${GROUP_ID} \
		-v ${PWD}:${PWD} \
		-it polybar:${VERSION_POLYBAR} bash -c "cd ${PWD}; make build-polybar" || \
		docker build \
		--build-arg THREADS=${THREADS} \
		--build-arg VERSION=${VERSION_POLYBAR} \
		-t polybar:${VERSION_POLYBAR} ./polybar/

install-fonts:
	@echo "[-] installing fonts"
	@rm -rf ./build/fonts/
	@mkdir -p ./build/fonts/
	@wget -qO ./build/fonts/DroidSansMono.zip https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/DroidSansMono.zip	
	@cd ./build/fonts/ && \
		unzip -q DroidSansMono.zip -d . && \
		rm -rf *.md *.zip *.txt
	@mkdir -p ~/.fonts/
	@cp ./build/fonts/* ~/.fonts/
	@fc-cache -f
	@echo "[*] installing fonts completed"

build-i3:
	@echo "[-] building i3"
	@mkdir -p ./build/i3/
	@rm -rf ./build/i3/
	@git clone -q https://github.com/i3/i3.git ./build/i3/src/
	@cd ./build/i3/src/ && \
		git checkout -q ${VERSION_I3}; \
		dpkg-buildpackage -sa -j${THREADS}
	@echo "[*] building i3 completed"

install-i3-config: uninstall-i3-config install-autotiling
	@echo "[-] installing i3 configuration"
	@mkdir -p ~/.config/i3/
	@cp -r ./i3/config/. ~/.config/i3/
	@echo "[*] installing i3 configuration completed"

uninstall-i3-config:
	@echo "[-] uninstalling i3 configuration"
	@rm -rf ~/.config/i3/
	@echo "[*] uninstalling i3 configuration completed"

install-i3: uninstall-i3
	@cd ./build/i3/ && \
		apt install -y ./i3-wm_4.22-1_amd64.deb

uninstall-i3:
	@apt autoremove -y i3-wm

i3:
	@docker image inspect i3:${VERSION_I3} 1>/dev/null 2>/dev/null && \
		docker run \
		--rm \
		-u ${USER_ID}:${GROUP_ID} \
		-v ${PWD}:${PWD} \
		-it i3:${VERSION_I3} bash -c "cd ${PWD}; make build-i3" || \
		docker build \
		--build-arg THREADS=${THREADS} \
		--build-arg VERSION=${VERSION_I3} \
		-t i3:${VERSION_I3} ./i3/

clean-build:
	rm -rf ./build/

clean-fonts:
	rm -rf ./build/fonts/

clean-docker:
	@docker stop $(shell docker ps -a -q) 2>/dev/null || true
	@docker rm $(shell docker ps -a -q) 2>/dev/null || true
	@docker rmi $(shell docker images -a -q) 2>/dev/null || true
