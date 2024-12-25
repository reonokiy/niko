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
    typst
    typstyle
    tinymist

    # containers and k8s
    kind
    kubectl

    # platform cli
    flyctl # fly.io cli
    gh # github cli
    github-copilot-cli

    # Nix
    nixd
    nixfmt-rfc-style

    # Python
    ruff

    # Desktop Apps
    tuba # Gnome Circle App for Fediverse
    fractal # Matrix chat
    trayscale # Unofficial Tailscale GUI using GTK
    qbittorrent-enhanced
  ];

  home.stateVersion = "24.11";
  programs.home-manager.enable = true;
}
