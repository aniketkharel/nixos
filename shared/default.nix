
{config, lib, pkgs, ... }:
{
    # System-wide packages
    environment.systemPackages = with pkgs; [
      aspell
      aspellDicts.en
      bind
      docker
      docker-compose
      neovim
      fd
      feh
      file
      fortune
      fzf
      git
      zsh
      gnum4
      gnupg
      gnupg1compat
      htop
      imagemagick
      lsof
      lynx
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
    ];
}
