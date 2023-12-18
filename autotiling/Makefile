build-autotiling:
	@echo "[-] building autotiling"
	@mkdir -p ~/.local/bin/.autotiling/
	@cd ~/.local/bin/.autotiling/ && \
		virtualenv -q -p python3 venv && \
		. venv/bin/activate && \
		pip install -q autotiling==${VERSION_AUTOTILING}
	@echo "[*] building autotiling completed"

install-autotiling:
	@echo "[-] installing autotiling"
	@ln -s ~/.local/bin/.autotiling/venv/bin/autotiling ~/.local/bin/autotiling
	@echo "[*] installing autotiling completed"

uninstall-autotiling:
	@echo "[-] uninstalling autotiling"
	@rm -rf ~/.local/bin/.autotiling/
	@rm -f ~/.local/bin/autotiling
	@echo "[*] uninstalling autotiling completed"

