{ ... }:

{
  programs.ghostty = {
    enable = true;
    settings = {
      # Font
      font-size = 14;

      # Window
      background-opacity = 0.95;
      background-blur-radius = 20;
      maximize = true;

      # Theme
      theme = "Catppuccin Mocha";

      # Shell
      shell-integration = "zsh";
      quit-after-last-window-closed = true;

      # Keybindings: Override Alt+arrow defaults to allow Zellij pane navigation
      # Ghostty defaults map alt+arrow_left to esc:b and alt+arrow_right to esc:f (word movement)
      # We override to send the raw terminal sequences so Zellij receives Alt+Left/Right for pane focus
      keybind = [
        "alt+arrow_left=csi:1;3D"
        "alt+arrow_right=csi:1;3C"
      ];
    };
  };
}
