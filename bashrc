export WORKON_HOME=~/.virtualenvs
source /usr/local/bin/virtualenvwrapper.sh

sudo_wisdom=(
    "ONE COMMAND TO RULE THEM ALL."
    "With great power, comes great responsibility."
    "HATERS GONNA DO THAT THING THEY ARE EPONYMOUSLY REPUTED TO DO."
)

#For the lulz.
alias sudo="echo ${sudo_wisdom[$RANDOM % 6]} ; sudo"
