{ pkgs, ... }:
{
  programs.gpg = {
    enable = true;
    settings = {
      default-key = "0x15CBADFE29F2017B";
    };
    scdaemonSettings = {
      disable-ccid = true;
      pcsc-shared = true;
      card-timeout = "1";
    };
  };

  services.gpg-agent = {
    enable = true;
    enableSshSupport = true;
    pinentry.package = pkgs.pinentry-curses;
    defaultCacheTtl = 28800; # 8 hours
    maxCacheTtl = 86400;     # 24 hours
  };
}
