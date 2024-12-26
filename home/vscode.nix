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
    extensions =
      with pkgs-unstable.open-vsx;
      [
        # General
        usernamehw.errorlens # Error Lens
        editorconfig.editorconfig # Editor Config
        mkhl.direnv # Direnv
        streetsidesoftware.code-spell-checker
        eamodio.gitlens
        github.vscode-github-actions
        github.vscode-pull-request-github

        # Themes
        catppuccin.catppuccin-vsc # Catppuccin Themes
        catppuccin.catppuccin-vsc-icons # Catppuccin Icons
        antfu.theme-vitesse # Vitesse Themes

        # Language Specific
        ## Nix
        jnoortheen.nix-ide
        ## Python
        ms-python.python
        ms-python.debugpy
        ms-pyright.pyright
        charliermarsh.ruff
        ## Rust
        rust-lang.rust-analyzer
        ## Vue
        vue.volar
        antfu.vite
        antfu.iconify
        antfu.unocss
        ## TOML
        tamasfe.even-better-toml
        ## Typst
        myriad-dreamin.tinymist
        ## Just
        nefrob.vscode-just-syntax
      ]
      ++ (with pkgs-unstable.vscode-marketplace-release; [
        github.copilot # Github Copilot (use older version)
        github.copilot-chat # Github Copilot Chat
      ])
      ++ (with pkgs-unstable.vscode-marketplace; [
        antfu.open-in-github-button
      ]);
    userSettings = {
      # General
      "window.dialogStyle" = "custom";
      "window.titleBarStyle" = "custom";
      "window.title" = "\${rootName}";
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
      "window.autoDetectColorScheme" = true;
      "workbench.colorTheme" = "Vitesse Dark";
      "workbench.preferredDarkColorTheme" = "Vitesse Dark";
      "workbench.preferredLightColorTheme" = "Vitesse Light";
      "workbench.iconTheme" = "catppuccin-mocha";

      # Visual
      "workbench.list.smoothScrolling" = true;
      "workbench.sideBar.location" = "right";
      "workbench.tree.expandMode" = "singleClick";
      "workbench.tree.indent" = 10;
      "workbench.editor.closeOnFileDelete" = true;
      "workbench.editor.highlightModifiedTabs" = true;
      "workbench.editor.limit.enabled" = true;
      "workbench.editor.limit.perEditorGroup" = true;
      "workbench.editor.limit.value" = 5;

      # Language Specific
      ## Nix
      "[nix]"."editor.tabSize" = 2;
      "nix.enableLanguageServer" = true;
      "nix.serverPath" = "nixd";
      ## Vue
      "[vue]"."editor.tabSize" = 2;
      "vue.server.hybridMode" = "true"; # avoid conflict with github copilot ts server

      # Extension Specific
      ## Error Lens
      "errorLens.enabledDiagnosticLevels" = [
        "warning"
        "error"
      ];
      "errorLens.excludeBySource" = [
        "cSpell"
        "Grammarly"
        "eslint"
      ];
      "cSpell.allowCompoundWords" = true; # allow compound words like "errormessage"
      "cSpell.language" = "en,en-US";
    };
  };
}
