{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;
    userName = "reonokiy";
    userEmail = "reonokiy@gmail.com";
    extraConfig = {
      credential = {
        helper = [
          "cache --timeout 3600"
        ];
      };
    };
  };

  programs.git-credential-oauth.enable = true;
}
