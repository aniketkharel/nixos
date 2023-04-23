let lock = (builtins.fromJSON (builtins.readFile ./flake.lock)).nodes.nixpkgs.locked;
in
import (fetchTarball {
    url = "https://github.com/nixos/nixpkgs/archive/${lock.rev}.tar.gz";
    sha256 = lock.narHash;
    })
(import (builtins.fetchTarball {
         url = https://github.com/nix-community/neovim-nightly-overlay/archive/master.tar.gz;
    sha256 = lock.narHash;
         }))
