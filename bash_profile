export CLICOLOR=1
export PS1="\[\e[30;m\]\w \$> \[\e[0m\]"

alias g='git'
alias be='bundle exec'
alias s='open -a "Sublime Text 2"'
alias mongorun='mongod run --config /usr/local/etc/mongod.conf'
alias v='mvim'
alias ff='find . | grep'
alias l='ls -alF'
alias rp='pry -r ./config/environment'
alias gg='git g'

PATH=/usr/local/bin:/Applications/Postgres.app/Contents/MacOS/bin:$PATH

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
