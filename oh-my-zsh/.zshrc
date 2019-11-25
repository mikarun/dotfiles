# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh

# Set to the name theme to load.
# Look in ~/.oh-my-zsh/themes/
export ZSH_THEME="mika"
# export ZSH_THEME="awesomepanda"

# export ZSH_THEME_SVN_PROMPT_DIRTY="?"

# export ZSH_THEME_SVN_PROMPT_CLEAN=">"

# Set to this to use case-sensitive completion
# export CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# export DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# export DISABLE_LS_COLORS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(vi-mode rails rake-fast capistrano git git-flow gol docker docker-compose kubernetes)

source $ZSH/oh-my-zsh.sh
source ~/.alias
source ~/dotfiles/tmux/tmuxinator.zsh

# Customize to your needs...
unsetopt auto_name_dirs

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
