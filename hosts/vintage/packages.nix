{ inputs, config, lib, pkgs, ... }:
let
in {
  environment.systemPackages = with pkgs; [
    # compositor
    picom

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

    # for qtile?
    python310Packages.dbus-python
    python310Packages.xlib
    psutils
    python310Packages.psutil
    python310Packages.xcffib
    python310Packages.cairocffi
    python310Packages.pip
    python310Packages.autopep8
  ];
}
