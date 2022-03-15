echo "Generate and add ssh key"
read -p "Enter github email : " email
echo "Using email $email"
echo "Generating key"
ssh-keygen -t rsa -b 4096 -C "$email"
ssh-add ~/.ssh/id_rsa
gh auth login # This auto adds your ssh key as part of its process

echo "Generate GPG key"
gpg --full-generate-key


# see https://docs.github.com/en/authentication/managing-commit-signature-verification/generating-a-new-gpg-key
# gpg --armor --export [[ID goes here]]


