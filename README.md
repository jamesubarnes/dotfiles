# dotfiles

Personal configuration files, managed with [GNU Stow](https://www.gnu.org/software/stow/).

## Contents

- `.zshrc` — Zsh configuration
- `.vimrc` — Vim configuration

## Setup
```sh
brew install stow
cd ~
git clone https://github.com/jamesubarnes/dotfiles.git
stow dotfiles
```

This symlinks everything from `~/dotfiles/` into `~` (e.g. `~/.zshrc -> dotfiles/.zshrc`).

## Adding a new dotfile
```sh
mv ~/.someconfig ~/dotfiles/.someconfig
cd ~ && stow dotfiles
cd ~/dotfiles && git add -A && git commit -m "Add .someconfig"
```

## Removing symlinks
```sh
cd ~
stow -D dotfiles
```
