{
  flake,
  pkgs,
  ...
}: {
  imports = [
  ];
  programs = {
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
    ansible
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
    (vscode-with-extensions.override {
      vscodeExtensions = with vscode-extensions; [
        bbenoist.nix
        ms-python.python
        ms-azuretools.vscode-docker
        batisteo.vscode-django
        vscodevim.vim
      ];
    })
    criterion
    dig
    docker
    docker-compose
    dunst
    file
    firefox
    flameshot
    font-manager
    gdb
    git-lfs
    gnutar
    gnupg
    htop
    jdk
    jq
    kubectl
    kubernetes-helm
    kns
    libnotify
    libreoffice
    libyamlcpp
    llvmPackages_12.libcxxClang
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
    tmux
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

    dconf
  ];
}
