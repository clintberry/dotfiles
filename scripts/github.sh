echo "Set git default settings"
read -p "Enter github email : " email
# Set default push behavior to match branch name automatically
git config --global push.default current
git config --global init.defaultBranch main
# Set default git email
git config --global user.email $email
git config --global user.name "Clint Berry"
git config --global core.editor "code --wait"
echo "Generate and add ssh key"
echo "Using email $email"
echo "Generating key"
ssh-keygen -t rsa -b 4096 -C "$email"
ssh-add ~/.ssh/id_rsa
gh auth login # This auto adds your ssh key as part of its process

echo "Generate GPG key"
gpg --full-generate-key


# see https://docs.github.com/en/authentication/managing-commit-signature-verification/generating-a-new-gpg-key
# gpg --armor --export [[ID goes here]]


