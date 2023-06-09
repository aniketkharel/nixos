{ inputs, outputs, lib, config, pkgs, ... }:
let
in {
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
    ];
    config = {
      allowUnfree = true;
      allowUnfreePredicate = (_: true);
    };
  };

  # fonts settings
  fonts = { fontconfig = { enable = true; }; };

  home = {
    # Home Manager is pretty good at managing dotfiles. The primary way to manage
    # file = {
    #   ".config/hypr/hyprland.conf".source = .config/hypr/hyprland.conf;
    #   ".config/hypr/waybar".source = .config/hypr/waybar;
    #   ".config/hypr/wofi".source = .config/hypr/wofi;
    # };
    username = "aniketdev";
    homeDirectory = "/home/aniketdev";
    sessionVariables = {
      EDITOR = "nvim";
      PKG_CONFIG_PATH = "${pkgs.fontconfig.dev}/lib/pkgconfig:${pkgs.freetype.dev}/lib/pkgconfig";
      LD_LIBRARY_PATH = "${pkgs.zlib}/lib:$LD_LIBRARY_PATH";
    };
  };

  home.packages = with pkgs; [
    rust-analyzer
    rustup
    rnix-lsp
    nixfmt
    wasm-pack
    cargo-generate
    haskellPackages.greenclip
    stylua
    sumneko-lua-language-server
    marksman
    brightnessctl
    python310Packages.pynvim
    nodePackages.neovim
    deno
    gimp
    inkscape-with-extensions
    discord
    thefuck
    # funs
    terminal-typeracer
    # acp
    acpi
    fd
    fzf
  ];

  # enable programs
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  programs.home-manager.enable = true;

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "22.11";
}
