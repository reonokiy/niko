{ pkgs, ... }:

{
  programs.zed-editor = {
    enable = true;
    extensions = [
      "nix"
      "typst"
      "rust"
      "toml"
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
