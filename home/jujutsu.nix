{ config, pkgs, ... }:

{
  programs.jujutsu = {
    enable = true;
    ediff = true;
    settings = {
      user = {
        name = "reonokiy";
        email = "reonokiy@gmail.com";
      };
    };
  };
}
