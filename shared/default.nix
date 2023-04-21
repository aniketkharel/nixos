
{config, lib, pkgs, ... }:
{
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
      fzf
      git
      zsh
      gnum4
      gnupg
      htop
      imagemagick
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
    ];
    environment.shells = with pkgs; [zsh];
}
