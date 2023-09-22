export ZSH="/Users/kieranwilliams/.oh-my-zsh"


ZSH_THEME="powerlevel9k/powerlevel9k"
POWERLEVEL9K_MODE='nerdfont-fontconfig'
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="►►  "
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=""
DEFAULT_USER=`whoami`

# History in cache directory:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.



plugins=(
  git
  bundler
  dotenv
  macos
  zsh-autosuggestions
  vi-mode
)

source $ZSH/oh-my-zsh.sh


# vi mode settings 
# {{
  bindkey -M viins ^z vi-cmd-mode

  # function zle-line-init zle-keymap-select {
  #   RPS1=${${KEYMAP/vicmd/-- NORMAL --}/(main|viins)/-- INSERT --}"
  #   RPS2=$RPS1
  #   zle reset-prompt
  # }

  # zle -N zle-line-init
  # zle -N zle-keymap-select
  
  # Remove mode switching delay.
KEYTIMEOUT=5

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'

  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select

# Use beam shape cursor on startup.
echo -ne '\e[5 q'

# Use beam shape cursor for each new prompt.
preexec() {
   echo -ne '\e[5 q'
}


# }}

alias c="clear"
alias o="open"
alias o.="open ."
alias v="nvim"
alias p="python3"
alias ts="ts-node"
alias cwd="pwd|pbcopy"
alias ex="exit"
alias :q="exit"
alias ls="exa"
alias matlab="/Applications/MATLAB_R2022b.app/bin/matlab -nodesktop -nosplash"
alias jc="javac -d ./build"
alias j="java -cp ./build"

alias u="~/Uni/y3"
alias hh="npx hardhat"


export PATH="$HOME/bin:$PATH"
export PATH=/Users/kieranwilliams/usr/local/bin:$PATH
export PATH=/Users/kieranwilliams/usr/local/nodeScripts/scripts:$PATH
export PATH="/usr/local/lib/node_modules:$PATH"

export PATH=/usr/local/mysql/bin:$PATH
export PATH=/usr/local/nvim-macos/bin/:$PATH
export MONGO_PATH=/usr/local/mongodb
export PATH=$PATH:$MONGO_PATH/bin
export JAVA_HOME=$(/usr/libexec/java_home -v 17)
export EDITOR="nvim"


bindkey '^ ' autosuggest-accept 

# Load zsh-syntax-highlighting; should be last.
source $HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

export FZF_DEFAULT_COMMAND='ag -g ""'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/kieranwilliams/opt/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/kieranwilliams/opt/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/kieranwilliams/opt/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/kieranwilliams/opt/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh" || true


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/kieranwilliams/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/kieranwilliams/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/kieranwilliams/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/kieranwilliams/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

# bun completions
[ -s "/Users/kieranwilliams/.bun/_bun" ] && source "/Users/kieranwilliams/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
