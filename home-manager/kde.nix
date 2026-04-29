{ ... }:
{
  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "text/html" = "vivaldi-stable.desktop";
      "x-scheme-handler/http" = "vivaldi-stable.desktop";
      "x-scheme-handler/https" = "vivaldi-stable.desktop";
      "x-scheme-handler/about" = "vivaldi-stable.desktop";
      "x-scheme-handler/unknown" = "vivaldi-stable.desktop";
    };
  };

  home.file = {
    ".local/share/wallpapers/degirled.png".source = builtins.fetchurl {
      url = "https://files.orangc.net/media/walls-catppuccin-mocha/degirled.png?k=0mI1&cache";
      sha256 = "1npzr7m3zvaf53hljc7hydgd57if538mdx3n7xbxf8ppvy7ayn9s";
      name = "degirled.png";
    };
    ".local/share/wallpapers/lantern.png".source = builtins.fetchurl {
      url = "https://files.orangc.net/media/walls-catppuccin-mocha/lantern-light-room.png?k=3kIa&cache";
      sha256 = "0pgr21kszgxn0h32ypfvw7dbixp8cssiam9zd9zcpm4899vz8bnc";
      name = "lantern.png";
    };
  };

  programs.plasma = {
    enable = true;
    workspace = {
      lookAndFeel = "org.kde.breezedark.desktop";
      colorScheme = "BreezeDark";
      theme = "breeze-dark";
      wallpaper = "/home/carlin/.local/share/wallpapers/degirled.png";
    };
  };
}
