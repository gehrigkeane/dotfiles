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
  'https://github.com/docker/cli/blob/master/contrib/completion/zsh/_docker'

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
zinit snippet OMZ::lib/git.zsh
zinit snippet OMZP::git
zinit cdclear -q # <- forget completions provided by Git plugin


# fzf history
zinit ice lucid wait'0'
zinit light joshskidmore/zsh-fzf-history-search                               # https://github.com/joshskidmore/zsh-fzf-history-search

#
# fzf-tab (as tab completion)
zinit ice lucid
zinit light Aloxaf/fzf-tab                                                    # https://github.com/Aloxaf/fzf-tab
zstyle ':completion:*:git-checkout:*' sort false                              # disable sort when completing `git checkout`
zstyle ':completion:*:descriptions' format '[%d]'                             # set descriptions format to enable group support
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}                         # set list-colors to enable filename colorizing
zstyle ':completion:*' menu no                                                # force zsh not to show completion menu, which allows fzf-tab to capture the unambiguous prefix
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'lsd -A1 --color=always $realpath' # preview directory's content with eza when completing cd
zstyle ':fzf-tab:*' switch-group '<' '>'                                      # switch group using `<` and `>`
# zstyle ':fzf-tab:*' fzf-command ftb-tmux-popup                              # tmux popup

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
# History Config
# ref: https://zsh.sourceforge.io/Doc/Release/Options.html#History
#

# 5_000_000_000 (disk is cheap, 5B is a proxy for infinite history)
export HISTFILE=~/.zsh_history    # Where to save history to disk
export HISTSIZE=5000000000        # How many lines of history to keep in memory
export SAVEHIST=5000000000        # Number of history entries to save to disk
export HISTFILESIZE=5000000000
export HISTDUP=erase              # Erase duplicates in the history file
export HISTIGNORE="ls:cd:cd -:pwd:exit:date:* --help"

# setopt    appendhistory         # Append history to the history file (no overwriting)
setopt SHARE_HISTORY              # Share history across sessions
setopt EXTENDED_HISTORY           # record timestamp of command in HISTFILE
setopt HIST_EXPIRE_DUPS_FIRST     # (go read the docs, it's a whole fucking paragraph.)
setopt HIST_IGNORE_ALL_DUPS       # If a new command line being added to the history list duplicates an older one, the older command is removed from the list.
setopt HIST_IGNORE_DUPS           # Do not enter command lines into the history list if they are duplicates of the previous event.
setopt HIST_IGNORE_SPACE          # Remove command lines from the history list when the first character on the line is a space.
setopt HIST_REDUCE_BLANKS         # Remove superfluous blanks from each command line being added to the history list.
setopt HIST_SAVE_NO_DUPS          # When writing out the history file, older commands that duplicate newer ones are omitted.
setopt HIST_VERIFY                # Whenever the user enters a line with history expansion, don’t execute the line directly; instead, perform history expansion and reload the line into the editing buffer.

#
# Source `.shell*` configuration
#
source ~/.profile

#
# MacOS <> ZSH key bindings
# ref: https://stackoverflow.com/a/29403520
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
