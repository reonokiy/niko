{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableVteIntegration = true;
    shellAliases = {
      ls = "eza";
      ll = "eza -l";
      ".." = "cd ..";
      zed = "zeditor";
      k = "kubectl";
      code = "codium";
      fly = "op plugin run -- fly"; # by default, only `flyctl` have alias
    };
    syntaxHighlighting = {
      enable = true;
      highlighters = [
        "main"
        "brackets"
        "cursor"
        "root"
      ];
    };
    autosuggestion = {
      enable = true;
      strategy = [
        "completion"
        "history"
      ];
    };
  };
}
