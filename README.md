# dotfiles

```shell
# Chezmoi
git clone git@github.com:gehrigkeane/dotfiles.git ~/.local/share/chezmoi
chezmoi apply

# Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew bundle --file ~/.local/share/chezmoi/Brewfile

# Mas
mas install 1554235898 # Peek
```