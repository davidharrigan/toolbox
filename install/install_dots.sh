#!/usr/bin/env bash
set -e

SCRIPT_HOME=$(cd "$(dirname $0)" && pwd)
TOOLBOX_HOME=$(echo $SCRIPT_HOME | rev | cut -d/ -f2- | rev)

INSTALL=(bashrc gitignore tmux.conf vimrc zshrc env vim oh-my-zsh zsh-custom)

for install in "${INSTALL[@]}"; do
  printf "Installing $install... "
  rm -rf ~/.$install
  ln -s "$TOOLBOX_HOME/dots/$install" "$HOME/.$install"
  echo " Done"
done

printf "Linking bin and lib... "
rm -rf "$HOME/.bin"
rm -rf "$HOME/.lib"
ln -s "$TOOLBOX_HOME/bin" "$HOME/.bin"
ln -s "$TOOLBOX_HOME/lib" "$HOME/.lib"
echo " Done"
