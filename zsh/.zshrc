export ZSH="/home/cassius23/.oh-my-zsh"

ZSH_THEME="agnoster"

plugins=(
  archlinux
  colored-man-pages
  dirhistory
  django
  fancy-ctrl-z
  gitignore
  gpg-agent
  # git
  pyenv
  sudo
  systemadmin
  transfer
  zsh-syntax-highlighting
  zsh-autosuggestions
  zsh_reload
)

source $ZSH/oh-my-zsh.sh


export EDITOR='vim'


alias cp="cp -i"                          # confirm before overwriting something
alias df='df -h'                          # human-readable sizes
alias free='free -m'                      # show sizes in MB
alias vim='nvim'

export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'