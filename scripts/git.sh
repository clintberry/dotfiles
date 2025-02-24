echo "Set git default settings"
export email=clint@getkolla.com
# Set default push behavior to match branch name automatically
git config --global push.default current
git config --global init.defaultBranch main
# Set default git email
git config --global user.email $email
git config --global user.name "Clint Berry"
git config --global core.editor "code --wait"
git config --global --type bool push.autoSetupRemote true

echo "Generating a new SSH key for GitHub..."

# Generating a new SSH key
# https://docs.github.com/en/github/authenticating-to-github/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent#generating-a-new-ssh-key
ssh-keygen -t ed25519 -C $1 -f ~/.ssh/id_ed25519

# Adding your SSH key to the ssh-agent
# https://docs.github.com/en/github/authenticating-to-github/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent#adding-your-ssh-key-to-the-ssh-agent
eval "$(ssh-agent -s)"

touch ~/.ssh/config
echo "Host *\n AddKeysToAgent yes\n UseKeychain yes\n IdentityFile ~/.ssh/id_ed25519" | tee ~/.ssh/config

ssh-add -K ~/.ssh/id_ed25519
gh auth login # This auto adds your ssh key as part of its process

# echo "Generate GPG key"
# gpg --full-generate-key


# see https://docs.github.com/en/authentication/managing-commit-signature-verification/generating-a-new-gpg-key
# gpg --armor --export [[ID goes here]]


