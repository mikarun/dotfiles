function golenvs_info() {
  echo "available local env files"
  ls .env_*
}

function gole_fi() {
  if [[ -f .env_fi ]]; then
    source .env_fi
  else
    echo "Cannot find .env_fi file"
  fi
}

function gole_fr() {
  if [[ -f .env_fr ]]; then
    source .env_fr
  else
    echo "Cannot find .env_fr file"
  fi
}

function gole_dev() {
  if [[ -f .env_dev ]]; then
    source .env_dev
  else
    echo "Cannot find .env_dev file"
  fi
}

function _gol_env() {
  if [[ "$#" == 0 ]]; then
    golenvs_info
  else
    env_file=".env_$1"
    if [[ -f $env_file ]]; then
      echo "####"
      echo "source $env_file file"
      echo "####"
      source $env_file
      #if [[ -f .env ]]; then
      #  rm -f .env
      #fi
      #ln -n $env_file .env
      #source .env
    else
      echo "Cannot find $env_file file"
    fi
  fi
}


alias gole_dev='_gol_env dev'
alias gole_fr='_gol_env fr'
alias gole_fi='_gol_env fi'
alias gole_docker='_gol_env docker'
compdef gol_env
