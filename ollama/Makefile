.PHONY: ollama

ollama:
	@echo "[-] building ollama"
	@mkdir -p ./build/ollama/
	@wget -qO ./build/ollama/ollama \
		https://github.com/jmorganca/ollama/releases/download/v${VERSION_OLLAMA}/ollama-linux-amd64
	@chmod +x ./build/ollama/ollama 
	@echo "[*] building ollama completed"

install-ollama:
	@echo "[-] installing ollama"
	@mkdir -p ~/.local/bin/
	@cp ./build/ollama/ollama ~/.local/bin/ollama
	@echo "[*] installing ollama completed"

uinstall-ollama:
	@echo "[-] uninstalling olamma"
	@rm -f ~/.local/bin/ollama
	@echo "[*] uninstalling ollama completed"

