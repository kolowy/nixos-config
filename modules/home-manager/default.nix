# Add your reusable home-manager modules to this directory, on their own file (https://nixos.wiki/wiki/Module).
# These should be stuff you would like to share with others, not your personal configurations.
{
  # List your module files here
  # my-module = import ./my-module.nix;
  alacritty = import ./alacritty.nix;
  astronvim = import ./astronvim;
  git = import ./git.nix;
  i3 = import ./i3.nix;
  vim = import ./vim.nix;
  zsh = import ./zsh.nix;
}
