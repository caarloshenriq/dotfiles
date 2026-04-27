{ pkgs, ... }:
{
  imports = [
    ./git.nix
    ./zed.nix
    ./gpg.nix
    ./neovim.nix
    ./lsp.nix
    ./zellij.nix
    ./zsh.nix
    ./ghostty.nix
    ./atuin.nix
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
    act
    firefox
    vesktop
    obsidian
  ];

  programs.home-manager.enable = true;
}
