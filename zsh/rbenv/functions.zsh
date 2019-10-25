ruby_version() {
  if (( $+commands[rbenv] ))
  then
    echo "$($commands[rbenv] version-name)"
  fi
}

rb_prompt() {
  if ! [[ -z "$(ruby_version)" ]]
  then
    echo "($(ruby_version))"
  else
    echo ""
  fi
}
