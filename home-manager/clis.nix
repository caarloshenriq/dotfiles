{ pkgs, lib, ... }:
{
  home.packages = with pkgs;
    [
      act
      argocd
      boost
      cmake
      git-absorb
      llvm
      ninja
      pkg-config
      sqlfluff
      torsocks
      tree
      zeromq
    ]
    ++ lib.optionals stdenv.isDarwin [
      terraform
    ];
}
