# ============ User defined ==========#

#==== custom function====#

# make dir and cd into it
mkcd() {
  mkdir -p "$1" && cd "$1"
}

clr() {
  clear
  fortune | cowsay -f "$(ls /usr/share/cowsay/cows | shuf -n 1)" | lolcat
}

# list and print toilet fonts
ls_ft() {
  for font_path in /usr/share/figlet/*.tlf; do
    font=$(basename "$font_path" .tlf)
    echo -e "\n=== Font: $font ==="
    toilet -f "$font" "${1:-Hello}"
  done
}

venv() { # create and activate venv
  py -m venv .venv
  source .venv/bin/activate
}

# auto activate and deactivate venv on cd
cd() {
  builtin cd "$@" || return

  local d="$PWD"

  while [[ "$d" != "/" ]]; do
    echo "checking: $d"

    if [[ -f "$d/.venv/bin/activate" ]]; then
      echo "FOUND"

      if [[ "$VIRTUAL_ENV" != "$d/.venv" ]]; then
        [[ -n "$VIRTUAL_ENV" ]] && deactivate
        source "$d/.venv/bin/activate"
      fi
      return
    fi

    d="$(dirname "$d")"
  done

  [[ -n "$VIRTUAL_ENV" ]] && deactivate
}

# add empty line after each real cmd
autoload -Uz add-zsh-hook

_last_cmd_executed=false

preexec() {
  _last_cmd_executed=true
}

precmd() {
  if $_last_cmd_executed; then
    echo
    _last_cmd_executed=false
  fi
}
