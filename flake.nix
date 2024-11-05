
{
  description = "Rust dev environment for transaction manager";

  inputs = {
    nixpkgs.url      = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url  = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system;
        };
      in
      {
        devShells.default = with pkgs; mkShell {
          buildInputs = [
            zig
            zls
            zsh 
            neovim
            tmux
          ];
          

          # Use zsh so it works with my neovim shell prompt
          shellHook = ''
            export SHELL=$(which zsh)
            exec $SHELL
          '';
        };
      }
    );
}
