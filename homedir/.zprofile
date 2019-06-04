##############################################################################
#Import the shell-agnostic (Bash or Zsh) environment config
##############################################################################
source ~/.profile

##############################################################################
# History Configuration
##############################################################################
# 5_000_000_000
HISTSIZE=5000000000                                                           # How many lines of history to keep in memory
SAVEHIST=5000000000                                                           # Number of history entries to save to disk
HISTFILE=~/.zsh_history                                                       # Where to save history to disk
export HISTIGNORE="ls:cd:cd -:pwd:exit:date:* --help"
HISTDUP=erase                                                                 # Erase duplicates in the history file
# setopt    appendhistory                                                     # Append history to the history file (no overwriting)
setopt    sharehistory                                                        # Share history across terminals
# setopt    inc_append_history                                                  # Immediately append to the history file, not just when a term is killed
