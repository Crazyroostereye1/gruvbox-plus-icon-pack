{
  description = "Gruvbox icon Pack from Github";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs";  # Use the latest nixpkgs for dependencies
  };

  outputs = { self, nixpkgs }:
    let
      # Reference nixpkgs
      pkgs = import nixpkgs { system = "x86_64-linux"; };
    in {
      # Define the icon pack as a package
      packages.x86_64-linux.iconPack = pkgs.stdenv.mkDerivation {
        pname = "gruvbox-plus-icons";
        version = "nix-flake";

	src = ./Gruvbox-Plus-Dark;

        # Set the installation directory for icons
        installPhase = ''
          mkdir -p $out/share/icons
          cp -r * $out/share/icons/
        '';

        meta = with pkgs.lib; {
          description = "My Dev version of the Icon Pack";
          license = licenses.gpl3;      # Adjust based on the icon pack license
          maintainers = [ maintainers.crazyroostereye1 ];
        };
      };
    };
}

