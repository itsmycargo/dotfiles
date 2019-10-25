# kube_ps1
export KUBE_PS1_SYMBOL_ENABLE=false

if [ -n "$(command -v kube_ps1)" ];
then
  export PROMPT=$'$(rb_prompt)$(kube_ps1) %4~$(git_dirty) %# '
else
  export PROMPT=$'$(rb_prompt) %4~$(git_dirty) %# '
fi
