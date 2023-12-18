build-yls:
	@echo "[-] building yls"
	@git clone -q https://github.com/avast/yls.git ~/.local/bin/.yls
	@cd ~/.local/bin/.yls/ && \
		virtualenv -q -p python3 venv && \
		. venv/bin/activate && \
		pip install -q .
	@echo "[-] building yls completed"
	
install-yls:
	@echo "[-] installing yls"
	@ln -s ~/.local/bin/.yls/venv/bin/yls ~/.local/bin/yls
	@echo "[*] installing yls completed"

uninstall-yls:
	@echo "[-] uninstalling yls"
	@rm -rf ~/.local/bin/.yls/
	@rm -f ~/.local/bin/yls
	@echo "[*] uninstalling yls completed"

