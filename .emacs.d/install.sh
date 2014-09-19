#!/bin/bash

# Cask
if [[ -e ~/.cask ]]; then
    echo "Updating Cask REPO"
    cd ~/.cask && git pull && cd -
else
    echo "Cloning Cask REPO"
    git clone https://github.com/cask/cask.git ~/.cask
fi

grep cask/bin ~/.bash_profile 1>/dev/null 2>&1
if [ $? -ne 0 ]; then
    echo "Adding \$HOME/.cask/bin to \$PATH in ~/.bash_profile"
    echo '' >> ~/.bash_profile
    echo "# Added by ~/.emacs.d/install.sh" >> ~/.bash_profile
    echo "export PATH=\$HOME/.cask/bin:\$PATH" >> ~/.bash_profile
fi

export PATH=$HOME/.cask/bin:$PATH

cd ~/.emacs.d
cask install

# For Python / ELPY
# Prerequisite: Install Python as per:
# http://docs.python-guide.org/en/latest/#getting-started
#pip install --upgrade elpy flake8 rope jedi ipython

# other stuff
