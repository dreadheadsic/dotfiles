# Path to your oh-my-zsh installation.
# export ZSH=/Users/krunic/.oh-my-zsh

ZSH_TMUX_AUTOSTART="true"

DEFAULT_USER="$USER"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# User configuration

export PATH="$PATH:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin"
# export MANPATH="/usr/local/man:$MANPATH"

autoload -Uz compinit && compinit
autoload -Uz bashcompinit
bashcompinit -i

source $HOME/antigen.zsh

# load Powerlevel9k custom settings
source $HOME/pl9k.zsh


# Load the oh-my-zsh's library.
antigen use oh-my-zsh

antigen bundle robbyrussell/oh-my-zsh plugins/colored-man-pages
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-completions
antigen bundle httpie
antigen bundle node
antigen bundle npm
antigen bundle tmux
antigen bundle supercrabtree/k

antigen theme bhilburn/powerlevel9k powerlevel9k
antigen apply
# You may need to manually set your language environment
# export LANG=en_US.UTF-8
# if [ -z $TMUX ]; then; tmux; fi
export TERM="xterm-color"

