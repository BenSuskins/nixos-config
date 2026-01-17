{
  description = "Configuration for MacOS";

  inputs = {
    nixpkgs.url = "git+ssh://git@github.com/nixos/nixpkgs?ref=nixos-unstable";
    home-manager = {
      url = "git+ssh://git@github.com/nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    mac-app-util.url = "git+ssh://git@github.com/hraban/mac-app-util";
    darwin = {
      url = "git+ssh://git@github.com/nix-darwin/nix-darwin?ref=master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-homebrew = {
      url = "git+ssh://git@github.com/zhaofengli/nix-homebrew";
    };
    homebrew-bundle = {
      url = "git+ssh://git@github.com/homebrew/homebrew-bundle";
      flake = false;
    };
    homebrew-core = {
      url = "git+ssh://git@github.com/homebrew/homebrew-core";
      flake = false;
    };
    homebrew-cask = {
      url = "git+ssh://git@github.com/homebrew/homebrew-cask";
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
      mac-app-util,
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
          username = "tbd";
          email = "tbd";
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
            (
              {
                pkgs,
                config,
                inputs,
                ...
              }:
              {
                home-manager.sharedModules = [
                  mac-app-util.homeManagerModules.default
                ];
              }
            )
            nix-homebrew.darwinModules.nix-homebrew
            mac-app-util.darwinModules.default
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
      darwinConfigurations = nixpkgs.lib.genAttrs hosts (host: mkDarwinConfig host);
    };
}
