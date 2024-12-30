{ pkgs, ... }:

{
  programs.zed-editor = {
    enable = true;
    extensions = [
      "nix"
      "typst"
    ];
    # extraPackages = [
    #   pkgs.typst
    # ];
    userSettings = {
      telemetry = {
        metrics = false;
      };
    };
  };
}
