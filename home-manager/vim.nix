{ config
, lib
, pkgs
, ...
}: {
  home.packages = with pkgs; [
    oh-my-zsh
    zsh
  ];

  programs = {
    # https://nixos.asia/en/git
    vim = {
      enable = true;
      defaultEditor = true;
      plugins = with pkgs.vimPlugins; [
        vim-airline
        vim-airline-themes
        gruvbox
        coc-nvim
        vim-fugitive
        plenary-nvim
        telescope-nvim
      ];
      extraConfig = builtins.readFile (vimConfig/vimrc);
    };
  };
}
