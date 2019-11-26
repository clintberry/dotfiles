DOTFILES="${HOME}/.dotfiles"
SCRIPTS="${DOTFILES}/scripts"

all: setup brew appstore

setup:
	xcode-select --install
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	brew install cask

brew:
	brew upgrade && brew update
	brew bundle --file=~/.dotfiles/Brewfile
	brew cleanup
	brew doctor

appstore:
	$(SCRIPTS)/mac-app-store.sh

vscode:
	$(SCRIPTS)/vscode.sh




