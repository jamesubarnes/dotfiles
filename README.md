# dotfiles

Personal configuration files, managed with [GNU Stow](https://www.gnu.org/software/stow/).

## Contents

- `.gitconfig` — Git configuration
- `.vimrc` — Vim configuration
- `.zshrc` — Zsh configuration

## Setup
```sh
brew install stow
cd ~
git clone https://github.com/jamesubarnes/dotfiles.git
cd dotfiles && stow .
```

This symlinks everything from `~/dotfiles/` into `~` (e.g. `~/.zshrc -> dotfiles/.zshrc`).

## Adding a new dotfile
```sh
mv ~/.someconfig ~/dotfiles/.someconfig
cd ~/dotfiles && stow .
cd ~/dotfiles && git add -A && git commit -m "Add .someconfig"
```

## Removing symlinks
```sh
cd ~/dotfiles
stow -D .
```
