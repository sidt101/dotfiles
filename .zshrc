# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/siddhant.tandon/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"
# Essential access tokens, tied to your user.

export HOMEBREW_GITHUB_API_TOKEN=$GITHUB_TOKEN

# Make tokens available to (some) Ruby projects.
export BUNDLE_GITHUB__COM="$GITHUB_TOKEN:x-oauth-basic"
export BUNDLE_GEM__FURY__IO="$GEMFURY_TOKEN"

# The parent directory for all your Chime repos
export WORK_DIR_PATH=~/1debit
export LOCAL_GEM_PATH=$WORK_DIR_PATH

# OPTIONAL - a datadog api token , which if set will enable datadog traces in dxt

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias gpoh='git push origin head'
alias gcom='git commit -m'
alias gp='git pull'
alias gst='git status'
alias gbr='git branch'
alias gcan='git commit --amend --no-edit'
alias gap='git add -p'
alias gaa='git add .'
alias gco='git checkout'
alias glg='git log --name-status'
alias gdf='git diff'
alias gdfc='git diff --cached'

alias 1debit='cd ~/1debit'
alias core='cd ~/1debit/chime-core'
alias bas='cd ~/1debit/bank-account-service'
alias consumer='cd ~/1debit/server-consumer'
alias processor='cd ~/1debit/server-processor'
alias octave='cd ~/1debit/server-octave'
alias partner='cd ~/1debit/server-partner-api'
alias webhooks='cd ~/1debit/server-webhooks'
alias admin='cd ~/1debit/server-admin'
alias galileo='cd ~/1debit/chime-galileo'
alias atlas='cd ~/1debit/chime-atlas'
alias api='cd ~/1debit/server-api'
alias txn='cd ~/1debit/transactions-engine'
alias webhooks='cd ~/1debit/server-webhooks'
alias txn-service='cd ~/1debit/transaction-service'
alias gsim='cd ~/1debit/server-gsimulator'
alias migrations='cd ~/1debit/server-migrations'
alias schemas='cd ~/1debit/chime-schemas'

alias k="kubectl"
alias kbc-prod="k config use-context csproduction-rails-test -n chime01; k config set-context --current --namespace=chime01"
alias kbc-qa="k config use-context csstable-rails-test -n qa; k config set-context --current --namespace=qa"
alias kbc-dev1="k config use-context csstable-rails-test -n dev1; k config set-context --current --namespace=dev1"
alias kbc-dev2="k config use-context csstable-rails-test -n dev2; k config set-context --current --namespace=dev2"
alias kbc-dev3="k config use-context csstable-rails-test -n dev3; k config set-context --current --namespace=dev3"
alias kbc-dev4="k config use-context csstable-rails-test -n dev4; k config set-context --current --namespace=dev4"
alias kbc-dev5="k config use-context csstable-rails-test -n dev5; k config set-context --current --namespace=dev5"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
