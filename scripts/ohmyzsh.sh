# Check for Oh My Zsh and install if we don't have it
if test ! $(which omz); then
  /bin/sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/HEAD/tools/install.sh)"
fi

ln -s $HOME/.dotfiles/.zshrc $HOME/.zshrc

# rm -R $HOME/.ohmyzsh/custom
# ln -s $HOME/.dotfiles/zsh/ohmyzsh/custom $HOME/.oh-my-zsh/custom

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k

ln -s $HOME/.dotfiles/.p10k.zsh $HOME/.p10k.zsh
ln -s $HOME/.dotfiles/.tmux.conf $HOME/.tmux.conf

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
