# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)
{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
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
    brave
    brightnessctl
    cachix
    cargo
    chromium
    clang-tools
    conky
    criterion
    dig
    docker
    docker-compose
    dunst
    feh
    file
    flameshot
    font-manager
    gdb
    git-lfs
    gnutar
    htop
    inconsolata-nerdfont
    iosevka
    jdk
    jq
    libnotify
    libreoffice
    libyamlcpp
    nerdfonts
    networkmanagerapplet
    nitrogen
    nix-health
    nil
    nix-info
    nixpkgs-fmt
    nixci
    nodePackages_latest.bash-language-server
    nodePackages_latest.dockerfile-language-server-nodejs
    nodePackages_latest.typescript-language-server
    nodePackages_latest.vscode-langservers-extracted
    nodePackages_latest.yaml-language-server
    nodejs
    noto-fonts-emoji
    olvid
    openssl
    openvpn
    papirus-icon-theme
    pavucontrol
    picom
    poetry
    postgresql
    pulseaudio
    ripgrep
    slack
    slrn
    sqlfluff
    sqls
    sshfs
    sumneko-lua-language-server
    tree
    unzip
    valgrind
    virt-manager
    virtualbox
    vscodium
    weechat
    wget
    wireguard-tools
    wireshark
    xdg-utils
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
