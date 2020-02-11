function git-delete-squashed () {
  OVERCOMMIT_DISABLE=1 git checkout -q master
  git fetch
  git pull

  while read branch;
  do
    mergeBase=$(git merge-base master $branch)
    if [ -n "$mergeBase" ];
    then
      if [[ $(git cherry master $(git commit-tree $(git rev-parse $branch^{tree}) -p $mergeBase -m _)) == "-"* ]];
      then
        git branch -D $branch
      fi
    fi
  done < <(git for-each-ref refs/heads/ "--format=%(refname:short)")
}
