{
  config,
  lib,
  pkgs,
  modulesPath,
  ...
}: {
  services.blueman.enable = true;
  hardware.bluetooth.enable = true;
}
