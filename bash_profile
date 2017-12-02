export CLICOLOR=1
export PS1="\[\e[30;m\]\w \$> \[\e[0m\]"

alias v='nvim'
alias a='git add'
alias c='git cm'
alias s='git status -sb'
alias d='git diff'
alias l='git lg'
alias gg='git g'
alias ds='git diff --stat --color'
alias bd='git diff --stat --color master..'
alias ff='find . | grep'
alias ll='ls -alF'
alias headers='curl -s -D - -o /dev/null'

PATH=/usr/local/bin:/Applications/Postgres.app/Contents/MacOS/bin:$PATH

export NVM_DIR="/Users/mgay/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/mgay/google-cloud-sdk/path.bash.inc' ]; then source '/Users/mgay/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/mgay/google-cloud-sdk/completion.bash.inc' ]; then source '/Users/mgay/google-cloud-sdk/completion.bash.inc'; fi


# added by Anaconda3 5.0.1 installer
export PATH="/Users/mgay/anaconda3/bin:$PATH"
