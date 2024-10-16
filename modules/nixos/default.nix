# Add your reusable NixOS modules to this directory, on their own file (https://nixos.wiki/wiki/Module).
# These should be stuff you would like to share with others, not your personal configurations.
{
  # List your module files here
  # my-module = import ./my-module.nix;
  bluetooth = import ./bluetooth.nix;
  i3 = import ./i3.nix;
  #printer = import ./printer.nix;
  sound = import ./sound.nix;
  virt = import ./virt.nix;
  yubikey = import ./yubikey.nix;
}
