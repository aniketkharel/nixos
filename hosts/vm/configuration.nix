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
  };

  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio.enable = true;

  networking.hostName = "aniketdev";
  # Pick only one of the below networking options.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  networking.networkmanager.enable =
    true; # Easiest to use and most distros use this by default.

  # Set your time zone.
  time.timeZone = "Asia/Kathmandu";

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  boot.loader.grub.enable = true;
  boot.loader.grub.version = 2;
  boot.loader.grub.device = "/dev/sda";

  users.users = {
    aniketdev = {
      initialPassword = "tt";
      isNormalUser = true;
      shell = pkgs.fish;
      openssh.authorizedKeys.keys = [ ];
      extraGroups = [ "wheel" "networkmanager" "docker" "audio" ];
    };
  };

  services.logind.extraConfig = "RuntimeDirectorySize=1G";

  services = {
    printing = { enable = true; };
    openssh = {
      enable = true;
      permitRootLogin = "no";
      passwordAuthentication = false;
    };
    xserver = {
      enable = true;
      layout = "us";
      libinput = { enable = true; };
      displayManager = {
        lightdm = { enable = true; };
        defaultSession = "none+i3";
        sessionCommands = "";
      };
      desktopManager = { xfce = { enable = true; }; };
      windowManager = {
        i3 = {
          enable = true;
          package = pkgs.i3-gaps;
          extraPackages = with pkgs; [ i3status i3lock i3blocks ];
        };
      };
    };
    gnome = { gnome-keyring = { enable = true; }; };
  };

  # enable programs
  programs = {
    seahorse = { enable = true; };
    command-not-found = { enable = false; };
  };

  # polkit
  security = {
    polkit = { enable = true; };
    pam = { services = { }; };
  };

  #docker
  virtualisation = { docker = { enable = true; }; };

  # Open ports in the firewall.
  networking.firewall.allowedTCPPorts = [ 22 ];

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "22.11";
}
