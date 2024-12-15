{
  config,
  lib,
  pkgs,
  modulesPath,
  ...
}: {
  virtualisation = {
    docker.enable = true;
    docker.rootless = {
      enable = true;
      setSocketVariable = true;
    };

    libvirtd = {
      enable = true;
      qemu = {
        swtpm.enable = true;
        ovmf.packages = [(pkgs.OVMFFull).fd];
      };
    };

    # vmware.host.enable = true;
    # virtualbox = {
    #   guest.enable = true;
    #   host = {
    #     enable = true;
    #     enableExtensionPack = true;
    #   };
    # };
  };
}
