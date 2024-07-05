{ config, lib, pkgs, ... }:

{
  home.packages = with pkgs; [
    oh-my-zsh
    zsh
  ];

  programs = {
    # https://nixos.asia/en/git
    git = {
      enable = true;
      userName = "Paul Dufour";
      userEmail = "paul.dufour@epita.fr";
      ignores = [ "*~" "*.swp" "swo" ];
      aliases = {
        kk = "status";
      };
      extraConfig = {
        init.defaultBranch = "main";
        pull.rebase = "false";
      };
    };
  };
}
