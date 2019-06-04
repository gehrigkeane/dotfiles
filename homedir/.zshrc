#
# Env
#
export TERM="xterm-256color"
export LESS=-JMQRiFX

#
# Plugins
#

zplug "djui/alias-tips"                       # https://github.com/djui/alias-tips

#
# Oh My Zsh Plugins (via zplug)
#

zplug "plugins/brew",   from:oh-my-zsh
zplug "plugins/docker",   from:oh-my-zsh
zplug "plugins/git",   from:oh-my-zsh
zplug "plugins/go",   from:oh-my-zsh
zplug "plugins/java",   from:oh-my-zsh
zplug "plugins/kubectl",   from:oh-my-zsh
zplug "plugins/osx",   from:oh-my-zsh
zplug "plugins/python",   from:oh-my-zsh
zplug "plugins/scala",   from:oh-my-zsh


#
# Themes
#

# Spaceship Theme
# zplug denysdovhan/spaceship-prompt, use:spaceship.zsh, from:github, as:theme

# Powerlevel 9k
# https://github.com/bhilburn/powerlevel9k#customizing-prompt-segments
# https://github.com/bhilburn/powerlevel9k/wiki/Stylizing-Your-Prompt
POWERLEVEL9K_SHORTEN_DIR_LENGTH=2
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status history time)
POWERLEVEL9K_NVM_FOREGROUND='000'                                              # colorcode test
POWERLEVEL9K_NVM_BACKGROUND='072'                                              # for code ({000..255}) print -P -- "$code: %F{$code}This is how your text would look like%f"
POWERLEVEL9K_SHOW_CHANGESET=true
zplug "bhilburn/powerlevel9k", use:powerlevel9k.zsh-theme


source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# Load ZSH Autosuggestions: https://github.com/zsh-users/zsh-autosuggestions
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh

#
# Source `.shell*` configuration
#

source ~/.profile


#
# En fin
#

# In the event of weird up and down behavior try these:
# bindkey '^[[A' up-line-or-search
# bindkey '^[[B' down-line-or-search

# Auto-init pyenv https://github.com/pyenv/pyenv#homebrew-on-mac-os-x
# The following help with python installations: CFLAGS="-I$(xcrun --show-sdk-path)/usr/include" PYTHON_CONFIGURE_OPTS="--enable-unicode=ucs4"
eval "$(pyenv init -)"
eval "$(pipenv --completion)"
