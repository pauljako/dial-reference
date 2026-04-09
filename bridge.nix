{ pkgs, ... }:
let
  pythonEnv = pkgs.python3.withPackages (
    ps: with ps; [
      flask
      flask-cors
    ]
  );
in
pkgs.stdenv.mkDerivation {
  name = "dial-bridge";

  dontUnpack = true;

  installPhase = ''
    mkdir -p $out/bin

    cp ${./bridge.py} $out/bin/dial-bridge

    substituteInPlace $out/bin/dial-bridge \
      --replace-fail "/usr/bin/env python3" "${pythonEnv}/bin/python3"

    chmod +x $out/bin/dial-bridge
  '';
}
