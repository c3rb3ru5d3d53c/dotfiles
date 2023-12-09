# Dotfiles

Personal Dotfiles

## Install

```bash
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt update
sudo apt install -y \
    colortest \
    hugo \
    chafa \
    weechat \
    fish \
    mpd \
    ncmpcpp \
    neovim \
    clangd \
    python-is-python3 \
    python3-pip \
    python3-venv \
    npm
git clone https://github.com/c3rb3ru5d3d53c/dotfiles.git
cd dotfiles/
make install
```

## Optional

Installation of optional applications

### Alacritty Install

```bash
make build-alacritty
sudo make install-alacritty
make install-alacritty-config
```

### Alacritty Uninstall
```bash
sudo make uninstall-alacritty
make uninstall-alacritty-config
```

## Uninstall
```bash
make uninstall
```

