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

### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

### End of Zinit's installer chunk

# zinit ice wait atinit"zpcompinit; zpcdreplay"                               # https://github.com/zdharma-continuum/fast-syntax-highlighting
zinit light zdharma-continuum/fast-syntax-highlighting

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'                                          # https://github.com/zsh-users/zsh-autosuggestions
# zinit ice wait atload"_zsh_autosuggest_start"
zinit light zsh-users/zsh-autosuggestions

zinit light djui/alias-tips                                                   # https://github.com/djui/alias-tips

#zinit light mattbangert/kubectl-zsh-plugin
zinit snippet https://github.com/gehrigkeane/zsh_plugins/blob/master/kubectl.zsh.plugin

# Regenerate kubectl completion via `kubectl completion zsh > _kubectl`
zinit ice as"completion"
zinit snippet https://github.com/gehrigkeane/zsh_plugins/blob/master/_kubectl

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
# https://github.com/zdharma/zinit/issues/367
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

# FZF
# Note: the following is stems from the `/usr/local/opt/fzf/install` executable
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
