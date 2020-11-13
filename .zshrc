# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block, everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
# export ZSH=/Users/krunic/.oh-my-zsh

ZSH_TMUX_AUTOSTART="false"

DEFAULT_USER="$USER"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

ZSH_THEME="random"

# User configuration

export PATH="$PATH:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin"
# export MANPATH="/usr/local/man:$MANPATH"

autoload -Uz compinit && compinit
autoload -Uz bashcompinit
bashcompinit -i

source $HOME/antigen.zsh

# load Powerlevel9k custom settings
# source $HOME/pl9k.zsh


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
antigen bundle git

#antigen theme bhilburn/powerlevel9k powerlevel9k
antigen theme romkatv/powerlevel10k powerlevel10k

antigen apply
# You may need to manually set your language environment
# export LANG=en_US.UTF-8
# if [ -z $TMUX ]; then; tmux; fi
export TERM="xterm-color"

# required for signing commits
export GPG_TTY=$(tty)

export EDITOR=vim

export FZF_DEFAULT_COMMAND='ag --ignore node_modules -g ""'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

[ -f /usr/share/nvm/init-nvm.sh ] && source /usr/share/nvm/init-nvm.sh

