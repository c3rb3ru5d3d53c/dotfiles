build-pyright:
	@echo "[-] building pyright"
	@mkdir -p ~/.local/bin/.pyright/
	@cd ~/.local/bin/.pyright/ && \
		virtualenv -q -p python3 venv && \
		. venv/bin/activate && \
		pip install -q pyright==${VERSION_PYRIGHT}
	@echo "[*] building pyright completed"

install-pyright:
		@echo "[-] installing pyright"
		@ln -s ~/.local/bin/.pyright/venv/bin/pyright-langserver ~/.local/bin/pyright-langserver
		@echo "[*] installing pyright completed"

uninstall-pyright:
	@echo "[-] uninstalling pyright"
	@rm -rf ~/.local/bin/.pyright/
	@rm -f ~/.local/bin/pyright-langserver
	@echo "[*] uninstalling pyright completed"

