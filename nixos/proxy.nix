{
  pkgs,
  inputs,
  lib,
  config,
  ...
}:

let
  pkg = pkgs.sing-box;
in
{
  sops.secrets."sing-box.config.json" = {
    sopsFile = "${inputs.sincrets}/dist/client.sops.json";
    format = "json";
    key = "";
    mode = "0440";
    owner = "proxy";
    group = "proxy";
  };

  users.users.proxy = {
    isSystemUser = true;
    group = "proxy";
  };
  users.groups.proxy = { };

  systemd.services.proxy = {
    path = [
      pkgs.iptables
    ];
    serviceConfig = {
      StateDirectory = "sing-box";
      StateDirectoryMode = "0700";
      RuntimeDirectory = "sing-box";
      RuntimeDirectoryMode = "0700";
      AmbientCapabilities = [ "CAP_NET_ADMIN" ];
      PrivateNetwork = false;
      User = "proxy";
      ExecStart = [
        "${lib.getExe pkg} -D \${STATE_DIRECTORY} -c ${config.sops.secrets."sing-box.config.json".path} run"
      ];
    };
    wantedBy = [ "multi-user.target" ];
  };
}
