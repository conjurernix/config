{
  description = "Macos Personal config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, nix-darwin, home-manager, nixpkgs }:
    let
      configuration = { pkgs, ... }: {
        # List packages installed in system profile. To search by name, run:
        # $ nix-env -qaP | grep wget
        environment.systemPackages =
          [ pkgs.vim
          ];

        # Auto upgrade nix package and the daemon service.
        services.nix-daemon.enable = true;
        # nix.package = pkgs.nix;

        # Necessary for using flakes on this system.
        nix.settings.experimental-features = "nix-command flakes";

        # Create /etc/zshrc that loads the nix-darwin environment.
        programs.zsh.enable = true;  # default shell on catalina
        # programs.fish.enable = true;

        # Set Git commit hash for darwin-version.
        system.configurationRevision = self.rev or self.dirtyRev or null;

        # Used for backwards compatibility, please read the changelog before changing.
        # $ darwin-rebuild changelog
        system.stateVersion = 4;

        # The platform the configuration will be used on.
        nixpkgs.hostPlatform = "aarch64-darwin";

        users.users.nikolaspafitis = {
          name = "nikolaspafitis";
          home = "/Users/nikolaspafitis";
        };

        home-manager.users.nikolaspafitis = { pkgs, ...}: {
          home.packages = with pkgs; [
            # Command Tools
            coreutils
            wget
            curl
            git
            jq
            nodejs
            fzf
            readline
            btop
            bat
            eza
            tree
            cloc
            fontconfig
            fd
            gnugrep
	    yazi
            ## ZSH packages
            zsh
            oh-my-zsh
            #### neovim packages
            neovim
            lunarvim
            ####
            emacs
            #### Fonts
            fira
            ######
            lazygit
            pandoc
            neofetch
            ipfetch
            ripgrep
            tldr
            ranger
            tailwindcss
            vpsfree-client
            # Window Manager and Desktop
            skhd
            sketchybar
            ######
            kitty
            ###
            cocoapods
            # C
            ninja
            meson
            mpi
            cmake
            zeromq
	    # Go
	    go
            # JDK and JVM based
            jdk21
            clojure
            clojure-lsp
            polylith
            babashka
            bbin
            # Rust
            rustc
            cargo
            rustfmt
            clippy
            # Lua
            (lua.withPackages(ps: with ps; [
              busted
              luafilesystem
              readline
              fennel
            ]))
            # Python
            python3
            # Ops
            docker_27
            # terraform
            #kubernetes
            #ngrok
            # DB
            sqlite
            postgresql
            #wezterm
          ];
          home.stateVersion = "24.11";
        };

        home-manager.useUserPackages = true;
        home-manager.useGlobalPkgs = true;

        services.sketchybar.enable = true;
      };
    in
      {
        # Build darwin flake using:
        # $ darwin-rebuild build --flake .#Nikolass-MacBook-Pro
        darwinConfigurations."Nikolass-MacBook-Pro" = nix-darwin.lib.darwinSystem {
          modules = [ home-manager.darwinModules.home-manager configuration ];
        };

        # Expose the package set, including overlays, for convenience.
        darwinPackages = self.darwinConfigurations."Nikolass-MacBook-Pro".pkgs;
      };
}
