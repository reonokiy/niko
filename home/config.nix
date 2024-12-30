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
    age
    sops
    inetutils
    wineWowPackages.waylandFull
    ollama-cuda

    # containers and k8s
    kind
    kubectl
    cilium-cli
    kubernetes-helm
    k9s
    fluxcd

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
    google-chrome
    dbeaver-bin
    telegram-desktop
  ];

  home.stateVersion = "24.11";
  programs.home-manager.enable = true;
}
