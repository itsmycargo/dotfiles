if (( $+commands[git] )); then git="$commands[git]"; else git="/usr/bin/git"; fi

git_branch() {
  echo $($git symbolic-ref HEAD 2>/dev/null | awk -F/ {'print $NF'})
}

# get the difference between the local and remote branches
git_remote_status() {
  remote=${$(git rev-parse --verify ${hook_com[branch]}@{upstream} --symbolic-full-name 2>/dev/null)/refs\/remotes\/}
  if [[ -n ${remote} ]] ; then
    ahead=$(($(git rev-list ${hook_com[branch]}@{upstream}..HEAD 2>/dev/null | wc -l) + 0))
    behind=$(($(git rev-list HEAD..${hook_com[branch]}@{upstream} 2>/dev/null | wc -l) + 0))

    if [ $ahead -eq 0 ] && [ $behind -gt 0 ]
    then
      echo "/-$behind"
    elif [ $ahead -gt 0 ] && [ $behind -eq 0 ]
    then
      echo "/+$ahead"
    elif [ $ahead -gt 0 ] && [ $behind -gt 0 ]
    then
      echo "/+$ahead-$behind"
    fi
  fi
}

git_dirty() {
  st=$($git status --porcelain 2>&1 | tail -n 1)
  if [[ $st =~ "Not a git repository" ]]
  then
    echo ""
  else
    if [[ "$st" == "" ]]
    then
      echo "%{$fg_bold[green]%}[$(git_prompt_info)$(git_remote_status)]%{$reset_color%}"
    else
      echo "%{$fg_bold[red]%}[$(git_prompt_info)$(git_remote_status)]%{$reset_color%}"
    fi
  fi
}

git_prompt_info () {
 ref=$($git symbolic-ref HEAD 2>/dev/null) || return
 echo "${ref#refs/heads/}"
}

need_push () {
  if [[ $($git cherry -v @{upstream} 2>/dev/null) == "" ]]
  then
    echo " "
  else
    echo " with %{$fg_bold[magenta]%}unpushed%{$reset_color%} "
  fi
}
