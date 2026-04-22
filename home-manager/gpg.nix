{ pkgs, ... }:
{
  programs.gpg = {
    enable = true;
    settings = {
      default-key = "0x82B003D3ABB16152";
    };
  };

  services.gpg-agent = {
    enable = true;
    pinentry.package = pkgs.pinentry-tty;
    defaultCacheTtl = 28800; # 8 hours
    maxCacheTtl = 86400;     # 24 hours
  };
}
