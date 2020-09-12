# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH="/usr/local/sbin:$PATH"

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
export TERM="xterm-256color"

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  z
  git
  osx
  zsh-autosuggestions
  zsh-completions
  zsh-syntax-highlighting
)

# plug-in settings
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=152'



# source
source $ZSH/oh-my-zsh.sh
source ~/.iterm2_shell_integration.zsh



# <- ------ Export path shortcut -------- ->
export icloud=~/Library/Mobile\ Documents/com~apple~CloudDocs

# <- ------ Export ENV variables -------- ->
# mapbox
export MAPBOX_ACCESS_TOKEN=pk.eyJ1IjoibWlyYWNsZS0iLCJhIjoiY2p2M2hwZGRuMDd3ZTQzbndkbTQwNjczcyJ9.BVE2keCDucUMC3WQgseM0A
# tensorflor object detection API
export PYTHONPATH=$PYTHONPATH:/Users/bsun/repos/TensorFlow-Projects/models/research:/Users/bsun/repos/TensorFlow-Projects/models/research/slim



# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
#ZSH_THEME="agnoster"

# <--------- Using POWERLEVEL9K theme ---------->
# POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(custom_medium dir vcs newline status)
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(custom_medium dir vcs newline status)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(anaconda virtualenv)
POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
POWERLEVEL9K_MODE='nerdfont-complete'

# add Medium M icon prompt segment
# POWERLEVEL9K_CUSTOM_MEDIUM="echo -n '\uF859'-"  
_realip="$(curl -s 'https://api.ipify.org')"
# POWERLEVEL9K_CUSTOM_MEDIUM="echo -n $(id -un)@$_realip"  # ipconfig getifaddr en7
POWERLEVEL9K_CUSTOM_MEDIUM="echo U5EWDFffsff777@10.0.16.55"
POWERLEVEL9K_CUSTOM_MEDIUM_FOREGROUND="black"
POWERLEVEL9K_CUSTOM_MEDIUM_BACKGROUND="white"
source ~/.oh-my-zsh/custom/themes/powerlevel9k/powerlevel9k.zsh-theme



# <- ------ zsh behavior settings  ----- ->
# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

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

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"


# <---------- Aliases -------- >
alias l='colorls -lAtr --sd'
source $(dirname $(gem which colorls))/tab_complete.sh  # add tab completion for flags for colorls

alias lc='ls|wc -l'
alias tree='tree --filelimit=12'

alias rm='rm -i'
alias trash='rmtrash'

alias sublrc='subl ~/.zshrc'
alias sourcerc='source ~/.zshrc'

alias python38='/usr/local/opt/python@3.8/bin/python3'

# ssh server alias
alias chuansuo='ssh -p 10076 lfgroup@vipgz2.idcfengye.com'
alias laoxue='ssh -p 10122 xuedy@100.64.166.214'
alias tesla='ssh -p 18103 zbxs@47.112.99.25'
alias wuwu='ssh -p 22 zbxs@10.0.16.55'
alias sshusc='ssh bos@hpc-cmb.usc.edu'
alias brainpp='ssh -CAXY bsun-ws2-first-instance.sunbo02.ws2@hh-b-internal.brainpp.cn'

# git alias
alias gits='git status'



# <------- functions --------->
function mkcd { mkdir -pv "$1" && cd "$1"; }

function peco-history-selection() {
  local tac
  if which tac > /dev/null; then
    tac="tac"
  else
    tac="tail -r"
  fi
  BUFFER=$(history -1000 | eval $tac | cut -c 8- | peco --query "$LBUFFER")
  CURSOR=$#BUFFER
}
zle -N peco-history-selection
bindkey '^R' peco-history-selection

################################### Added by software installation ########################


# added by Anaconda3 2019.10 installer
# >>> conda init >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$(CONDA_REPORT_ERRORS=false '/opt/anaconda3/bin/conda' shell.bash hook 2> /dev/null)"
if [ $? -eq 0 ]; then
    \eval "$__conda_setup"
else
    if [ -f "/opt/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/opt/anaconda3/etc/profile.d/conda.sh"
        CONDA_CHANGEPS1=false conda activate base
    else
        \export PATH="/opt/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda init <<<



# < ------ added by nvm ------- >
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
# < ------ added by nvm ------- >


# added by curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
export PATH="$HOME/.cargo/bin:$PATH"


