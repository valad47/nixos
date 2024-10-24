# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, inputs, ... }:
let
  
in
{
  imports = [
      ./hardware-configuration.nix
      inputs.home-manager.nixosModules.default
      inputs.spicetify-nix.nixosModules.default
  ];

  services.xserver = {
  	enable = true;

  	desktopManager = {
  		xterm.enable = false;
  	};

  	windowManager.i3 = {
  		enable = true;
  		extraPackages = with pkgs; [
  			dmenu
  			i3status
  			i3lock
  		];
  	};
  };

  virtualisation.waydroid.enable = true;

  programs = {
  	hyprland = {
  	  enable = true;
  	  xwayland.enable = true;
  	  portalPackage = pkgs.xdg-desktop-portal-wlr;
  	};
  	hyprlock.enable = true;
  	sway = {
  	  enable = true;
  	  wrapperFeatures.gtk = true;
  	};
  	waybar.enable = true;
  	thunar.enable = true;
  	fish.enable = true;
  	neovim = {
  		enable = true;
  	};
  	spicetify =
  	   let
  	     spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
  	   in {
  	     enable = true;
  	     enabledExtensions = with spicePkgs.extensions; [
  	       adblock
  	       shuffle # shuffle+ (special characters are sanitized out of extension names)
  	       beautifulLyrics
  	     ];
  	     theme = spicePkgs.themes.catppuccin;
  	     colorScheme = "mocha";
  	   };
	dconf.enable = true;
  };
  environment.systemPackages = with pkgs; [
	## DEVELOPMENT ##
    git
    direnv
    gcc
    c3c
    gdb    
    cmake
    gnumake
    clang-tools
	valgrind

	## MAN PAGES ##
    linux-manual
    man-pages
    man-pages-posix

	## TEXT EDITORS ##
	micro
	vscode
	emacs

	## UTILITIES ##
    ncdu
    p7zip
    grim
    tmux
    vulkan-tools
    mpv
    ffmpeg
    rar
    wget
    htop
    neofetch
    slurp
    wl-clipboard
    rofi
	android-tools

	## AUDIO CONTROL ##
    pipewire
    pulseaudio
    pamixer
    playerctl
    pavucontrol

	## BROWSER ##
    chromium
    google-chrome

	## NOTIFICATIONS ##
	dunst
	libnotify

	## COMMUNICATION ##
    discord
    inputs.ayugram-desktop.packages.${pkgs.system}.default

	## TERMINAL ##	
    kitty
    tilix

    ## DISPLAY MANAGER ##
    ly

    ## OTHER STUFF ##
    wineWowPackages.waylandFull
    libreoffice
    steam
    (lutris.override {
    	extraLibraries = pkgs: [
    		
    	];
    	extraPkgs = pkgs: [
    		
    	];
    })
	obs-studio
	
    ## UNSORTED ##
  ];

  ## FONTS ##
  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    liberation_ttf
    fira-code
    fira-code-symbols
    mplus-outline-fonts.githubRelease
    dina-font
    proggyfonts
    corefonts
    vistafonts
  	(nerdfonts.override { fonts = [ "Iosevka" "JetBrainsMono" "ComicShannsMono" ];})
  ];

  ## ENABLING FLAKES ##
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  security.polkit.enable = true;


  home-manager.users.valad47 = {
    home.stateVersion = "24.11";
    dconf.settings = {
      "org/gnome/desktop/interface" = {
        color-scheme = "prefer-dark";
      };
    };

    home.pointerCursor = {
      package = pkgs.volantes-cursors;
      name = "volantes_dark_cursors";
      gtk.enable = true;
    };
	
    gtk = {
      enable = true;
      theme = {
        name = "Adwaita-dark";
        package = pkgs.gnome-themes-extra;
      };
    };
  
      # Wayland, X, etc. support for session vars
    systemd.user.sessionVariables = config.home-manager.users.valad47.home.sessionVariables;
  };

  qt = {
    enable = true;
    platformTheme = "gnome";
    style = "adwaita-dark";
  };

  users.defaultUserShell = pkgs.fish;
  nixpkgs.config.allowUnfree = true;
  services.flatpak.enable = true;

  services.gnome.gnome-keyring.enable = true;

  services.displayManager.ly.enable = true;
	  
  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelModules = [ "uinput" ];

  networking.hostName = "valad47"; # Define your hostname.
  networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.

  time.timeZone = "Europe/Kyiv";

  hardware.graphics.enable32Bit = true;

  security.rtkit.enable = true;
  hardware.bluetooth.enable = true; # enables support for Bluetooth
  hardware.bluetooth.powerOnBoot = true; # powers up the default Bluetooth controller on boot
  services.blueman.enable = true;
  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  xdg.portal = {
  	enable = true;
  	config = {
  	  common = {
  	  	default = "wlr";
  	  };
  	};
  	extraPortals = with pkgs; [
  	  xdg-desktop-portal-gtk
  	];
  	wlr.enable = true;
  };

  documentation = { 
    enable = true;
    man.enable = true;
    man.generateCaches = false;
    dev.enable = true;
    doc.enable = true; 
  };
  
  users.users.valad47 = {
    isNormalUser = true;
    extraGroups = [ "nixos" "audio" "networkmanager" "wheel" "input" ];
    packages = with pkgs; [

   ];
  };

  system.stateVersion = "24.05"; # Did you read the comment?
}

