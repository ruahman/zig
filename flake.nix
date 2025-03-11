
{
  description = "Zig dev environment";

  inputs = {
    nixpkgs.url      = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url  = "github:numtide/flake-utils";
    zig-overlay.url  = "github:mitchellh/zig-overlay"; 
  };

  outputs = { self, nixpkgs, flake-utils,  zig-overlay, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system;
          overlays = [ zig-overlay.overlays.default ];
        };
      in
      {
        devShells.default = with pkgs; mkShell {
          buildInputs = [
            zigpkgs."0.14.0"
            zls
            just
            bashInteractive
            bash-completion
          ];
          

          shell = pkgs.bashInteractive;
          shellHook = ''
            echo "Welcome to zig  ."
          '';
        };
      }
    );
}
