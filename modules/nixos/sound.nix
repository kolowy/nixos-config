{
  config,
  lib,
  pkgs,
  modulesPath,
  ...
}: {
  #hardware.pulseaudio.package = pkgs.pulseaudioFull;
  #hardware.pulseaudio.enable = true;
  #hardware.pulseaudio.enable = true;
  nixpkgs.config.pulseaudio = false;
  #hardware.pulseaudio.extraConfig = "load-module module-combine-sink";
}
