{ config, lib, pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    zsh
    harfbuzz
    xdg-desktop-portal-gtk
    xorg.libX11
    xorg.libX11.dev
    xorg.libxcb
    xorg.libXft
    xorg.libXinerama
    xorg.xinit
    xorg.xinput
    xorg.libfontenc
    webkitgtk
    fontconfig
    freetype
    firefox
    flameshot
    pass
    freshfetch
    simplescreenrecorder
    lxappearance
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
    neovim-nightly
    emacs
    tree-sitter
    fd
    binutils_nogold
    feh
    file
    fzf
    git
    gnum4
    gparted
    gnumake
    gnupg
    htop
    imagemagick
    scrot
    lsof
    man-pages
    ncdu
    psmisc
    python311
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
    xorg.xmodmap
    tldr
    whois
    sysstat
    lm_sensors
    qpdfview
    xclip
    pkg-config
    openssl
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
    ffmpeg-full # has ffplay
    glxinfo # opengl version I have
    pavucontrol # Gui for controlling audio
    pulseaudio
    xfce.thunar
    appimage-run
    freetype
    luarocks
    rofi
    rofi-emoji
    sqlite
    sqlitebrowser
    cmake # cmake
    xfce.xfce4-terminal
    kitty
    xdotool
    autotiling
    lazygit
    lazydocker
    anydesk
  ];

  # system shell
  environment.shells = with pkgs; [ bash ];

  # fonts settings
  fonts = {
    fonts = with pkgs; [ (nerdfonts.override { fonts = [ "UbuntuMono" ]; }) ];
  };
}
