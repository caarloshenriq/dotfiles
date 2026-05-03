#!/usr/bin/env bash
set -e

echo "==> Checking if Nix is installed..."
if ! command -v nix &>/dev/null; then
  echo "==> Installing Nix..."
  curl -L https://nixos.org/nix/install | sh -s -- --daemon
  . /etc/profile.d/nix.sh
else
  echo "    Nix already installed: $(nix --version)"
fi

echo "==> Enabling flakes and nix-command..."
mkdir -p ~/.config/nix
if ! grep -q "experimental-features" ~/.config/nix/nix.conf 2>/dev/null; then
  echo "experimental-features = nix-command flakes" >> ~/.config/nix/nix.conf
fi

echo "==> Applying NixOS system configuration..."
sudo cp ~/dotfiles/nix/modules/picokey-gpg.nix /etc/nixos/picokey-gpg.nix
sudo nixos-rebuild switch

echo "==> Applying home-manager configuration..."
nix run home-manager/master -- switch --flake .#carlin

echo ""
echo "✓ Setup complete! Restart your terminal or run: exec zsh"
echo ""
echo "Don't forget to import your GPG public key:"
echo "  gpg --import pub-key-bkp.asc"
