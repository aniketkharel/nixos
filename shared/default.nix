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
    dunst
    polkit
    nix-index
    zoxide
    volumeicon
    # need to seperate this TODO, wayland
    discord # Discord
    wofi # like rofi - app runner for wayland
    wl-clipboard # wl-copy, wl-paste, required for clipboard to work in neovim
    ffmpeg-full # has ffplay
    pavucontrol # Gui for controlling audio
    waybar # Wayland bar
    swaylock # Wayland lock
    glxinfo # opengl version I have
    grim # backend
  ];

  # system shell
  environment.shells = with pkgs; [ fish ];

  # fonts settings
  fonts = {
    fonts = with pkgs;
      [ (nerdfonts.override { fonts = [ "JetBrainsMono" ]; }) ];
  };
}
