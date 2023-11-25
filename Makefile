install: install-nvchad uninstall-custom install-custom

install-custom:
	mkdir -p ~/.config/nvim/lua/custom/
	cp -r . ~/.config/nvim/lua/custom/

install-nvchad:
	@if [ ! -d ~/.config/nvim/ ]; then \
		git clone https://github.com/NvChad/NvChad.git ~/.config/nvim --depth 1; \
	fi

uninstall-custom:
	rm -rf ~/.config/nvim/lua/custom/

uninstall-nvchad:
	rm -rf \
		~/.cache/nvim/ \
		~/.config/nvim/ \
		~/.local/state/nvim/ \
		~/.local/share/nvim/
