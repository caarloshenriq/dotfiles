{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # Nix
    nil
    nixd                  # Nix LSP
    nixpkgs-fmt           # Nix formatter
    statix                # Nix linter

    # Go
    gopls                 # Go LSP
    gofumpt               # Go formatter
    golangci-lint         # Go linter
    delve                 # Go debugger

    # Python
    pyright               # Python LSP
    black                 # Python formatter
    ruff                  # Python linter/formatter

    # JavaScript / TypeScript / Web
    typescript-language-server     # TypeScript/JavaScript LSP
    vscode-langservers-extracted   # HTML/CSS/JSON/ESLint LSPs
    prettier                      # JS/TS/HTML/CSS formatter
    eslint                        # JavaScript/TypeScript linter

    # Lua
    lua-language-server    # Lua LSP
    stylua                 # Lua formatter

    # C / C++
    clang-tools            # C/C++ LSP, includes clangd
    lldb                   # C/C++/Rust debugger

    # Zig
    zls                    # Zig LSP

    # Markdown / Config files
    marksman               # Markdown LSP
    yaml-language-server   # YAML LSP
    taplo                  # TOML LSP

    # Shell
    bash-language-server   # Bash LSP
    shfmt                  # Shell script formatter
    shellcheck             # Shell script linter

    # Docker / Terraform
    dockerfile-language-server # Dockerfile LSP
    terraform-ls              # Terraform LSP

    # Spell checking
    typos                 # Spell checker
    typos-lsp             # Typos LSP server
  ];
}
