{ config, lib, pkgs, modulesPath, ... }:
{
  virtualisation = {
    docker.enable = true;
    docker.rootless = {
      enable = true;
      setSocketVariable = true;
    };
    libvirtd.enable = true;
    # vmware.host.enable = true;
    virtualbox = {
      guest.enable = true;
      host = {
        enable = true;
        enableExtensionPack = true;
      };
    };
  };
}
