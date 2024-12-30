{
  config,
  pkgs,
  inputs,
  ...
}:

{
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    settings = {
      # variables
      "$mod" = "SUPER";
      "$terminal" = "foot";
      "$browser" = "firefox";

      monitor = "eDP-1,highres,auto,2";

      input = {
        kb_layout = "us";

        touchpad = {
          natural_scroll = "yes";
        };
      };

      bind =
        [
          "$mod, f, exec, firefox"
          "$mod, t, exec, foot"
          "$mod, escape, exit"
          "$mod, q, killactive"

          "$mod, left, movefocus, l"
          "$mod, right, movefocus, r"
          "$mod alt, left, workspace, e-1"
          "$mod alt, right, workspace, e+1"
        ]
        ++ (
          # workspaces
          # binds $mod + [shift +] {1..9} to [move to] workspace {1..9}
          builtins.concatLists (
            builtins.genList (
              i:
              let
                ws = i + 1;
              in
              [
                "$mod, code:1${toString i}, workspace, ${toString ws}"
                "$mod SHIFT, code:1${toString i}, movetoworkspace, ${toString ws}"
              ]
            ) 9
          )
        );

      # animations = {
      #   enable = "yes";
      #   bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";
      #   animation = "workspacesIn, 1, 8, default, slide top";
      #   animation = "workspacesOut, 1, 8, default, slide bottom";

      # };
    };
    plugins = [ ];
  };
}
