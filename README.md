# dotfiles

```shell
# Get Started
git clone https://github.com/gehrigkeane/dotfiles.git ~/.local/share/chezmoi
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
/opt/homebrew/bin/brew bundle --file ~/.local/share/chezmoi/Brewfile

# Chezmoi
/opt/homebrew/bin/chezmoi apply

# Mas
/opt/homebrew/bin/mas install 1554235898 # Peek
/opt/homebrew/bin/mas install 937984704  # Amphetamine
/opt/homebrew/bin/mas install 1451685025 # WireGuard

# Collect
~/.zsh_history
# ssh keys
# shell secrets
~/.netrc
~/.aws/config
~/.docker/config.json

# TMUX Plugin Manager Install
# Remeber to `<prefix> + I` to install plugins
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```


TODO
- Raycast config
