{ pkgs, ... }:
{
  home.packages = with pkgs; [
    k9s
    lazydocker
    btop
    htop
  ];

  programs.lazygit = {
    enable = true;
    settings = {
      git = {
        pagers = [
          {
            colorArg = "always";
            pager = "delta --dark --paging=never";
          }
        ];
      };
    };
  };
}
