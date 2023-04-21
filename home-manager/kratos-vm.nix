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

# neovim-nightly-overlay.overlays.default

# Or define it inline, for example:
# (final: prev: {
#   hi = final.hello.overrideAttrs (oldAttrs: {
#     patches = [ ./change-hello-to-hi.patch ];
#   });
# })
    ];
    config = {
      allowUnfree = true;
      allowUnfreePredicate = (_: true);
    };
  };

  # fonts settings
  fonts = {
    fontconfig = {
      enable = true;
    };
  };

  home = {
    username = "kratos-vm";
    homeDirectory = "/home/kratos-vm";
    sessionVariables = {
      SHELL = "zsh";
      EDITOR = "nvim";
    };
  };

  home.packages = with pkgs; [ firefox flameshot alacritty exa bat tree-sitter gcc nodejs picom i3blocks rofi autotiling lazygit lazydocker rust-analyzer rustup rnix-lsp];

  programs = {
    git = {
      enable = true;
      userName = "aniketkhareldev";
      userEmail = "aniketkhareldev@gmail.com";
    };
  };

# xdf neovim configs
  xdg.configFile = {
    nvim = {
      source = ../configs/nvim;
    };
    alacritty = {
      source = ../configs/alacritty;
    };
    i3 = {
      source = ../configs/i3;
    };
    rofi = {
      source = ../configs/rofi;
    };
    git = {
      source = ../configs/git;
    };
    tmux = {
      source = ../configs/tmux;
    };
  };

  programs.home-manager.enable = true;

# Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

# https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "22.11";
}
