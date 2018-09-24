# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.dotfiles/oh-my-zsh
# if you want to use this, change your non-ascii font to Droid Sans Mono for Awesome
# POWERLEVEL9K_MODE='awesome-patched'
export ZSH_THEME="powerlevel9k/powerlevel9k"
export TERM="xterm-256color"
# export ZSH_THEME="agnoster"
POWERLEVEL9K_SHORTEN_DIR_LENGTH=2
# https://github.com/bhilburn/powerlevel9k#customizing-prompt-segments
# https://github.com/bhilburn/powerlevel9k/wiki/Stylizing-Your-Prompt
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status history time)
# colorcode test
# for code ({000..255}) print -P -- "$code: %F{$code}This is how your text would look like%f"
POWERLEVEL9K_NVM_FOREGROUND='000'
POWERLEVEL9K_NVM_BACKGROUND='072'
POWERLEVEL9K_SHOW_CHANGESET=true

# Instruct Git + Less to only use pager if necessary: https://stackoverflow.com/questions/51015733/git-branch-end-on-terminal
export LESS=-JMQRiFX

# Which plugins would you like to load? (plugins can be found in ~/.dotfiles/oh-my-zsh/plugins/*)
plugins=(docker git go java kubectl osx scala)

source $ZSH/oh-my-zsh.sh
# Load ZSH Syntax Highlighting:
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# Load ZSH Autosuggestions: https://github.com/zsh-users/zsh-autosuggestions
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Pickup `.shell*` config
source ~/.profile

# In the event of weird up and down behavior try these:
# bindkey '^[[A' up-line-or-search
# bindkey '^[[B' down-line-or-search

# Auto-init pyenv https://github.com/pyenv/pyenv#homebrew-on-mac-os-x
# The following help with python installations: CFLAGS="-I$(xcrun --show-sdk-path)/usr/include" PYTHON_CONFIGURE_OPTS="--enable-unicode=ucs4"
eval "$(pyenv init -)"
