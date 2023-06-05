{ config, lib, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # database lifting
    dbeaver

    # cmake
    cmake

    # node js and its packages
    nodejs
    nodePackages.yarn
    nodePackages.pnpm
    nodePackages.vscode-langservers-extracted
    nodePackages.typescript-language-server
  ];
}
