{
  config,
  lib,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    alacritty
  ];

  programs = {
    alacritty = {
      enable = true;
      settings = {
        window = {
          opacity = 0.9;
        };
        scrolling = {
          history = 100000;
        };
        font = {
          size = 7;
        };
        cursor = {
          style = {
            shape = "Beam";
          };
        };
        bell = {
          duration = 1;
        };
        mouse = {
          hide_when_typing = true;
        };
      };
    };
  };
}
