#
# Gehrig Keane: https://github.com/gehrigkeane
#
# References:
#   https://github.com/zdharma/zinit
#   https://esham.io/2018/02/zsh-profiling

# Patch ZSH word boundaries per https://stackoverflow.com/a/1438523
autoload -U select-word-style
select-word-style bash

#
# Env
#
# . /usr/local/opt/asdf/asdf.sh

export TERM="xterm-256color"
export LESS=-JMQRiFX

# Long running commands should print timing information
# https://github.com/unixorn/zsh-quickstart-kit/blob/master/zsh/.zshrc
REPORTTIME=10
TIMEFMT="%U user %S system %P cpu %*Es total"

#
# Plugins
#

# Brew completions
# ref: https://docs.brew.sh/Shell-Completion#configuring-completions-in-zsh
FPATH=/usr/local/share/zsh/site-functions:$FPATH

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# zinit ice wait atinit"zpcompinit; zpcdreplay"                               # https://github.com/zdharma/fast-syntax-highlighting
zinit light zdharma/fast-syntax-highlighting

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'                                          # https://github.com/zsh-users/zsh-autosuggestions
# zinit ice wait atload"_zsh_autosuggest_start"
zinit light zsh-users/zsh-autosuggestions

zinit light djui/alias-tips                                                   # https://github.com/djui/alias-tips
zinit light gehrigkeane/zsh_plugins

#
# Oh My Zsh Plugins (via zinit)
#

# https://python-poetry.org/docs/#enable-tab-completion-for-bash-fish-or-zsh
# poetry completions zsh > ~/.zfunc/_poetry
fpath+=~/.zfunc

# completions are failing somewhere
# https://github.com/eddiezane/lunchy/issues/57#issuecomment-121173592
autoload bashcompinit
bashcompinit

zinit snippet OMZ::lib/key-bindings.zsh
zinit snippet OMZ::lib/history.zsh
zinit snippet OMZ::lib/git.zsh
zinit snippet OMZ::plugins/brew/brew.plugin.zsh                               # https://github.com/robbyrussell/oh-my-zsh/tree/master/plugins/brew

# https://github.com/zdharma/zinit/issues/382#issuecomment-660521300
zinit lucid has'docker' for \
  as'completion' is-snippet \
  'https://github.com/docker/cli/blob/master/contrib/completion/zsh/_docker' \
  \
  as'completion' is-snippet \
  'https://github.com/docker/compose/blob/master/contrib/completion/zsh/_docker-compose'

zinit snippet OMZ::plugins/git/git.plugin.zsh                                 # https://github.com/robbyrussell/oh-my-zsh/tree/master/plugins/git

#
# Themes
#

# Spaceship Theme
# zplug denysdovhan/spaceship-prompt, use:spaceship.zsh, from:github, as:theme

# Powerlevel 9k
# https://github.com/bhilburn/powerlevel9k#customizing-prompt-segments
# https://github.com/bhilburn/powerlevel9k/wiki/Stylizing-Your-Prompt
# POWERLEVEL9K_MODE='awesome-patched'
POWERLEVEL9K_SHORTEN_DIR_LENGTH=2
POWERLEVEL9K_COMMAND_EXECUTION_TIME_THRESHOLD=0
POWERLEVEL9K_COMMAND_EXECUTION_TIME_PRECISION=3
POWERLEVEL9K_COMMAND_EXECUTION_TIME_FOREGROUND='black'
POWERLEVEL9K_COMMAND_EXECUTION_TIME_BACKGROUND='072'
POWERLEVEL9K_EXECUTION_TIME_ICON='Δ'
POWERLEVEL9K_BACKGROUND_JOBS_VERBOSE=false
POWERLEVEL9K_BACKGROUND_JOBS_BACKGROUND=none
POWERLEVEL9K_BACKGROUND_JOBS_VISUAL_IDENTIFIER_COLOR=002
POWERLEVEL9K_BACKGROUND_JOBS_ICON='⇶'
POWERLEVEL9K_VCS_INCOMING_CHANGES_ICON='⇣'
POWERLEVEL9K_VCS_OUTGOING_CHANGES_ICON='⇡'
POWERLEVEL9K_SHOW_CHANGESET=true

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir dir_writable vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status command_execution_time background_jobs history time)
zinit ice depth=1; zinit light romkatv/powerlevel10k

#
# En fin
#

setopt hist_expire_dups_first
setopt hist_ignore_all_dups
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_reduce_blanks
setopt hist_save_no_dups
setopt hist_verify

# Patch ZSH key bindings per https://stackoverflow.com/a/29403520
bindkey "^U" backward-kill-line
bindkey "^X\\x7f" backward-kill-line
bindkey "^X^_" redo

#
# Source `.shell*` configuration
#

source ~/.profile
. /usr/local/opt/asdf/asdf.sh

# In the event of weird up and down behavior try these:
# bindkey '^[[A' up-line-or-search
# bindkey '^[[B' down-line-or-search

# NVM is painfully slow...
function init_nvm(){
  export NVM_DIR="$HOME/.nvm"
  [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/usr/local/opt/nvm/etc/bash_completion" ] && . "/usr/local/opt/nvm/etc/bash_completion"  # This loads nvm bash_completion
}
