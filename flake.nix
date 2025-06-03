{
  description = "Configuration for MacOS";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    darwin = {
      url = "github:LnL7/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-homebrew = {
      url = "github:zhaofengli-wip/nix-homebrew";
    };
    homebrew-bundle = {
      url = "github:homebrew/homebrew-bundle";
      flake = false;
    };
    homebrew-core = {
      url = "github:homebrew/homebrew-core";
      flake = false;
    };
    homebrew-cask = {
      url = "github:homebrew/homebrew-cask";
      flake = false;
    };
  };

  outputs =
    {
      self,
      darwin,
      nix-homebrew,
      homebrew-bundle,
      homebrew-core,
      homebrew-cask,
      home-manager,
      nixpkgs,
    }:
    let
      userInfo = {
        personal = {
          name = "Ben Suskins";
          username = "bensuskins";
          email = "suskinsdevelopment@gmail.com";
        };
        work = {
          name = "Ben Suskins";
          username = "bsuskins";
          email = "bsuskins@ford.com";
        };
      };
      system = "aarch64-darwin";
      hosts = [
        "personal"
        "work"
      ];
      mkDarwinConfig =
        host:
        darwin.lib.darwinSystem {
          inherit system;
          specialArgs = {
            inherit self;
            userInfo = userInfo.${host};
            hostRole = host;
          };
          modules = [
            home-manager.darwinModules.home-manager
            nix-homebrew.darwinModules.nix-homebrew
            {
              nix-homebrew = {
                user = userInfo.${host}.username;
                enable = true;
                taps = {
                  "homebrew/homebrew-core" = homebrew-core;
                  "homebrew/homebrew-cask" = homebrew-cask;
                  "homebrew/homebrew-bundle" = homebrew-bundle;
                };
                mutableTaps = false;
                autoMigrate = true;
              };
            }
            ./hosts/${host}
          ];
        };
    in
    {
      devShells.${system}.default =
        with nixpkgs.legacyPackages.${system};
        mkShell {
          nativeBuildInputs = [
            bashInteractive
            git
          ];
          shellHook = ''
            export EDITOR="code -w"
          '';
        };

      darwinConfigurations = nixpkgs.lib.genAttrs hosts (host: mkDarwinConfig host);
    };
}
