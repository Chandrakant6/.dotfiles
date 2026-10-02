toilet Hello, Chandu -f pagga | lolcat

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(git
	python
  zsh-autosuggestions
	zsh-syntax-highlighting
  colored-man-pages
)

source $ZSH/oh-my-zsh.sh

if [ ~/.bash_aliases ]; then
  source ~/.bash_aliases
fi

. "$HOME/.local/bin/env"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Added by LM Studio CLI tool (lms)
export PATH="$PATH:/home/ct/.lmstudio/bin"
