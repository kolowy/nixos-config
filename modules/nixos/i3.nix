{
  config,
  lib,
  pkgs,
  modulesPath,
  ...
}: {
  # Configure keymap in X11
  services.displayManager = {
    defaultSession = "none+i3";
  };

  services.fwupd.enable = true;

  services.xserver = {
    enable = true;
    xkb = {
      layout = "us";
      variant = "";
    };

    desktopManager = {
      xterm.enable = false;
    };

    # displayManager.setupCommands = ''
    #   LEFT='DVI-D-0'
    #   CENTER='DVI-I-1'
    #   RIGHT='HDMI-A-0'
    #   ${pkgs.xorg.xrandr}/bin/xrandr --output eDP-1 --primary --mode 1920x1200 --pos 266x1440 --rotate normal --output HDMI-1 --mode 2560x1440 --pos 0x0 --rotate normal --output DP-1 --off --output DP-2 --off --output DP-3 --off --output DP-4 --off --output DP-5 --off --output DP-6 --off
    # '';
    windowManager.i3 = {
      enable = true;
      extraPackages = with pkgs; [
        dmenu
        i3status
        i3lock
        i3blocks
      ];
    };
  };

  programs.ssh = {
    startAgent = true;
  };
}
