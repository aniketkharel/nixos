{ inputs, outputs, lib, config, pkgs, ... }:
let
in {
  imports = [
    # If you want to use modules your own flake exports (from modules/nixos):
    # outputs.nixosModules.example

    # Or modules from other flakes (such as nixos-hardware):
    # inputs.hardware.nixosModules.common-cpu-amd
    # inputs.hardware.nixosModules.common-ssd

    # You can also split up your configuration and import pieces of it here:
    # ./users.nix

    # Import your generated (nixos-generate-config) hardware configuration
    ./hardware-configuration.nix
    ../../shared
    ./packages.nix
  ];

  nixpkgs = {
    overlays = [
      outputs.overlays.additions
      outputs.overlays.modifications
      outputs.overlays.unstable-packages
      inputs.neovim-nightly-overlay.overlay
    ];
    config = { allowUnfree = true; };
  };

  nix = {
    # This will add each flake input as a registry
    # To make nix3 commands consistent with your flake
    registry = lib.mapAttrs (_: value: { flake = value; }) inputs;

    # This will additionally add your inputs to the system's legacy channels
    # Making legacy nix commands consistent as well, awesome!
    nixPath = lib.mapAttrsToList (key: value: "${key}=${value.to.path}")
      config.nix.registry;

    settings = {
      # Enable flakes and new 'nix' command
      experimental-features = "nix-command flakes";
      # Deduplicate and optimize nix store
      auto-optimise-store = true;
    };

    # For nix-direnv
    extraOptions = ''
      keep-outputs = true
      keep-derivations = true
    '';
  };

  # laptop specific packages
  environment.systemPackages = with pkgs; [ ];

  # Enable sound.
  sound.enable = true;

  networking.hostName = "aniketdev";
  # Pick only one of the below networking options.
  #networking.wireless.enable = true; # Enables wireless support via wpa_supplicant.
  networking.networkmanager.enable =
    true; # Easiest to use and most distros use this by default.

  # Set your time zone.
  time.timeZone = "Asia/Kathmandu";

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  # Boot loader
  boot.loader = {
    systemd-boot.enable = true;
    efi = {
      canTouchEfiVariables = true;
    };
  };

  users.users = {
    aniketdev = {
      shell = pkgs.fish;
      initialPassword = "tt";
      isNormalUser = true;
      openssh.authorizedKeys.keys = [ ];
      extraGroups = [ "wheel" "networkmanager" "docker" "audio" "video" ];
    };
  };

  services.logind.extraConfig = "RuntimeDirectorySize=2G";

  services = {
    printing = { enable = true; };
    blueman = { enable = true; };
    openssh = {
      enable = true;
      permitRootLogin = "no";
      passwordAuthentication = false;
    };
    xserver = {
      enable = true;
      layout = "us";
      libinput = {
        enable = true;
        mouse.accelProfile = "flat";
      };
      displayManager = {
        lightdm = { enable = true; };
        defaultSession = "none+i3";
        sessionCommands = "";
      };
      desktopManager = { xfce.enable = true; };
      windowManager = {
        i3 = {
          enable = true;
          package = pkgs.i3-gaps;
          extraPackages = with pkgs; [ i3status i3lock i3blocks ];
        };
        awesome = {
          enable = true;
          luaModules = with pkgs.luaPackages; [
            luarocks # is the package manager for Lua modules
            luadbi-mysql # Database abstraction layer
          ];
        };
      };
    };
    gnome = { gnome-keyring = { enable = true; }; };
  };

  # hardware
  hardware = {
    opengl.enable = true;
    pulseaudio.enable = true;
    firmware = [ ];
    bluetooth.enable = true;
  };

  # enable programs
  programs = {
    mtr = { enable = true; };
    seahorse = { enable = true; };
    command-not-found = { enable = false; };
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
  };

  # polkit
  security = { polkit = { enable = true; }; };

  #docker
  virtualisation = { docker = { enable = true; }; };

  # Open ports in the firewall.
  networking.firewall.allowedTCPPorts = [ 22 ];

  # system.copySystemConfiguration = true;
  system.autoUpgrade.enable = true;
  system.autoUpgrade.allowReboot = true;
  system.autoUpgrade.channel = "https://channels.nixos.org/nixos-23.05";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "22.11";
}
