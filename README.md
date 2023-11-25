# NeoVim Config

Personal NeoVim configuration.

## Deps

```bash
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt update
sudo apt install -y neovim clangd python-is-python3 python3-pip python3-venv npm
sudo pip install pyright
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/DroidSansMono.zip
unzip DroidSansMono.zip -d ~/.fonts/
fc-cache -fv
```

## Install

```bash
git clone https://github.com/c3rb3ru5d3d53c/nvim.git
cd nvim/
make install
```

