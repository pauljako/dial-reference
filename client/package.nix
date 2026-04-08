{
  stdenv,
  pkgs,
  ...
}:
stdenv.mkDerivation {
  pname = "dialclient";
  version = "2.2.1";

  src = pkgs.lib.cleanSource ./.;

  buildInputs = with pkgs; [ curl ];

  installPhase = ''
    mkdir -p $out/bin
    cp dialclient $out/bin/dialclient
  '';
}
