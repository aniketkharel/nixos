{ config, lib, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    wofi # like rofi - app runner for wayland
    wl-clipboard # wl-copy, wl-paste, required for clipboard to work in neovim
    ffmpeg-full # has ffplay
    pavucontrol # Gui for controlling audio
    waybar # Wayland bar
    swaylock # Wayland lock
    glxinfo # opengl version I have
    grim # backend
  ];
}
