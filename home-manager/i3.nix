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
      startup = [
        { command = "--nostartup-id xss-lock --transfer-sleep-lock -- i3lock --nofork"; }
      ];
      keycodebindings = {
        "XF86AudioMute" = "exec --no-startup-id pactl set-sink-mute @DEFAULT_SINK@ toggle";
        "XF86AudioRaiseVolume" = "exec --no-startup-id pactl set-sink-volume @DEFAULT_SINK@ +10%";
        "XF86AudioLowerVolume" = "exec --no-startup-id pactl set-sink-volume @DEFAULT_SINK@ -10%";
      };
    };
    extraConfig = ''
      #Hide window title bar
      default_border pixel 1
      default_floating_border pixel 1
      for_window [class="^.*"] border pixel 1
      '';
  };
}
