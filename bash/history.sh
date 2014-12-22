# Bash History 
export HISTCONTROL="ignoredups" # Erase duplicates
export HISTCONTROL=erasedups

# resize history size
export HISTSIZE=10000

# include timestamp
export HISTTIMEFORMAT="%h %d %H:%M:%S "
# append to bash_history if Terminal.app quits
shopt -s histappend

# history handling
export HISTFILE=~/.history
