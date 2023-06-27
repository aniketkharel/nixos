{ config, lib, pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    fish
    harfbuzz
    webkitgtk
    fontconfig
    freetype
    neofetch
    exa
    bat
    gcc
    grc
    zlib
    aspell
    aspellDicts.en
    perl
    bind
    docker
    docker-compose
    tree-sitter
    fd
    binutils_nogold
    file
    fzf
    git
    gnum4
    gnumake
    gnupg
    htop
    lsof
    man-pages
    ncdu
    psmisc
    python310Packages.pip
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
    tldr
    whois
    sysstat
    lm_sensors
    xclip
    pkg-config
    openssl
    libnotify
    libtool
    nix-index
    zoxide
    freetype
    luarocks
    sqlite
    cmake # cmake
    alacritty
    lazygit
    lazydocker
  ];

  # system shell
  environment.shells = with pkgs; [ fish ];

  # fonts settings
  fonts = {
    fonts = with pkgs;
      [ (nerdfonts.override { fonts = [ "JetBrainsMono" ]; }) ];
  };
}
