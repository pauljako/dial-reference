{
  description = "A reference Implementation of DIAL (Discovery and Launch)";

  inputs.nixpkgs.url = "nixpkgs/nixos-25.11";

  outputs = {
    self,
    nixpkgs,
  }: {
    packages."x86_64-linux".server = (import nixpkgs {system = "x86_64-linux";}).callPackage ./server/package.nix {};
    packages."x86_64-linux".client = (import nixpkgs {system = "x86_64-linux";}).callPackage ./client/package.nix {};
  };
}
