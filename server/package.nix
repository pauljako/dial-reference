{
  stdenv,
  pkgs,
  ...
}:
stdenv.mkDerivation {
  pname = "dialserver";
  version = "2.2.1";

  src = pkgs.lib.cleanSource ./.;

  installPhase = ''
    mkdir -p $out/{lib,bin}
    cp dialserver $out/bin/dialserver
    cp libnfCallbacks.so $out/lib/libnfCallbacks.so
  '';

  patchPhase = ''
    substituteInPlace main.c \
    --replace-fail '/usr/bin/curl' '${pkgs.curl}/bin/curl'
  '';
}
