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

# Symlink the Mackup config file to the home directory
ln -s $DOTFILES/.mackup.cfg $HOME/.mackup.cfg
mackup restore -f


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


echo "Set git default settings"
export email=clint.b.berry@gmail.com
# Set default push behavior to match branch name automatically
git config --global push.default current
git config --global init.defaultBranch main
# Set default git email
git config --global user.email $email
git config --global user.name "Clint Berry"
git config --global core.editor "code --wait"

echo "Generating a new SSH key for GitHub..."

# Generating a new SSH key
# https://docs.github.com/en/github/authenticating-to-github/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent#generating-a-new-ssh-key
ssh-keygen -t ed25519 -C $email -f ~/.ssh/id_ed25519

# Adding your SSH key to the ssh-agent
# https://docs.github.com/en/github/authenticating-to-github/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent#adding-your-ssh-key-to-the-ssh-agent
eval "$(ssh-agent -s)"

touch ~/.ssh/config
echo "Host *\n AddKeysToAgent yes\n UseKeychain yes\n IdentityFile ~/.ssh/id_ed25519" | tee ~/.ssh/config

ssh-add -K ~/.ssh/id_ed25519
gh auth login # This auto adds your ssh key as part of its process


##### MacOS settings - run last
/bin/sh -c $DOTFILES/scripts/macos.sh

