{ config, ... }:

{
  sops.secrets."rustic/password" = { };
  sops.secrets."rustic/b2/application_key_id" = { };
  sops.secrets."rustic/b2/application_key" = { };

  sops.templates."rustic/config.toml" = {
    mode = "0400";
    owner = "niko";
    group = "niko";
    path = "/etc/rustic/rustic.toml";
    content = ''
      [repository]
      repository = "opendal:b2"
      password-command = "op read op://servers/rustic-backup/password"

      [repository.options]
      application_key_id = "${config.sops.placeholder."rustic/b2/application_key_id"}"
      application_key = "${config.sops.placeholder."rustic/b2/application_key"}"
      bucket = "machine-rustic-backup"
      bucket_id = "bd0174c258c85a4b914d0312"
      root = "/"

      [forget]
      prune = true
      keep-daily = 30
      keep-weekly = 12
      keep-monthly = 36
      keep-yearly = 10

      [backup]
      host = "niko"
      group-by = "host,label"
    '';
  };
}
