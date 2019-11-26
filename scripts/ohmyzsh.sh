sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

ln -s $HOME/.dotfiles/.zshrc $HOME/.zshrc

# rm -R $HOME/.ohmyzsh/custom
# ln -s $HOME/.dotfiles/zsh/ohmyzsh/custom $HOME/.oh-my-zsh/custom

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k

ln -s $HOME/.dotfiles/.tmux.conf $HOME/.tmux.conf
