# This file defines overlays
{ inputs, ... }:
{
  additions = final: _prev: import ../pkgs { pkgs = final; };

# https://nixos.wiki/wiki/Overlays
  modifications = final: prev: {
# example = prev.example.overrideAttrs (oldAttrs: rec {
# ...
# });
  };

  unstable-packages = final: _prev: {
    unstable = import inputs.nixpkgs-unstable {
      system = final.system;
      config.allowUnfree = true;
    };
  };
}
