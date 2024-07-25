{
  mode,
  pkgs,
  lib,
  ...
}: {
  home.packages = with pkgs; [
    (neovim.override {
      withPython3 = true;
      withNodeJs = true;
      vimAlias = true;
      viAlias = true;
    })

    alejandra
    cargo
    deadnix
    ripgrep
    ruff
    tree-sitter
    statix
  ];

  xdg.configFile."nvim" = {
    source = ./config;
    recursive = true;
  };
}
