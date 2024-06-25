#
# Gehrig Keane: https://github.com/gehrigkeane
#
# References:
#   https://github.com/zdharma/zinit
#   https://esham.io/2018/02/zsh-profiling

#
# Config
#
# Patch ZSH word boundaries per https://stackoverflow.com/a/1438523
autoload -U select-word-style
select-word-style bash

export TERM="xterm-256color"
export LESS=-JMQRiFX

# Long running commands should print timing information
# https://github.com/unixorn/zsh-quickstart-kit/blob/master/zsh/.zshrc
REPORTTIME=10
TIMEFMT="%U user %S system %P cpu %*Es total"

#
# Brew completions
#
# ref: https://docs.brew.sh/Shell-Completion#configuring-completions-in-zsh
FPATH=/usr/local/share/zsh/site-functions:$FPATH

#
# zinit install
#
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

#
# Plugins
#

# kubectl completions
# Regenerate kubectl completion via `kubectl completion zsh > _kubectl`
zinit snippet https://github.com/gehrigkeane/zsh_plugins/blob/master/kubectl.zsh.plugin
zinit ice lucid as'completion'
zinit snippet https://github.com/gehrigkeane/zsh_plugins/blob/master/_kubectl

# docker completions
# https://github.com/zdharma/zinit/issues/382#issuecomment-660521300
# https://github.com/zdharma/zinit/issues/367
zinit lucid has'docker' for \
  as'completion' is-snippet \
  'https://github.com/docker/cli/blob/master/contrib/completion/zsh/_docker' \
  # \
  # as'completion' is-snippet \
  # 'https://github.com/docker/compose/blob/master/contrib/completion/zsh/_docker-compose'


#
# Compinit
#
autoload -U +X bashcompinit && bashcompinit
autoload -Uz compinit && compinit


#
# Terraform completions
#
complete -o nospace -C "$(which terraform)" terraform

zinit snippet OMZ::lib/key-bindings.zsh
# zinit snippet OMZ::lib/history.zsh
zinit snippet OMZ::lib/git.zsh
zinit snippet OMZP::git
zinit cdclear -q # <- forget completions provided by Git plugin

#
# FZF
#
# Note: the following stems from the `/usr/local/opt/fzf/install` executable
# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
#
# fzf history not working: moving back to ~/.fzf.zsh
# PATH="${PATH:+${PATH}:}/opt/homebrew/opt/fzf/bin"
# source "/opt/homebrew/opt/fzf/shell/completion.zsh"
# source "/opt/homebrew/opt/fzf/shell/key-bindings.zsh"

# fzf history
zinit ice lucid wait'0'
zinit light joshskidmore/zsh-fzf-history-search                               # https://github.com/joshskidmore/zsh-fzf-history-search

# fzf as tab completion
zinit ice lucid
zinit light Aloxaf/fzf-tab                                                    # https://github.com/Aloxaf/fzf-tab
# disable sort when completing `git checkout`
zstyle ':completion:*:git-checkout:*' sort false
# set descriptions format to enable group support
# NOTE: don't use escape sequences here, fzf-tab will ignore them
zstyle ':completion:*:descriptions' format '[%d]'
# set list-colors to enable filename colorizing
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# force zsh not to show completion menu, which allows fzf-tab to capture the unambiguous prefix
zstyle ':completion:*' menu no
# preview directory's content with eza when completing cd
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always $realpath'
# switch group using `<` and `>`
zstyle ':fzf-tab:*' switch-group '<' '>'
# tmux
# zstyle ':fzf-tab:*' fzf-command ftb-tmux-popup

# substring search
zinit ice lucid
zinit light zsh-users/zsh-history-substring-search                            # https://github.com/zsh-users/zsh-history-substring-search

# fzf git awesomeness
# export FORGIT_NO_ALIASES="1"
zinit ice wait'1' lucid
zinit light wfxr/forgit                                                       # https://github.com/wfxr/forgit

# lots of completions
zinit ice wait'1' lucid as'completion'
zinit light zsh-users/zsh-completions                                         # https://github.com/zsh-users/zsh-completions

# syntax highlighting
zinit ice lucid atinit'zpcompinit'
zinit light zdharma-continuum/fast-syntax-highlighting                        # https://github.com/zdharma-continuum/fast-syntax-highlighting

