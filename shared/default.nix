{ config, lib, pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    zlib
    aspell
    aspellDicts.en
    perl
    bind
    docker
    docker-compose
    neovim
    emacs
    fd
    binutils_nogold
    feh
    file
    fzf
    git
    fish
    starship
    gnum4
    gnupg
    htop
    imagemagick
    scrot
    lsof
    man-pages
    ncdu
    psmisc
    python311
    ripgrep
    rsync
    shellcheck
    smartmontools
    stow
    tmux
    unzip
    wget
    curl
    which
    xorg.xmodmap
    tldr
    whois
    sysstat
    lm_sensors
    qpdfview
    xclip
    pkg-config
    openssl
    marksman
    pipes
    kitty
    hwinfo
    libnotify
    libtool
    dunst
    polkit
    nix-index
    zoxide
    volumeicon
    discord
  ];

  # system shell
  environment.shells = with pkgs; [ fish ];

  # fonts settings
  fonts = {
    fonts = with pkgs;
      [ (nerdfonts.override { fonts = [ "JetBrainsMono" ]; }) ];
  };
}
