{ config, lib, pkgs, modulesPath, ... }:

{
  imports = [ ];

  # kernel modules
  boot.initrd.availableKernelModules = [ "xhci_pci" "ahci" "usbhid" "nvme" "uas" "usb_storage" "sd_mod" ];
  boot.blacklistedKernelModules = [ ];
  boot.initrd.kernelModules = [ "amdgpu" ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.supportedFilesystems = [ "ntfs" ];

  # file systems
  fileSystems."/" =
  { device = "/dev/disk/by-uuid/a0f5c104-8468-47e9-b553-384091a78650";
	  fsType = "ext4";
  };

  fileSystems."/boot/efi" =
  { device = "/dev/disk/by-uuid/0435-370B";
	  fsType = "vfat";
  };

  swapDevices = [ 
  	{ device = "/dev/disk/by-uuid/96a6cbb8-f00e-4144-a4cf-22f9195ad288"; }
  ];

  networking.useDHCP = lib.mkDefault true;
  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  powerManagement.cpuFreqGovernor = lib.mkDefault "powersave";
  hardware.cpu.intel.updateMicrocode =
    lib.mkDefault config.hardware.enableRedistributableFirmware;
}
