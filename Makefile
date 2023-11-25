install: uninstall
	mkdir -p ~/.config/nvim/lua/custom/
	cp -r . ~/.config/nvim/lua/custom/

uninstall:
	rm -rf ~/.config/nvim/lua/custom/
