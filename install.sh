#!/usr/bin/env bash

set -euo pipefail

packages=(
  broadcom-wl
  wofi
  waybar
  waypaper
  sotavpn
  zen-browser
  neovim
  git
  ssh
  hyprland
  kitty
  go
  htop
  npm
  linux-headers
  kitty
)

sudo pacman -Syu --needed "${packages[@]}"
yay -S bookokrat-bin

mkdir .config/hyprland
mkdir .config/kitty
cp kitty.conf .config/kitty/
cp hyprland.conf .config/hyprland/
cp -r nvim .config/

