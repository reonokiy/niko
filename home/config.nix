{
  pkgs,
  ...
}:

{
  home.username = "niko";
  home.homeDirectory = "/home/niko";

  xresources.properties = {
    "Xcursor.size" = 16;
    "Xft.dpi" = 172;
  };

  home.packages = with pkgs; [
    fastfetch
    ripgrep
    jq
    fzf
    devenv
    bottom
    just

    # Nix
    nixd
    nixfmt-rfc-style

    # Python
    ruff

    # Desktop Apps
    tuba # Gnome Circle App for Fediverse
    fractal # Matrix chat
    vscode-fhs
    trayscale # Unofficial Tailscale GUI using GTK
  ];

  home.stateVersion = "24.11";
  programs.home-manager.enable = true;
}
