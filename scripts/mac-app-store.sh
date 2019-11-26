# App store install installations
declare -a mas_apps=(
  '441258766'   # Magnet
)

for app in "${mas_apps[@]}"; do
  mas install "$app"
done