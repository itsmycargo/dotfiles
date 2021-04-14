function git-delete-squashed () {
  if [ "$(git_branch)" != "master" -a "$(git_branch)" != "main" ];
  then
    echo "Please run git-delete-squashed on main branch (either master or main)"
    return 1
  fi

  base_branch=$(git_branch)

  git fetch
  git pull

  while read branch;
  do
    mergeBase=$(git merge-base ${base_branch} $branch)
    if [ -n "$mergeBase" ];
    then
      if [[ $(git cherry ${base_branch} $(git commit-tree $(git rev-parse $branch^{tree}) -p $mergeBase -m _)) == "-"* ]];
      then
        git branch -D $branch
      fi
    fi
  done < <(git for-each-ref refs/heads/ "--format=%(refname:short)")
}
