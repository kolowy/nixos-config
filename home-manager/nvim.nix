{ config
, lib
, pkgs
, ...
}: {
  home.packages = with pkgs; [
    (neovim.override {
      withPython3 = true;
      withNodeJs = true;
      viAlias = true;
    })

    alejandra
    cargo
    deadnix
    ripgrep
    ruff
    tree-sitter
    statix
    gcc
  ];

  #xdg.configFile."nvim" = {
  #  source = ./nvim;
  #  recursive = true;
  #};
}
