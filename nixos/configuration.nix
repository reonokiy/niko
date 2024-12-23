{
  config,
  lib,
  pkgs,
  ...
}:

{
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.supportedFilesystems = [ "ntfs" ];

  fileSystems."/mnt/windows" = {
    device = "/dev/disk/by-label/WINDOWS";
    fsType = "ntfs-3g";
    options = [
      "rw"
      "uid=1000"
    ];
  };

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  nixpkgs.config.allowUnfree = true;

  networking.hostName = "niko";
  networking.networkmanager.enable = true; # Easiest to use and most distros use this by default.

  time.timeZone = "Asia/Shanghai";
  i18n.defaultLocale = "en_US.UTF-8";

  services.xserver.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.displayManager.gdm.wayland = true;
  services.xserver.desktopManager.gnome.enable = true;

  programs.xwayland.enable = true;
  programs.hyprland.enable = true;

  # Hint Electron apps to use Wayland:
  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  environment.systemPackages = with pkgs; [
    git
    vim
    wget
    nano

    gnomeExtensions.kimpanel # ime extension for gnome
    gnomeExtensions.rounded-window-corners-reborn
    gnomeExtensions.appindicator
    gnomeExtensions.just-perfection # custom tools
    gnomeExtensions.pano # clipboard manager for gnome
    gnomeExtensions.dash-to-panel
    gnomeExtensions.top-panel-workspace-scroll
    gnomeExtensions.status-area-horizontal-spacing

    # other tools
    lshw
    flclash
    sing-box
  ];

  users.users.niko = {
    uid = 1000;
    isNormalUser = true;
    shell = pkgs.zsh;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
    packages = with pkgs; [
      tree
      htop
    ];
  };

  users.groups.niko = {
    gid = 1000;
    members = [ "niko" ];
  };

  swapDevices = [
    {
      device = "/swapfile";
      size = 16 * 1024; # 16 GiB
    }
  ];
  zramSwap = {
    enable = true;
    algorithm = "zstd";
    memoryPercent = 100;
  };

  nix.settings = {
    substituters = [ "https://hyprland.cachix.org" ];
    trusted-public-keys = [ "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc=" ];
  };

  programs.firefox = {
    enable = true;
  };
  programs.chromium = {
    enable = true;
  };
  programs.mtr.enable = true;
  programs.zsh.enable = true;

  system.stateVersion = "24.11";
}
