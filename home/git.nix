{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;
    userName = "reonokiy";
    userEmail = "reonokiy@gmail.com";
  };
}
