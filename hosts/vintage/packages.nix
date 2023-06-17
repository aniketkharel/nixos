{ config, lib, pkgs, ... }:

{
  environment.systemPackages = with pkgs;
    [
      cmake # cmake
      rofi  # rofi menu
      alacritty # terminal
      xdotool
    ];
}
