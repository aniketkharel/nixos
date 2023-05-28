{ inputs, outputs, lib, config, pkgs, ... }:
let
in
{
  imports = [
    # If you want to use modules your own flake exports (from modules/home-manager):
    # outputs.homeManagerModules

    # Or modules exported from other flakes (such as nix-colors):
    # inputs.nix-colors.homeManagerModules.default

    # You can also split up your configuration and import pieces of it here:
    ../modules/home-manager
  ];

  nixpkgs = {
    overlays = [
      outputs.overlays.additions
      outputs.overlays.modifications
      outputs.overlays.unstable-packages
      inputs.neovim-nightly-overlay.overlay
    ];
    config = {
      allowUnfree = true;
      allowUnfreePredicate = (_: true);
    };
  };

  # fonts settings
  fonts = { fontconfig = { enable = true; }; };

  home = {
    username = "aniketdev";
    homeDirectory = "/home/aniketdev";
    sessionVariables = {
      SHELL = "zsh";
      EDITOR = "nvim";
      PKG_CONFIG_PATH = "${pkgs.openssl.dev}/lib/pkgconfig";
      LD_LIBRARY_PATH = "${pkgs.zlib}/lib:$LD_LIBRARY_PATH";
    };
  };

  home.packages = with pkgs; [
    firefox
    flameshot
    alacritty
    lxappearance
    exa
    bat
    gcc
    nodejs
    picom
    rofi
    autotiling
    lazygit
    lazydocker
    rust-analyzer
    rustup
    rnix-lsp
    nixfmt
    sumneko-lua-language-server
    wasm-pack
    cargo-generate
    haskellPackages.greenclip
    emote
    marksman
    gnumake
    sqlitebrowser
    brightnessctl
    anydesk
    python310Packages.pip
  ];

  # enable programs
  programs = {
    git = {
      enable = true;
      userName = "aniketkhareldev";
      userEmail = "aniketkhareldev@gmail.com";
    };
  };

  # xdf neovim configs
  xdg.configFile = {
    nvim = { source = ../configs/nvim; };
    alacritty = { source = ../configs/alacritty; };
    i3 = { source = ../configs/i3; };
    rofi = { source = ../configs/rofi; };
    git = { source = ../configs/git; };
    tmux = { source = ../configs/tmux; };
    picom = { source = ../configs/picom; };
  };

  programs.home-manager.enable = true;

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "22.11";
}