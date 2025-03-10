
{
  description = "Rust dev environment for transaction manager";

  inputs = {
    nixpkgs.url      = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url  = "github:numtide/flake-utils";
    zig-overlay.url  = "github:mitchellh/zig-overlay";  # Add Zig overlay
  };

  outputs = { self, nixpkgs, flake-utils,  zig-overlay, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        # pkgs = import nixpkgs {
        #   inherit system;
        # };
        pkgs = import nixpkgs {
          inherit system;
          overlays = [ zig-overlay.overlays.default ];
        };
      in
      {
        devShells.default = with pkgs; mkShell {
          buildInputs = [
            zigpkgs."0.14.0"
            # zig
            zls
          ];
          

          shellHook = ''
            echo "Welcome to zig  "
          '';
        };
      }
    );
}
