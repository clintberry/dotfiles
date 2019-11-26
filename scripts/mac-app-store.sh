# App store install installations
declare -a mas_apps=(
  '441258766'   # Magnet
  '975937182'   # Fantastical 2
)

for app in "${mas_apps[@]}"; do
  mas install "$app"
done