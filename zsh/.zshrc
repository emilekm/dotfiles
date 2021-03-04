source $HOME/antigen.zsh

antigen init $HOME/.antigenrc

export EDITOR='nvim'
export VISUAL='nvim'


alias cp="cp -i"                          # confirm before overwriting something
alias df='df -h'                          # human-readable sizes
alias free='free -m'                      # show sizes in MB
alias vim='nvim'

export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'

# Set up Node Version Manager
export NVM_DIR="$HOME/.nvm"                            # You can change this if you want.
export NVM_SOURCE="/usr/share/nvm"                     # The AUR package installs it to here.
[ -s "$NVM_SOURCE/nvm.sh"  ] && . "$NVM_SOURCE/nvm.sh"  # Load NVM

# Setup virtualenv files inside project root (pipenv)
export PIPENV_VENV_IN_PROJECT=1

export TERM=xterm-256color

alias xclip="xclip -selection clipboard"

xbindkeys

source $HOME/.cargo/env

if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then exec startx; fi

export PATH=~/.composer/vendor/bin:$PATH
export PATH=$PATH:$(go env GOPATH)/bin
