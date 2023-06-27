# user, host, full path, and time/date 
# on two lines for easier vgrepping
# entry in a nice long thread on the Arch Linux forums: http://bbs.archlinux.org/viewtopic.php?pid=521888#p521888
# PROMPT=$'%{\e[0;34m%}%B┌─[%b%{\e[0m%}%{\e[1;32m%}%n%{\e[1;30m%}@%{\e[0m%}%{\e[0;36m%}%m%{\e[0;34m%}%B]%b%{\e[0m%} - %b%{\e[0;34m%}%B[%b%{$fg_no_bold[red]%}%~%{\e[0;34m%}%B]%b%{\e[0m%}
# %{\e[0;34m%}%B└─%B[%{$fg_no_bold[magenta]%}$%{\e[0;34m%}%B]>%{\e[0m%}%b '
# PROMPT=$'%{\e[0;34m%}%B┌─[%b%{\e[0m%}%{\e[1;32m%}%n%{\e[1;30m%}@%{\e[0m%}%{\e[0;36m%}%m%{\e[0;34m%}%B]%b%{\e[0m%} - %b%{\e[0;34m%}%B[%b%{$fg_no_bold[red]%}%~%{\e[0;34m%}%B]%b%{\e[0m%}
# %{\e[0;34m%}%B└─%B[%{$fg_bold[blue]%}$(git_prompt_info)%{$fg_bold[blue]%}$(svn_prompt_info)%{$reset_color%}%{\e[0;34m%}%B]>%{\e[0m%}%b '

function __docker_context_name() {
  if type "docker" > /dev/null; then
    echo $(docker context show);
  fi
  return 
}

function docker_machine_name() {
  local format=${1:-%s}

  if test ${DOCKER_MACHINE_NAME}; then
    printf -- "${format}" "${DOCKER_MACHINE_NAME}"
    return
  fi

  local docker_ctx=$(__docker_context_name);
  if [[ ! "$docker_ctx" = "default" ]]; then
    printf -- "${format}" "$docker_ctx"
    return
  fi

}

function test_equality(){
  local varname="a"
  echo "$varname"
  if [[ ! "$varname" = "d" ]]; then
    echo "equals 1"
    else
      echo "$varname"
    fi
}


setopt prompt_subst

PROMPT=$'%{\e[0;34m%}%B┌─[%b%{\e[0m%}%{\e[1;32m%}%n%{\e[1;30m%}@%{\e[0m%}%{\e[0;36m%}%m%{\e[0;34m%}%B]%b%{\e[0m%} - %b%{\e[0;34m%}%B[%b%{$fg_no_bold[white]%}%~%{\e[0;34m%}%B]%b%{\e[0m%}
%{\e[0;34m%}%B└─%B[%{$fg_bold[blue]%}$(git_prompt_info)%{$fg_bold[blue]%}%{$reset_color%}%{\e[0;34m%}%B$(vi_mode_prompt_info)$(docker_machine_name)] >%{\e[0m%}%b '


PS2=$' \e[0;34m%}%B>%{\e[0m%}%b '

RPROMPT='[%*]'

ZSH_THEME_GIT_PROMPT_PREFIX="git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%})%{$fg[yellow]%} ✗ %{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%}) "



ZSH_PROMPT_BASE_COLOR="%{$fg_bold[blue]%}"
ZSH_THEME_REPO_NAME_COLOR="%{$fg_bold[red]%}"

ZSH_THEME_SVN_PROMPT_PREFIX="svn:("
ZSH_THEME_SVN_PROMPT_SUFFIX=")"
ZSH_THEME_SVN_PROMPT_DIRTY="%{$fg[red]%} ✘ %{$reset_color%}"
ZSH_THEME_SVN_PROMPT_CLEAN=" "
