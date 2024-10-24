{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  	home-manager = {
  	  url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";	
  	};
  	spicetify-nix = {
  	  url = "github:Gerg-L/spicetify-nix";
  	  inputs.nixpkgs.follows = "nixpkgs";
  	};
  	ayugram-desktop.url = "github:kaeeraa/ayugram-desktop/release?submodules=1";
  };
  

  outputs = { self, nixpkgs, home-manager, spicetify-nix, ayugram-desktop, ... }@inputs: {
    nixosConfigurations.valad47 = nixpkgs.lib.nixosSystem {
      specialArgs = {
      	inherit inputs;
      };
      modules = [ ./configuration.nix ];
    };
  };
}
