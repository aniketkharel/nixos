{ config, lib, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
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
    zsh
    gnum4
    gnupg
    htop
    imagemagick
    scrot
    lsof
    man-pages
    ncdu
    psmisc
    python3
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
    whois
    sysstat
    xclip
    pkg-config
    openssl
    zoxide
    marksman
  ];

  # system shell
  environment.shells = with pkgs; [ zsh ];

  # fonts settings
  fonts = {
    fonts = with pkgs; [ (nerdfonts.override { fonts = [ "FiraCode" ]; }) ];
  };
}
