{
  description = "Description of Folder Manager";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs =
    {
      self,
      nixpkgs,
      flake-utils,
    }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = import nixpkgs {
          inherit system;
        };
      in
      {
        devShells.default = pkgs.mkShell {
          packages = with pkgs; [
            fish-lsp
            nil
            nixd
            git
            lazygit
          ];

          shellHook = ''
            echo "🚀 Environnement React/Bun chargé"
          '';
        };
      }
    );

}
