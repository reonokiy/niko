{
  description = "niko: nixos config";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland.url = "github:hyprwm/Hyprland";
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };
    flake-parts.url = "github:hercules-ci/flake-parts";
    devenv.url = "github:cachix/devenv";
    nix-vscode-extensions = {
      url = "github:nix-community/nix-vscode-extensions";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    op-shell-plugins = {
      url = "github:reonokiy/shell-plugins";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    sincrets = {
      url = "git+ssh://git@github.com/reonokiy/sincrets.git?ref=main";
      flake = false;
    };
    machine-secrets = {
      url = "git+ssh://git@github.com/reonokiy/machine-secrets.git?ref=main";
      flake = false;
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      nixpkgs-unstable,
      home-manager,
      flake-parts,
      nix-vscode-extensions,
      sops-nix,
      ...
    }@inputs:
    flake-parts.lib.mkFlake { inherit inputs; } {
      imports = [
        inputs.devenv.flakeModule
      ];

      systems = nixpkgs.lib.systems.flakeExposed;
      perSystem = {
        devenv.shells.default = {
          imports = [ ./devenv.nix ];
        };
      };

      flake = {
        nixpkgs.overlays = [ nix-vscode-extensions.overlays.default ];
        nixosConfigurations.niko = nixpkgs.lib.nixosSystem rec {
          system = "x86_64-linux";
          specialArgs = {
            inherit inputs;

            pkgs-unstable = import nixpkgs-unstable {
              inherit system;
              overlays = [ nix-vscode-extensions.overlays.default ];
              config.allowUnfree = true;
            };
          };
          modules = [
            home-manager.nixosModules.home-manager
            sops-nix.nixosModules.sops
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.niko = import ./home/default.nix;
              home-manager.extraSpecialArgs = specialArgs;
              home-manager.backupFileExtension = "backup";
            }
            ./nixos/default.nix
          ];
        };
      };
    };
}
