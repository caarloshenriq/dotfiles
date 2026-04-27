{ ... }:

{
  programs.git = {
    enable = true;

    signing = {
      format = "openpgp";
    };

    ignores = [
      "debug/"
      "target/"

      ".helix/"
      ".zed/"
      ".vscode/"
      ".idea/"

      ".gocache/"
      ".gomodcache/"

      "*.pyc"
      "*.egg"
      "*.out"
      "venv/"
      "**/**/__pycache__/"

      ".direnv"
      ".envrc"

      ".env/"
      "node_modules"
      ".sass-cache"

      "**/.claude/settings.local.json"

      ".justfile"
    ];

    settings = {
      user = {
        name = "Carlos Santos";
        email = "rickhenriquetab@gmail.com";
        signingkey = "0x82B003D3ABB16152";
      };

      init = {
        defaultBranch = "main";
      };

      core = {
        editor = "vim";
      };

      merge = {
        conflictstyle = "diff3";
      };

      diff = {
        colorMoved = "default";
      };

      commit = {
        gpgsign = true;
      };

      tag = {
        gpgsign = true;
      };

      gpg = {
        program = "gpg";
      };

      push = {
        autoSetupRemote = true;
      };

      alias = {
        a = "add";
        cm = "commit";
        co = "checkout";
        st = "status";
        last = "log -1 HEAD";
        ca = "commit --amend";
      };
    };
  };

  programs.delta = {
    enable = true;
    enableGitIntegration = true;

    options = {
      navigate = true;
      side-by-side = true;
      line-numbers = true;
      syntax-theme = "ansi";
    };
  };
}
