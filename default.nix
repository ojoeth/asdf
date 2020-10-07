{ pkgs ? import <nixpkgs> {}}:
with pkgs;

stdenv.mkDerivation {
  name = "asdf";
  src = ./.;
  buildInputs = [ python3 ];
  postPatch = ''
    sed -i '1 i\#!${python3}/bin/python' feature.py
  '';
  installPhase = ''
    mkdir -p $out/bin
    cp feature.py $out/bin/asdf
    chmod +x $out/bin/asdf
  '';
}
  
