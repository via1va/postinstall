#!/usr/bin/env bash

set -euo pipefail

official_packages=(
  wofi
  waybar
  neovim
  git
  openssh
  hyprland
  kitty
  go
  htop
  npm
  linux-headers
  base-devel
  ranger
)

aur_packages=(
  broadcom-wl
  waypaper
  sotavpn
  zen-browser
  bookokrat-bin
)

sudo pacman -Syu --needed "${official_packages[@]}"

if ! command -v yay >/dev/null 2>&1; then
  tmp_dir="$(mktemp -d)"

  git clone https://aur.archlinux.org/yay.git "$tmp_dir/yay"

  (
    cd "$tmp_dir/yay"
    makepkg -si --noconfirm
  )

  rm -rf "$tmp_dir"
fi

yay -S --needed "${aur_packages[@]}"

mkdir -p \
  "$HOME/.config/hypr" \
  "$HOME/.config/kitty"

cp kitty.conf "$HOME/.config/kitty/kitty.conf"
cp hyprland.conf "$HOME/.config/hypr/hyprland.conf"
cp -r nvim "$HOME/.config/"
cp -r waybar "$HOME/.config/"
