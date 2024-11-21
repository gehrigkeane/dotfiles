# dotfiles

```shell
# Get Started
git clone https://github.com/gehrigkeane/dotfiles.git ~/.local/share/chezmoi
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew bundle --file ~/.local/share/chezmoi/Brewfile

# Chezmoi
chezmoi apply

# Mas
mas install 1554235898 # Peek
```