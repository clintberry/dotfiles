#!/bin/sh

echo "Setting up your Mac..."

DOTFILES="${HOME}/.dotfiles"
SCRIPTS="${DOTFILES}/scripts"

# Check for Oh My Zsh and install if we don't have it
if test ! $(which omz); then
  /bin/sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/HEAD/tools/install.sh)"
fi

# Check for Homebrew and install if we don't have it
if test ! $(which brew); then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> $HOME/.zprofile
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Removes .zshrc from $HOME (if it exists) and symlinks the .zshrc file from the .dotfiles
rm -rf $HOME/.zshrc
ln -s .zshrc $HOME/.zshrc

# Update Homebrew recipes
brew update
brew install cask

# Install all our dependencies with bundle (See Brewfile)
brew tap homebrew/bundle
brew bundle --file=$DOTFILES/Brewfile
brew cleanup

# App store install installations
declare -a mas_apps=(
  '441258766'   # Magnet  #'975937182'   # Fantastical 2
  '865500966'   # Feedly
)

for app in "${mas_apps[@]}"; do
  mas install "$app"
done

# Check for Oh My Zsh and install if we don't have it
if test ! $(which omz); then
  /bin/sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/HEAD/tools/install.sh)"
fi

rm -rf $HOME/.zshrc
ln -s $DOTFILES/.zshrc $HOME/.zshrc

# rm -R $HOME/.ohmyzsh/custom
# ln -s $HOME/.dotfiles/zsh/ohmyzsh/custom $HOME/.oh-my-zsh/custom

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k

ln -s $DOTFILES/.p10k.zsh $HOME/.p10k.zsh

##### MacOS settings
/bin/sh -c $DOTFILES/scripts/macos.sh


##### VSCode stuff
code --install-extension vscodevim.vim
code --install-extension codezombiech.gitignore
code --install-extension zxh404.vscode-proto3
code --install-extension golang.go
code --install-extension ms-vsliveshare.vsliveshare
code --install-extension adamhartford.vscode-base64
code --install-extension ms-vscode-remote.remote-containers
code --install-extension Llam4u.nerdtree
code --install-extension eriklynd.json-tools
code --install-extension GitHub.github-vscode-theme
code --install-extension donjayamanne.git-extension-pack
code --install-extension github.vscode-github-actions
code --install-extension GitHub.codespaces
code --install-extension GitHub.copilot
code --install-extension GitHub.copilot-chat
code --install-extension mikestead.dotenv


