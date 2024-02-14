{
  description = "VSCode Dev Container dotfiles.";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.05";
    home-manager.url = "github:nix-community/home-manager/release-23.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    ...
  } @ inputs: let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system}.pkgs;
    vars = builtins.fromTOML (builtins.readFile ./flake-vars.toml);
  in {
    defaultPackage.x86_64-linux = home-manager.defaultPackage.${system};

    homeConfigurations = {
      "vscode" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        # Home directory and username are taken from environment in case these
        # dotfiles are used in differently setup containers.
        modules = [
          ./home.nix
          {
            home = {
              homeDirectory = vars.home;
              username = vars.user;
              stateVersion = "23.05";
            };
          }
        ];
      };
    };
    formatter.x86_64-linux = pkgs.alejandra;
  };
}
