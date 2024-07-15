{ config, lib, pkgs, ... }:
{
  xsession.windowManager.i3 = {
    enable = true;
    package = pkgs.i3-gaps;
    config = {
      modifier = "Mod4";
      terminal = "alacritty";
      window = {
        hideEdgeBorders = "none";
      };
      bars = [{
        position = "top";
        statusCommand = "${pkgs.i3status}/bin/i3status";
      }];
    };
    extraConfig = ''
      #Hide window title bar
      default_border pixel 1
      default_floating_border pixel 1
      for_window [class="^.*"] border pixel 1
      '';
  };
}
