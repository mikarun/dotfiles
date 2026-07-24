# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code thatmay require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
# -*- mode:sh; -*-
###############################################################################
#              __ ___  _           __  __      __ _________  _   _
#             | _/ _ \| |__       |  \/  |_   |_ |__  / ___|| | | |
#             | | | | | '_ \ _____| |\/| | | | | | / /\___ \| |_| |
#             | | |_| | | | |_____| |  | | |_| | |/ /_ ___) |  _  |
#             | |\___/|_| |_|     |_|  |_|\__, | /____|____/|_| |_|
#             |__|                        |___/__|
#
###############################################################################
# Resources:
# - https://github.com/smaximov/zsh-config
#
# You SHOULD have made `~/.zshenv` a symbolic link pointing to
# `$ZDOTDIR/.zshenv` as follow:
#
#           ln -s .config/zsh/.zshenv ~/.zshenv
#
# This ensure all expected environment variable (in particular the ones of
# XDG Base Directory Specification (see https://specifications.freedesktop.org/basedir-spec/latest/)
# are set
###############################################################################

# Path to your oh-my-zsh installation.
export ZSH=$XDG_DATA_HOME/oh-my-zsh

# Custom directory location
ZSH_CUSTOM=$ZDOTDIR/custom

# Set to the name theme to load.
# Look in ~/.oh-my-zsh/themes/
#export ZSH_THEME="mika"
export ZSH_THEME="powerlevel10k/powerlevel10k"

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
#plugins=(vi-mode rails rake-fast capistrano git gitfast git-flow gol docker docker-compose kubectl)

# === Oh-My-ZSH Plugins ===
plugins=()
# Add them wisely, as too many plugins slow down shell startup.
#___________________
# - Default plugins: '$ZSH/plugins/*' i.e. ~/.local/share/oh-my-zsh/plugins/*
#   See https://github.com/robbyrussell/oh-my-zsh/wiki/Plugins
plugins+=(vi-mode)
plugins+=(git gitfast git-flow git-extras)  # Git
plugins+=(rails rake-fast capistrano)         # Ruby stuff
#plugins+=(pip)                  # Python stuff
plugins+=(docker docker-compose)        # Docker stuff
plugins+=(kubectl minikube)             # Kubernetes stuff
#if [[ "$(uname)" == "Darwin" ]]; then
#  plugins+=(macos marked2)        # Mac OS
#fi
# Misc
plugins+=(cp taskwarrior)
plugins+=(zsh-ssh)

#__________________
# - Custom plugins: '$ZSH_CUSTOM/plugins/*' i.e. ~/config./zsh/custom/plugins/
#
plugins+=(gol)

##############################################################################

# Create ZSH cache directory unless it already exists
[[ -d $ZSH_CACHE_DIR ]] || mkdir -p $ZSH_CACHE_DIR

source $ZSH/oh-my-zsh.sh
source ~/.alias
source ~/dotfiles/tmux/tmuxinator.zsh

# Customize to your needs...
unsetopt auto_name_dirs

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

#rbenv
eval "$(rbenv init -)"

#pyenv
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# Added by Amplify CLI binary installer
export PATH="$HOME/.amplify/bin:$PATH"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Mise
eval "$(/Users/mickael/.local/bin/mise activate zsh)"
