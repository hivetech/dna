#! /bin/bash

# First script to run after os installation
# Tested on ubuntu 13.10 with gnome shell 3.8

# const (
  OPENLIBS=/opt
  packages="chromium-browser git-core openssh-server openssh-client dconf-cli xclip"
  latex_packages="texlive texlive-lang-french texlive-latex-extra"
# )

function run_remote_python() {
  url=$1
  wget -qO- ${url} | sudo -E python
  echo "Done: $?"
}

function get_pip() {
  echo "Install setuptools"
  run_remote_python https://bitbucket.org/pypa/setuptools/raw/bootstrap/ez_setup.py
  echo "Install pip"
  run_remote_python https://raw.github.com/pypa/pip/master/contrib/get-pip.py
}

echo "Init and vital packages"
sudo apt-get update
sudo apt-get -y upgrade
sudo apt-get install ${packages}
echo -n "Do you want LaTex to be installed ? [y/N] " 
read want_latex
[ "${want_latex}" == "y" ] && sudo apt-get install ${latex_packages}

echo "Install pip"
install-pip-like-a-boss

echo "Install solarized theme for gnome shell"
sudo git clone git://github.com/sigurdga/gnome-terminal-colors-solarized.git \
   $OPENLIBS/gnome-terminal-colors-solarized
$OPENLIBS/gnome-terminal-colors-solarized/install.sh

echo "Use DNA project to setup shell and dev experience"
wget -qO- https://raw.github.com/hivetech/dna/master/bootstrap.sh | bash
#TODO Edit provision/ansible/data.yml
cd $OPENLIBS/dna && rake dna:synthetize

echo "Create usual directory tree"
[[ -d $HOME/dev/projects/hivetech ]] || mkdir -p $HOME/dev/projects/hivetech
[[ -d $HOME/dev/sandbox ]] || mkdir -p $HOME/dev/sandbox

echo "Setup ssh-key for github"
#TODO real email
read -p "Type encryption salt: " salt
echo "Name rsa key \"github_id_rsa\""
ssh-keygen -t rsa -C "${salt}"
#TODO Get new created key name
ssh-add github_id_rsa
xclip -sel clip < $HOME/.ssh/github_id_rsa.pub
echo "Ctrl-v the key on https://github.com/settings/ssh"

# TODO clone my github projects
# TODO Copy backup files from a storage
