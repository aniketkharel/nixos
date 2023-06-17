{ config, lib, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    cmake # cmake
    rofi # rofi menu
    alacritty # terminal
    xdotool

    # node js and its packages
    nodejs
    nodePackages.yarn
    nodePackages.pnpm
    nodePackages.vscode-langservers-extracted
    nodePackages.typescript-language-server
  ];
}
