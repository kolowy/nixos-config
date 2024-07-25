# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)
{ inputs
, outputs
, lib
, config
, pkgs
, ...
}: {

  nixpkgs = {
    # You can add overlays here
    overlays = [
      # Add overlays your own flake exports (from overlays and pkgs dir):
      outputs.overlays.additions
      outputs.overlays.modifications
      outputs.overlays.unstable-packages

      # You can also add overlays exported from other flakes:
      # neovim-nightly-overlay.overlays.default

      # Or define it inline, for example:
      # (final: prev: {
      #   hi = final.hello.overrideAttrs (oldAttrs: {
      #     patches = [ ./change-hello-to-hi.patch ];
      #   });
      # })
    ];
    # Configure your nixpkgs instance
    config = {
      # Disable if you don't want unfree packages
      allowUnfree = true;
      # Workaround for https://github.com/nix-community/home-manager/issues/2942
      allowUnfreePredicate = _: true;
    };
  };

  # Set your username
  home = {
    username = "jp";
    homeDirectory = "/home/jp";
  };

  home.sessionVariables = {
    EDITOR = "vim";
    NIX_LD = "$HOME/.nix-profile/bin/nix-ld";
  };

  # Enable home-manager and git
  programs.home-manager.enable = true;
  programs.git.enable = true;

  # programs.sway.enable = true;

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "24.05";

  # Add stuff for your user as you see fit:
  # programs.neovim.enable = true;
  home.packages = with pkgs; [
    (discord.override { nss = nss_latest; })
    apache-directory-studio
    alacritty
    arandr
    awscli2
    bat
    bear
    bitwarden
    blueman
    blueberry
    brave
    brightnessctl
    cachix
    chromium
    clang-tools
    criterion
    dig
    docker
    docker-compose
    dunst
    file
    flameshot
    font-manager
    gdb
    git-lfs
    gnutar
    htop
    jdk
    jq
    libnotify
    libreoffice
    libyamlcpp
    networkmanagerapplet
    nix-health
    nil
    nix-info
    nixpkgs-fmt
    nixci
    nodejs
    noto-fonts-emoji
    openssl
    openvpn
    papirus-icon-theme
    pavucontrol
    picom
    poetry
    postgresql
    pulseaudio
    pavucontrol
    ripgrep
    slack
    sqlfluff
    sqls
    sshfs
    tree
    unzip
    valgrind
    virt-manager
    virtualbox
    vscodium
    wget
    wireguard-tools
    wireshark
    xfce.xfce4-terminal
    xidlehook
    xsel
    xss-lock
    xz
    yamllint
    yarn
    yq
    zip
    zlib
  ];

  imports = [
    ./programs.nix
    ./zsh.nix
    ./git.nix
    ./vim.nix
    ./nvim.nix
    ./i3.nix
  ];
}
