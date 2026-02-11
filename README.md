# dotfiles

Personal configuration files, managed with [GNU Stow](https://www.gnu.org/software/stow/).

## Contents

- `.gitconfig` — Git configuration
- `.vimrc` — Vim configuration
- `.zshrc` — Zsh configuration
- `ghostty/` — [Ghostty](https://ghostty.org/) terminal configuration
- `starship/` — [Starship](https://starship.rs/) prompt configuration

## Setup
```sh
brew install stow
cd ~
git clone https://github.com/jamesubarnes/dotfiles.git
cd dotfiles && stow . ghostty starship
```

Top-level dotfiles (`.vimrc`, `.zshrc`, `.gitconfig`) are stowed via `stow .`. Subdirectories like `ghostty/` and `starship/` are separate stow packages that mirror the `~/.config/` tree and are stowed by name. The `.stow-local-ignore` file prevents `stow .` from touching the package subdirectories.

## Adding a new dotfile
```sh
# Top-level dotfile
mv ~/.someconfig ~/dotfiles/.someconfig
cd ~/dotfiles && stow .

# XDG config (e.g. ~/.config/foo/config)
mkdir -p ~/dotfiles/foo/.config/foo
mv ~/.config/foo/config ~/dotfiles/foo/.config/foo/config
echo 'foo' >> ~/dotfiles/.stow-local-ignore
cd ~/dotfiles && stow foo
```

## Removing symlinks
```sh
cd ~/dotfiles
stow -D . ghostty starship
```
