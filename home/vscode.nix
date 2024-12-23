{
  pkgs,
  pkgs-unstable,
  ...
}:

{
  programs.vscode = {
    enable = true;
    enableExtensionUpdateCheck = false;
    enableUpdateCheck = false;
    package = pkgs-unstable.vscodium;
    extensions = with pkgs-unstable; [
      # General
      pkgs.vscode-extensions.github.copilot # Github Copilot (use older version)
      vscode-extensions.usernamehw.errorlens # Error Lens
      vscode-extensions.editorconfig.editorconfig # Editor Config
      vscode-extensions.catppuccin.catppuccin-vsc # Catppuccin Themes
      vscode-extensions.catppuccin.catppuccin-vsc-icons # Catppuccin Icons
      vscode-extensions.mkhl.direnv # Direnv

      # Language Specific
      ## Nix
      vscode-extensions.jnoortheen.nix-ide
    ];
    userSettings = {
      # General
      "window.dialogStyle" = "custom";
      "window.titleBarStyle" = "custom";
      "editor.formatOnSave" = true;
      "files.autoSave" = "off";
      "files.exclude" = {
        "**/.git" = true;
        "**/.jj" = true;
        "**/.DS_Store" = true;
        "**/.devenv" = true;
        "**/.direnv" = true;
      };
      "git.confirmSync" = false;

      # Themes

      # Language Specific
      ## Nix
      "[nix]"."editor.tabSize" = 2;
      "nix.enableLanguageServer" = true;
      "nix.serverPath" = "nixd";
    };
  };
}
