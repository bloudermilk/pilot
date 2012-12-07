_pilot() {
  COMPREPLY=()
  local word="${COMP_WORDS[COMP_CWORD]}"

  if [ "$COMP_CWORD" -eq 1 ]; then
    COMPREPLY=( $(compgen -W "$(pilot commands)" -- "$word") )
  else
    local command="${COMP_WORDS[1]}"
    local completions="$(pilot completions "$command" ${COMP_WORDS[@]:2})"
    if [ "$completions" ]; then
      COMPREPLY=( $(compgen -W "$completions" -- "$word") )
    else
      return 1
    fi
  fi
}

complete -o default -F _pilot pilot
