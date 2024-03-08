DOTFILES="${HOME}/.dotfiles"
SCRIPTS="${DOTFILES}/scripts"

all: setup brew appstore ohmyzsh vscode

setup:
	# xcode-select --install
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	brew install cask

brew:
	brew upgrade && brew update
	brew bundle --file=~/.dotfiles/Brewfile
	brew cleanup
	brew doctor

ohmyzsh:
	$(SCRIPTS)/ohmyzsh.sh

appstore:
	$(SCRIPTS)/mac-app-store.sh

vscode:
	$(SCRIPTS)/vscode.sh


ssh:
	$(SCRIPTS)/ssh.sh




