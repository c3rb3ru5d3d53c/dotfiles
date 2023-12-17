.PHONY: piper

piper:
	@echo "[-] building piper"
	@mkdir -p ./build/piper/
	@wget -qO ./build/piper/piper_linux_x86_64.tar.gz \
		https://github.com/rhasspy/piper/releases/download/${VERSION_PIPER}/piper_linux_x86_64.tar.gz 
	@tar -xzf ./build/piper/piper_linux_x86_64.tar.gz -C ./build/piper/
	@cd ./build/piper/piper/ && \
		GIT_LFS_SKIP_SMUDGE=1 git clone -q https://huggingface.co/rhasspy/piper-voices voices/ && \
		cd voices/ && \
		git lfs pull --include en/en_US/amy/low/en_US-amy-low.onnx
	@echo "[*] building piper completed"

install-piper: uninstall-piper
	@echo "[-] installing piper"
	@mkdir -p ~/.local/bin/.piper/
	@cp -r ./build/piper/piper/* ~/.local/bin/.piper/
	@ln -s ~/.local/bin/.piper/piper ~/.local/bin/piper
	@echo "[*] installing piper completed"

uninstall-piper:
	@echo "[-] uninstalling piper"
	@rm  -rf ~/.local/bin/.piper/
	@rm -f ~/.local/bin/piper
	@echo "[*] uninstalling piper completed"

