#!/bin/bash
if [[ -d "$(eval echo "~/.agpm/")" ]]; then
    echo "Agpm directory exists"
else
    echo "Agpm directory does not exist. Creating directory..."
    mkdir ~/.agpm/
fi
cd ~/.agpm
if [[ -d "$(eval echo "~/.agpm/pidms-advance/")" ]]; then
    echo "Package directory exists already, try update instead"
    exit
else
    echo "Package not installed, installing..."
    mkdir ~/.agpm/pidms-advance && cd ~/.agpm/pidms-advance
    curl -O https://eyescary-development.github.io/CDN/agpm_packages/pidms-advance/package.zip
    unzip package.zip
    rm package.zip
    if [ "$SHELL" == "/bin/zsh" ]; then
      export file="$HOME/.zshrc"
    elif [ "$SHELL" == "/bin/bash" ]; then
      export file="$HOME/.bashrc"
    elif ["$SHELL" == "/bin/fish"]; then
      export file="$HOME/.config/fish/config.fish"
    else
      echo "Your shell is not supported, make all aliases manually"
      exit
    fi
      echo "alias pidms='python3 ~/.agpm/pidms-advance/menu.py'" >> "$file"
      echo "Package installed successfully!"
fi
