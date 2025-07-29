{
  description = "Voxi0's nixCats config";

  # Flake inputs/depedencies
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    nvf.url = "github:notashelf/nvf";
  };

  # Flake outputs/actions - After fetching all depedencies
  outputs = inputs: let
    system = "x86_64-linux";
    pkgs = inputs.nixpkgs.legacyPackages.${system};
  in {
    formatter.${system} = pkgs.alejandra;
    packages.${system}.default =
      (inputs.nvf.lib.neovimConfiguration {
        inherit pkgs;
        modules = [./config.nix];
      }).neovim;
  };
}
