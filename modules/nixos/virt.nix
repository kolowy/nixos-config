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
      enable = false;
      qemu = {
        swtpm.enable = true;
        ovmf.packages = [(pkgs.OVMFFull).fd];
      };
    };
  };
}
