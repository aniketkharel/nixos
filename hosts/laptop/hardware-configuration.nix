{ config, lib, pkgs, modulesPath, ... }:

{
  imports = [ ];

  # kernel modules
  boot.initrd.availableKernelModules = [ "ata_piix" "ohci_pci" "ehci_pci" "ahci" "sd_mod" "sr_mod" ];
  boot.initrd.kernelModules = [ "amdgpu" ];
  boot.kernelModules = [ "iwlwifi" "iwlmvm " ];
  boot.extraModulePackages = [ ];

  # file systems
  fileSystems."/boot" = {
    device = "/dev/disk/by-label/BOOT";
    fsType = "fat32";
  };

  fileSystems."/" = {
    device = "/dev/disk/by-label/nixos";
    fsType = "ext4";
  };

  swapDevices = [ ];

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";

  hardware.cpu.intel.updateMicrocode =
    lib.mkDefault config.hardware.enableRedistributableFirmware;
}
