export CLICOLOR=1
export PS1="\[\e[30;m\]\w \$> \[\e[0m\]"

alias v='mvim'
alias a='git add'
alias c='git cm'
alias s='git status -sb'
alias d='git diff'
alias l='git lg'
alias gg='git g'
alias ds='git diff --stat --color'
alias bd='git diff --stat --color master..'
alias be='bundle exec'
alias ff='find . | grep'
alias ll='ls -alF'
alias spec='SPEC=zeus zeus rspec'
alias mongorun='mongod run --config /usr/local/etc/mongod.conf'

if test "$(which ey)"; then
  alias staging='ey status -e staging_au'
  alias testing='ey status -e developer_playground'

  function stage {
    if [[ $# -eq 0 ]] ; then
      echo 'Nope, needs a branch ref'
      return 1
    fi
    ey deploy -e staging_au -r $1
  }

  function test {
    if [[ $# -eq 0 ]] ; then
      echo 'Nope, needs a branch ref'
      return 1
    fi
    ey deploy -e developer_playground -r $1
  }

  function rea {
    if [[ $# -eq 0 ]] ; then
      echo 'Nope, needs a branch ref'
      return 1
    fi
    ey deploy -e staging_rea -r $1
  }
fi

PATH=/usr/local/bin:/Applications/Postgres.app/Contents/MacOS/bin:$PATH

source ~/.profile

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
