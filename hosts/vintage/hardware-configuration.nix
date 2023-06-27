{ config, lib, pkgs, modulesPath, ... }:

{
  imports = [ ];

  # kernel modules
  boot.initrd.availableKernelModules =
    [ "xhci_pci" "ahci" "usbhid" "nvme" "uas" "usb_storage" "sd_mod" ];
  boot.blacklistedKernelModules = [ ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.supportedFilesystems = [ "ntfs" ];

  # file systems
  fileSystems."/" = {
    device = "/dev/disk/by-label/nixos";
    fsType = "ext4";
  };

  fileSystems."/boot/efi" = {
    device = "/dev/disk/by-label/BOOT";
    fsType = "vfat";
  };

  swapDevices = [{ device = "/dev/disk/by-label/swap"; }];

  networking.useDHCP = lib.mkDefault true;
  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  powerManagement.cpuFreqGovernor = lib.mkDefault "powersave";
  hardware.cpu.intel.updateMicrocode =
    lib.mkDefault config.hardware.enableRedistributableFirmware;
}
