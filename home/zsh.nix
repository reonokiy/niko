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