# zsh command suggestions
# zinit ice wait atload"_zsh_autosuggest_start"
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'
zinit light zsh-users/zsh-autosuggestions                                     # https://github.com/zsh-users/zsh-autosuggestions

# alias suggestions
zinit ice lucid
zinit light djui/alias-tips                                                   # https://github.com/djui/alias-tips

#
# Oh My Zsh Plugins (via zinit)
# (alot of this may no longer be necessary)
#

# https://python-poetry.org/docs/#enable-tab-completion-for-bash-fish-or-zsh
# poetry completions zsh > ~/.zfunc/_poetry
# fpath+=~/.zfunc

# completions are failing somewhere
# https://github.com/eddiezane/lunchy/issues/57#issuecomment-121173592
# autoload bashcompinit
# bashcompinit



# zinit snippet OMZP::brew                               # https://github.com/robbyrussell/oh-my-zsh/tree/master/plugins/brew


#
# Themes
#

# Powerlevel 9k
# https://github.com/bhilburn/powerlevel9k#customizing-prompt-segments
# https://github.com/bhilburn/powerlevel9k/wiki/Stylizing-Your-Prompt
# POWERLEVEL9K_MODE='awesome-patched'
# POWERLEVEL9K_SHORTEN_DIR_LENGTH=2
# POWERLEVEL9K_COMMAND_EXECUTION_TIME_THRESHOLD=0
# POWERLEVEL9K_COMMAND_EXECUTION_TIME_PRECISION=3
# POWERLEVEL9K_COMMAND_EXECUTION_TIME_FOREGROUND='black'
# POWERLEVEL9K_COMMAND_EXECUTION_TIME_BACKGROUND='072'
# POWERLEVEL9K_EXECUTION_TIME_ICON='Δ'
# POWERLEVEL9K_BACKGROUND_JOBS_VERBOSE=false
# POWERLEVEL9K_BACKGROUND_JOBS_BACKGROUND=none
# POWERLEVEL9K_BACKGROUND_JOBS_VISUAL_IDENTIFIER_COLOR=002
# POWERLEVEL9K_BACKGROUND_JOBS_ICON='⇶'
# POWERLEVEL9K_VCS_INCOMING_CHANGES_ICON='⇣'
# POWERLEVEL9K_VCS_OUTGOING_CHANGES_ICON='⇡'
# POWERLEVEL9K_SHOW_CHANGESET=true

# POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir dir_writable vcs)
# POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status command_execution_time background_jobs history time)
# zinit ice depth=1; zinit light romkatv/powerlevel10k

#
# History Config
#
# 5_000_000_000
export HISTSIZE=5000000000                                                           # How many lines of history to keep in memory
export SAVEHIST=5000000000                                                           # Number of history entries to save to disk
export HISTFILESIZE=5000000000
export HISTFILE=~/.zsh_history                                                       # Where to save history to disk
export HISTIGNORE="ls:cd:cd -:pwd:exit:date:* --help"
export HISTDUP=erase                                                                 # Erase duplicates in the history file
# setopt    appendhistory                                                     # Append history to the history file (no overwriting)
setopt    sharehistory                                                        # Share history across terminals
setopt extended_history       # record timestamp of command in HISTFILE
setopt hist_expire_dups_first
setopt hist_ignore_all_dups
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_reduce_blanks
setopt hist_save_no_dups
setopt hist_verify
# setopt    inc_append_history                                                  # Immediately append to the history file, not just when a term is killed

# setopt no_complete_aliases # Enable completions for aliases

#
# Source `.shell*` configuration
#
source ~/.profile
# . /opt/homebrew/opt/asdf/libexec/asdf.sh


#
# Patch ZSH key bindings per https://stackoverflow.com/a/29403520
#
bindkey "^U" backward-kill-line
bindkey "^X\\x7f" backward-kill-line
bindkey "^X^_" redo
# In the event of weird up and down behavior try these:
# bindkey '^[[A' up-line-or-search
# bindkey '^[[B' down-line-or-search

#
# Mise
# ref: https://github.com/jdx/mise
#

eval "$(mise completion zsh)"
eval "$(mise activate zsh)"
eval "$(ln -sfn $MISE_DATA_DIR $HOME/.asdf)"

#
# Starship (last line)
# ref: https://starship.rs/config
#
eval "$(starship init zsh)"
