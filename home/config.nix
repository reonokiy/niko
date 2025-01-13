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
    tealdeer
    mosh
    rustic
    dig

    # dev tools
    cargo
    rust-analyzer
    rustfmt
    rustc
    pkg-config
    openssl.dev
    gcc
    go
    nodejs
    yarn
    pnpm
    distrobox
    distrobox-tui
    gradle
    dive
    podman-tui
    podman-compose

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
    python3
    uv
    ruff

    # Desktop Apps
    tuba # Gnome Circle App for Fediverse
    fractal # Matrix chat
    trayscale # Unofficial Tailscale GUI using GTK
    foliate # eBook reader
    qbittorrent-enhanced
    google-chrome
    dbeaver-bin
    telegram-desktop
    android-studio
    sly # image editor
    mihomo-party

    # Office
    libreoffice
    hunspell
    hunspellDicts.en_US
  ];

  home.stateVersion = "24.11";
  programs.home-manager.enable = true;

  home.sessionVariables = {
    EDITOR = "nano";
    NIXPKGS_ALLOW_UNFREE = 1;
    PKG_CONFIG_PATH = "${pkgs.openssl.dev}/lib/pkgconfig";
  };
}
