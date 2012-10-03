if [[ ! -o interactive ]]; then
    return
fi

compctl -K _pilot pilot

_pilot() {
  local word words completions
  read -cA words
  word="${words[2]}"

  if [ "${#words}" -eq 2 ]; then
    completions="$(pilot commands)"
  else
    completions="$(pilot completions "${word}")"
  fi

  reply=("${(ps:\n:)completions}")
}
