{
  config,
  lib,
  pkgs,
  ...
}: let
  modifier = config.xsession.windowManager.i3.config.modifier;
in {
  xsession.windowManager.i3 = {
    enable = true;
    package = pkgs.i3-gaps;
    config = {
      modifier = "Mod4";
      terminal = "alacritty";
      defaultWorkspace = "1";
      workspaceAutoBackAndForth = true;
      window = {
        titlebar = false; # Configure border style <pixel xx>
        border = 0; # Configure border style <xx 0>
        hideEdgeBorders = "smart"; # Hide borders
      };
      bars = [
        {
          position = "top";
          statusCommand = "${pkgs.i3status}/bin/i3status";
        }
      ];
      startup = [
        {command = "--nostartup-id xss-lock --transfer-sleep-lock -- i3lock --nofork";}
      ];
      keybindings =
        lib.mkOptionDefault
        {
          "${modifier}+m" = "exec pavucontrol";
          "${modifier}+Shift+m" = "exec blueberry";

          "XF86AudioMute" = "exec --no-startup-id pactl set-sink-mute @DEFAULT_SINK@ toggle";
          "XF86AudioRaiseVolume" = "exec --no-startup-id pactl set-sink-volume @DEFAULT_SINK@ +10%";
          "XF86AudioLowerVolume" = "exec --no-startup-id pactl set-sink-volume @DEFAULT_SINK@ -10%";

          "XF86MonBrightnessUp" = "exec --no-startup-id brightnessctl s +5%";
          "XF86MonBrightnessDown" = "exec --no-startup-id brightnessctl s 5%-";

          "F8" = "exec arandr";
          "F9" = "exec i3lock";
          "F11" = "exec flameshot gui";
          "F12" = "exec ${pkgs.alacritty}/bin/alacritty -t htop -e ${pkgs.htop}/bin/htop &";
          "Print" = "exec flameshot full";
        };
      keycodebindings = {};
    };
    extraConfig = ''
    '';
  };
}
