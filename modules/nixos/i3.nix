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
}
