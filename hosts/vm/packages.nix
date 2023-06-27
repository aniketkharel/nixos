{ config, lib, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    nodejs
    nodePackages.yarn
    nodePackages.pnpm
    nodePackages.vscode-langservers-extracted
    nodePackages.typescript-language-server
  ];
}
