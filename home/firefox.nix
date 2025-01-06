{ pkgs, ... }:

{
  programs.firefox = {
    enable = true;
    package = pkgs.firefox.override {
      # See nixpkgs' firefox/wrapper.nix to check which options you can use
      nativeMessagingHosts = [
        # Gnome shell native connector
        pkgs.gnome-browser-connector
        # Tridactyl native connector
        pkgs.tridactyl-native
      ];
    };
    enableGnomeExtensions = true;
    languagePacks = [ "en-US" ];
    profiles = {
      default = {
        bookmarks = [ ];
      };
    };
  };
}
