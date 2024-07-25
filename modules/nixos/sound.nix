{ config, lib, pkgs, modulesPath, ... }:
{
  hardware.pulseaudio.package = pkgs.pulseaudioFull;
  hardware.pulseaudio.enable = true;
  nixpkgs.config.pulseaudio = true;
}
