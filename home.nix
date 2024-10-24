{config, pkgs, ... }: 
{
  wayland.windowManager.hyprland.settings = {

    exec-once = [
      "udiskie &"
      "waybar & ayugram-desktop"
    ];

    cursor = {
    	no_warps = true;
    };

    general = {
    	gaps_in = 5;
    	gaps_out = 20;

    	border_size = 2;

    	"col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg"
    	"col.inactive_border" = "rgba(595959aa)"

    	resize_on_border = false;
    	allow_tearing = false;

    	layout = "dwindle";
    };

    decoration = {
      rounding = 5;
      active_opacity = 1.0;
      inactive_opacity = 1.0;
      drop_shadow = true;
      shadow_range = 4;
      shadow_render_power = 3;
      "col.shadow" = "rgba(1a1a1aee)";

      blur = {
        enabled = true;
        size = 3;
        passes = 1;
            
        vibrancy = 0.1696;
      };
    };

    animations = {
      enabled = true;

      bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";

      animation = [
      	"windows, 1, 7, myBezier"
      	"windowsOut, 1, 7, default, popin 80%"
      	"border, 1, 10, default"
      	"borderangle, 1, 8, default"
      	"fade, 1, 7, default"
      	"workspaces, 1, 6, default"
      ];
    };

    dwindle = {
      pseudotile = true;
      preserve_split = true;
    };

    misc = {
      force_default_wallpaper = -1;
      disable_hyprland_logo = false;
    };

    input = {
      kb_layout = "us,ua";
      kb_variant = "lang";
      kb_model = "";
      kb_options = "grp:alt_shift_toggle";
      kb_rules = "";

      follow_mouse = 1;

      sensivity = 0;

      touchpad = {
      	natural_scroll = true;
      	disable_while_typing = false;
      };
    };

    gestures = {
      workspace_swipe = false;	
    };

    "$mainMod" 		= "SUPER";
    "$terminal" 	= "tilix";
    "$fileManager" 	= "thunar";
    "$menu" 		= "rofi -show drun";
    "$browser" 		= "google-chrome-stable";

    bind = [
      "$mainMod, RETURN, exec, $terminal"
      "$mainMod, Q, killactive,"
      "SUPER_SHIFT, E, exit,"
      "$mainMod, F, exec, $fileManager"
      "SUPER_SHIFT, F, togglefloating,"
      "$mainMod, SPACE, exec, $menu"
      "$mainMod, N, exec, kitty -e nmtui"
      "$mainMod, B, exec, vblue"

      "$mainMod, H, exec, pkill waybar || waybar"

      ",code:123, exec, pamixer --allow-boost -i 2"
      ",code:122, exec, pamixer --allow-boost -d 2"
      ",code:121, exec, pamixer -t"

	  ",code:173, exec, playerctl previous"
	  ",code:172, exec, playerctl play-pause"
	  ",code:171, exec, playerctl next"
	  ",code:107, exec, grim -g \"$(slurp)\" - | wl-copy; exec notify-send 'Grim' 'Selected image copied to clipboard'"
	  "$mainMod, code:107, exec, exec grim - | wl-copy; exec notify-send 'Grim' 'Image copied into clipboard'"

	  "$mainMod, left, movefocus, l"
	  "$mainMod, right, movefocus, r"
	  "$mainMod, up, movefocus, u"
	  "$mainMod, down, movefocus, d"

	  "$mainMod, 1, workspace, name:1"
	  "$mainMod, 2, workspace, name:2 "
	  "$mainMod, 3, workspace, name:3 "
	  "$mainMod, 4, workspace, name:4 "
	  "$mainMod, 5, workspace, name:5 󰨞"
	  "$mainMod, 6, workspace, name:6"
	  "$mainMod, 7, workspace, name:7 󰋀"
	  "$mainMod, 8, workspace, name:8"
	  "$mainMod, 9, workspace, name:9 󰙯"
	  "$mainMod, 0, workspace, name:10"

	  "ALT, TAB, workspace, previous"

	  "$mainMod SHIFT, 1, movetoworkspace, name:1"
	  "$mainMod SHIFT, 2, movetoworkspace, name:2 "
	  "$mainMod SHIFT, 3, movetoworkspace, name:3 "
	  "$mainMod SHIFT, 4, movetoworkspace, name:4 "
	  "$mainMod SHIFT, 5, movetoworkspace, name:5 󰨞"
	  "$mainMod SHIFT, 6, movetoworkspace, name:6"
	  "$mainMod SHIFT, 7, movetoworkspace, name:7 󰋀"
	  "$mainMod SHIFT, 8, movetoworkspace, name:8"
	  "$mainMod SHIFT, 9, movetoworkspace, name:9 󰙯"
	  "$mainMod SHIFT, 0, movetoworkspace, name:10"

	  "$mainMod SHIFT, left, swapwindow, l"
	  "$mainMod SHIFT, right, swapwindow, r"
	  "$mainMod SHIFT, up, swapwindow, u"
	  "$mainMod SHIFT, down, swapwindow, d"
    ];

	
    bindm = [
      # mouse movements
      "$mainMod, mouse:272, movewindow"
      "$mainMod, mouse:273, resizewindow"
    ];

    windowrule = [
      "float, ^(kitty)$"
      "float, ^(rofi)$"
    ];
    
    windowrulev2 = [
      "suppressevent maximize, class:.*"	
    ];
    
  };
  # ...
}
