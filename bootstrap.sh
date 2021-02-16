#!/bin/bash

# Bootstraps a new mac by installing CLT, Homebrew, Zsh and sets Zsh as
# the default shell. If it succeeds, the new mac is now ready to consume
# the rest of the dotfiles repo.

echo "starting to bootstrap..."

install() {
  printf "Checking $1..."
  eval $2 &>/dev/null
  case $? in
    0)
      echo "already installed."
      ;;
    *)
      echo "not found. Installing now..."
      eval $3
      ;;
  esac
}

install "clt" "xcode-select -p" "xcode-select --install"
install "homebrew" "command -v brew" "/bin/bash -c '$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)'"
install "zsh" "brew list zsh" "brew install zsh"

# Set the brewed zsh as the default
zsh_path="$(command -v zsh)"
if ! grep "$zsh_path" /etc/shells &> /dev/null; then
  echo "Adding '$zsh_path' to /etc/shells"
  sudo sh -c "echo $zsh_path >> /etc/shells"
fi
curr_sh_path="$(/bin/ps -p $$ -ocomm=)"
if [ $curr_sh_path == $zsh_path ]; then
  echo "Setting zsh as the default..."
  sudo chsh -s "$zsh_path"
fi

echo "bootstrapping complete."  