{
  programs.fish = {
    enable = true;
    generateCompletions = true;
    shellAliases = {
      ls = "eza";
      ll = "eza -l";
      ".." = "cd ..";
      zed = "zeditor";
      k = "kubectl";
      code = "codium";
      fly = "op plugin run -- fly"; # by default, only `flyctl` have alias
      kind = "systemd-run --scope --user kind"; # for running kind in rootless mode
    };
    shellInit = ''
      set fish_greeting
    '';
    functions = {
      load_nix_secrets = {
        body = ''
          if not command -v op > /dev/null
            echo "1Password CLI is not installed. Please install it first."
            return 1
          end

          set -Ux NIX_CONFIG "access-tokens = github.com="$(op read op://default-secrets/github_api_token_nix/token)
        '';
      };

      unload_nix_secrets = {
        body = ''
          set -e NIX_CONFIG
        '';
      };

      load_sops_secrets = {
        body = ''
          if not command -v op > /dev/null
            echo "1Password CLI is not installed. Please install it first."
            return 1
          end

          set -Ux SOPS_AGE_KEY "$(op read op://default-secrets/sops_age_key/secret_key)"
        '';
      };

      unload_sops_secrets = {
        body = ''
          set -e SOPS_AGE_KEY
        '';
      };
    };
  };
}
