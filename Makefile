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
VERSION_PYRIGHT=1.1.341
VERSION_NERDFONTS=3.0.2

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
include ./weechat/Makefile
include ./kitty/Makefile
include ./tmux/Makefile
include ./lsd/Makefile
include ./yls/Makefile
include ./pyright/Makefile
include ./polybar/Makefile
include ./autotiling/Makefile
include ./scripts/Makefile
include ./fonts/Makefile
include ./alacritty/Makefile
include ./nvim/Makefile
include ./fish/Makefile
include ./i3/Makefile

clean: clean-build

clean-build:
	rm -rf ./build/

clean-docker:
	@docker stop $(shell docker ps -a -q) 2>/dev/null || true
	@docker rm $(shell docker ps -a -q) 2>/dev/null || true
	@docker rmi $(shell docker images -a -q) 2>/dev/null || true
