{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;
    userName = "reonokiy";
    userEmail = "reonokiy@gmail.com";
  };

  programs.git-credential-oauth.enable = true;
}
