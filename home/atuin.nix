{
  programs.atuin = {
    enable = true;
    enableZshIntegration = true;
    enableFishIntegration = true;
    # daemon.enable = true;
    flags = [ "--disable-up-arrow" ];
    settings = {
      style = "compact";
      workspaces = true;
    };
  };
}
