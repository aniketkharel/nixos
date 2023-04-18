# NixOS Configrations Guides

## Partitioning

```sh
# Should be 2.4+
nix --version
export NIX_CONFIG="experimental-features = nix-command flakes"
```

## Generate Configrations

```sh
nixos-generate-config --root /mnt
```

# Setup

```sh
sudo nixos-rebuild switch --flake .#hostname

# or

nixos-install --flake .#hostname

```

```sh
parted /dev/sda -- mklabel msdos (gpt for uefi)

parted /dev/sda -- mkpart primary 1MiB -8GiB (512MiB -8GiB for uefi)


mkfs.ext4 -L nixos /dev/sda1
```

## Packages, services, settings, etc.

### NixEnv

To install and run applications.

```sh
nix-env -iA nixos.htop
```

To list all the installed envs.

```sh
nix-env
```

```sh
nix-env -uninstall htop
```

_man configrations.nix_ for more docs.

## Reference

[Matthias Benaets](https://www.youtube.com/watch?v=AGVXJ-TIv3Y&t=1164s)