{ pkgs, inputs, ... }:
{
  imports = [
    inputs.plasma-manager.homeModules.plasma-manager
    ./kde.nix
    ./git.nix
    ./zed.nix
    ./gpg.nix
    ./neovim.nix
    ./lsp.nix
    ./zellij.nix
    ./zsh.nix
    ./ghostty.nix
    ./atuin.nix
    ./clis.nix
    ./tuis.nix
  ];

  home.username = "carlin";
  home.homeDirectory = "/home/carlin";
  home.stateVersion = "24.11";

  home.packages = with pkgs; [
    nodejs
    yarn
    go
    rustup
    jdk
    lazygit
    docker
    spotify
    dotnet-sdk_8
    vial
    tor
    tor-browser
    firefox
    vesktop
    obsidian
    vivaldi
    copyq
    fira-code
  ];

  programs.home-manager.enable = true;
}
