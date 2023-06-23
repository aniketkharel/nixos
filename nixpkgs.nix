let
  # stable-lock
  stable-lock =
    (builtins.fromJSON (builtins.readFile ./flake.lock)).nodes.nixpkgs.locked;
in import (fetchTarball {
  url = "https://github.com/nixos/nixpkgs/archive/${stable-lock.rev}.tar.gz";
  sha256 = stable-lock.narHash;
})
