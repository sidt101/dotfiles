[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile

export PATH=/bin:/sbin:/usr/bin:/usr/local/sbin:/usr/local/bin:$PATH
export EDITOR='subl -w'

alias gpoh='git push origin head'
alias gcom='git commit -m'
alias gp='git pull'
alias gst='git status'
alias gbr='git branch'
alias gcan='git commit --amend --no-edit'
alias gap='git add -p'
alias gco='git checkout'
alias utility1='ssh birdcage-utility1.snc1'
alias utility2='ssh birdcage-utility2.snc1'
alias worker3='ssh birdcage-worker3.snc1'
alias gdoop='ssh gdoop-job-submitter3.snc1'
alias gdoop_s='ssh svc_optimize@gdoop-job-submitter3.snc1'
alias be='bundle exec'
alias cerebro='ssh cerebro-job-submitter3.snc1'
alias cerebro_s='ssh svc_optimize@cerebro-job-submitter3.snc1'
alias birdcage='cd ~/projects/birdcage'
alias birdcage-dw='cd ~/projects/birdcage-data-worker'
alias bash='vim ~/.bash_profile'
alias vimrc='vim ~/.vimrc'

# enable the git bash completion commands
source ~/.git-completion

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
export PS1="\h:\u \W\$(parse_git_branch)\$ "
