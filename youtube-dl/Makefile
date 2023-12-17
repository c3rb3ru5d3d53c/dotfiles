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

