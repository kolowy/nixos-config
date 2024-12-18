{
  config,
  lib,
  pkgs,
  modulesPath,
  ...
}: {
  environment.systemPackages = with pkgs; [
    yubico-piv-tool
    yubikey-manager
    yubikey-personalization
    yubikey-personalization-gui
  ];

  services.pcscd.enable = true;

  security.pam.u2f = {
    enable = true;
    cue = true;
  };
}
