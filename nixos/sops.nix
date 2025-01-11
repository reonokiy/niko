{ inputs, ... }:

{
  sops.defaultSopsFile = "${inputs.machine-secrets}/niko.yaml";
  sops.defaultSopsFormat = "yaml";
  sops.age.keyFile = "/var/lib/sops-nix/key.txt";
}
