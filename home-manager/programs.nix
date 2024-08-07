{
  flake,
  pkgs,
  ...
}: {
  imports = [
  ];
  programs = {
    # Better `cat`
    bat.enable = true;
    # Type `z <pat>` to cd to some directory
    zoxide.enable = true;
    # Type `<ctrl> + r` to fuzzy search your shell history
    fzf.enable = true;
    jq.enable = true;
    htop.enable = true;

    # https://nixos.asia/en/direnv
    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };
  };

  home.packages = with pkgs; [
    (discord.override {nss = nss_latest;})
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
    prismlauncher
    qemu_kvm
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
}
