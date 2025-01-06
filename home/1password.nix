{
  inputs,
  lib,
  pkgs,
  ...
}:

let
  onePassPath = "~/.1password/agent.sock";
in
{
  imports = [ inputs.op-shell-plugins.hmModules.default ];

  programs.ssh = {
    enable = true;
    extraConfig = ''
      Host *
          IdentityAgent ${onePassPath}
    '';
  };

  programs.git = {
    enable = true;
    extraConfig = {
      gpg = {
        format = "ssh";
      };
      "gpg \"ssh\"" = {
        program = "${lib.getExe' pkgs._1password-gui "op-ssh-sign"}";
      };
      commit = {
        gpgsign = true;
      };
      user = {
        signingKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMsVXzD7GxpLIF1uZTq9TTzIAdq5xM+5MTaJJuzE+3cf";
      };
    };
  };

  programs._1password-shell-plugins = {
    enable = true;
    plugins = with pkgs; [
      gh
      flyctl
      hcloud
    ];
  };
}
