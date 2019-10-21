alias reload!='. ~/.zshrc'

alias ls='ls -GF'
alias cpv="rsync -rvh --progress"

function update() {
  brew upgrade
  brew cask upgrade
  brew cleanup
}
