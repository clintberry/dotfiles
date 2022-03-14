read -p "Enter github email : " email
echo "Using email $email"
echo "Generating key"
ssh-keygen -t rsa -b 4096 -C "$email"
ssh-add ~/.ssh/id_rsa
gh ssh-key add ~/.ssh/id_rsa.pub