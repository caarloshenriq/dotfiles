{ pkgs, ... }:
{
  home.packages = with pkgs; [
    mise
    just
    bat
    ripgrep
    fzf
    nushell
    zoxide
  ];
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    initContent = ''
      export EDITOR=vim
      export VISUAL=vim
      export GIT_EDITOR=vim
      export PATH="$HOME/.npm-global/bin:$PATH"
      export CGO_ENABLED=0
      # Accept suggestion with Ctrl+Space
      bindkey '^ ' autosuggest-accept
      # Activate mise
      eval "$(mise activate zsh)"
      # Activate zoxide
      eval "$(zoxide init zsh)"
      # Enable just completion
      autoload -U compinit && compinit
      if command -v just >/dev/null 2>&1; then
        source <(just --completions zsh)
      fi
    '';
    oh-my-zsh = {
      enable = true;
      theme = "robbyrussell";
      plugins = [ "git" "sudo" ];
    };
    plugins = [
      {
        name = "fzf-tab";
        src = pkgs.fetchFromGitHub {
          owner = "Aloxaf";
          repo = "fzf-tab";
          rev = "v1.2.0";
          sha256 = "sha256-Qv8zAiMtrr67CbLRrFjGaPzFZcOiMVEFLg1Z+N6VMhg=";
        };
      }
    ];
  };
}
