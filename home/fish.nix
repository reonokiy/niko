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
    };
    shellInit = ''
      set fish_greeting
    '';
  };
}
