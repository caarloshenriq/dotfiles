{ ... }:
{
  programs.git = {
    enable = true;

    # User git configuration
    userName = "Carlos Santos";
    userEmail = "rickhenriquetab@gmail.com";

    ignores = [
      "debug/"
      "target/"

      # Helix
      ".helix/"

      # Zed
      ".zed/"

      # VSCode Workspace Folder
      ".vscode/"

      #Jetbrains
      ".idea/"

      # Golang
      ".gocache/"
      ".gomodcache/"

      # Python
      "*.pyc"
      "*.egg"
      "*.out"
      "venv/"
      "**/**/__pycache__/"

      # direnv
      ".direnv"
      ".envrc"

      # NodeJS/Web dev
      ".env/"
      "node_modules"
      ".sass-cache"

      # Claude
      "**/.claude/settings.local.json"

      #ignore my own just commands, bc some projects only uses make...
      ".justfile"
    ];

    extraConfig = {
      init.defaultBranch = "main";
      core.editor = "vim";

      # Delta pager options (core.pager and interactive.diffFilter are set automatically by programs.git.delta)
      merge.conflictstyle = "diff3";
      diff.colorMoved = "default";

      # GPG signing configuration
      user.signingkey = "0x82B003D3ABB16152";
      commit.gpgsign = true;
      tag.gpgsign = true;
      gpg.program = "gpg";

      push.autoSetupRemote = true;

      # Git aliases
      alias = {
        a = "add";
        cm = "commit";
        co = "checkout";
        st = "status";
        last = "log -1 HEAD";
        ca = "commit --amend";
      };
    };

    delta = {
      enable = true;
      options = {
        navigate = true;
        side-by-side = true;
        line-numbers = true;
        syntax-theme = "ansi";
      };
    };
  };
}
