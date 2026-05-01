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
      qt6.full
      sqlfluff
      torsocks
      tree
      zeromq
    ]
    ++ lib.optionals stdenv.isDarwin [
      terraform
    ];
}
