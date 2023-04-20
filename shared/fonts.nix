{ lib, fetchzip }:

let
  version = "2.3.3";
in

fetchzip rec {
  name = "CascadiaCode";

  url = "https://github.com/ryanoasis/nerd-fonts/releases/download/v${version}/${name}.zip";

  postFetch = ''
    mkdir -p $out/share/{doc,fonts}
    unzip -j $downloadedFile \*.otf    -d $out/share/fonts/opentype
    unzip -j $downloadedFile README.md -d $out/share/doc/${name}
  '';

  # sha256 = "sha256-XwUqM1BC80J74P0qk6EOnNiqkX61cgnXBq8S8slGpps=";

  meta = with lib; {
    homepage = "https://github.com/ryanoasis/nerd-fonts";
    description = "A font family with a great monospaced variant for programmers, version without ligatures";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
