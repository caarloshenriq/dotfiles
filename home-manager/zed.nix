{ pkgs, ... }:

{
  programs.zed-editor = {
    enable = true;
    extensions = [
      "nix"
      "catppuccin"
      "catppuccin-icons"
      "git-firefly"
      "typst"
      "zig"
      "just"
      "rust"
      "go"
      "python"
      "typescript"
      "html"
      "css"
      "json"
      "yaml"
      "toml"
      "lua"
      "dockerfile"
      "terraform"
      "markdown"
      "bash"
      "sql"
      "golangci-lint"
    ];

    userSettings = {
      ui_font_family = "Fira Code";
      buffer_font_family = "Fira Code";
      buffer_font_size = 14;
      telemetry = {
        metrics = false;
        diagnostics = false;
      };
      terminal = {
        shell = {
          program = "bash";
        };
      };
      features = {
        edit_prediction_provider = "copilot";
      };
      format_on_save = "on";
      auto_indent = true;
      lsp = {
        typos = {
          binary = {
            path = "${pkgs.typos-lsp}/bin/typos-lsp";
          };
        };
      };
    };
  };
}
