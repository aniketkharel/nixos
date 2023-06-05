{ config, lib, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    #cmake
    cmake

    # node js packages
    nodePackages.yarn
    nodePackages.pnpm
    nodePackages.vscode-langservers-extracted
    nodePackages.typescript-language-server
  ];
}
