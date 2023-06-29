{ inputs, config, lib, pkgs, ... }:
let
in {
  environment.systemPackages = with pkgs; [
    # xorg stuff
    xdg-desktop-portal-gtk
    xorg.xorgserver
    xorg.libX11
    xorg.libX11.dev
    xorg.libxcb
    xorg.libXft
    xorg.libXinerama
    xorg.xinit
    xorg.xinput
    xorg.libfontenc
    xorg.xmodmap
    xdotool

    # web
    firefox

    #pdf
    qpdfview

    #infos
    hwinfo

    pipes-rs
    
    # screens
    flameshot
    simplescreenrecorder
    lxappearance
    imagemagick
    scrot

    #editor
    neovim-nightly

    # auth
    pass
    polkit

    #notification
    dunst

    #vol
    volumeicon

    # music
    ffmpeg-full
    pavucontrol # Gui for controlling audio
    pulseaudio

    #fm
    xfce.thunar

    #appimage
    appimage-run

    #menus
    rofi
    rofi-emoji
    dmenu
    
    #browser
    sqlitebrowser

    # compositor
    picom
    glxinfo # opengl version I have

    # wallpapers
    feh

    # disks
    gparted

    # latex
    tetex

    # node js and its packages
    nodejs
    nodePackages.yarn
    nodePackages.pnpm
    nodePackages.vscode-langservers-extracted
    nodePackages.typescript-language-server

    # torrent
    qbittorrent

    # pythons ?
    python310Packages.dbus-python
    python310Packages.xlib
    psutils
    python310Packages.psutil
    python310Packages.xcffib
    python310Packages.cairocffi
    python310Packages.pip
    python310Packages.autopep8
    autotiling

    #anydesks
    anydesk
  ];
}
