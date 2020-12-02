{
  description = "ALLVM Tools";

  inputs.nixpkgs = {
    flake = false;
    url = "github:NixOS/nixpkgs/f55ec6fd6952d9f6ecb1a00d9d8ffca92e523a9f";
  };

  outputs = { self, nixpkgs }:
    let
      lib = import "${nixpkgs}/lib";

      systems = [ "x86_64-linux" ];

      forAllSystems = f: lib.genAttrs systems (system: f system);

      releaseFor = forAllSystems (localSystem:
        import ./nix/release.nix { inherit localSystem nixpkgs; });

    in {

      packages = forAllSystems (system: {
        allvm-tools = releaseFor.${system}.musl.allvm-tools-clang4;
      });

      defaultPackage =
        forAllSystems (system: self.packages.${system}.allvm-tools);

    };
}
