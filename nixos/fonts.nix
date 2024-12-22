{
  config,
  lib,
  pkgs,
  ...
}:

{
  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-lgc-plus
    noto-fonts-cjk-sans
    noto-fonts-cjk-serif
    noto-fonts-color-emoji
    sarasa-gothic # 更纱黑体
    inter
    fira-code-nerdfont
    stix-two
  ];

  # TODO: only the first valid now.
  # ref: https://discussion.fedoraproject.org/t/cjk-font-preference-configuration/96397/14
  fonts.fontconfig = {
    enable = true;
    defaultFonts = {
      sansSerif = [
        "Inter"
        "Noto Sans"
        "Noto Sans CJK SC"
      ];
      serif = [
        "STIX Two Text"
        "Noto Serif"
        "Noto Serif CJK SC"
      ];
      monospace = [
        "Fira Code Nerd Font Mono"
        "Sarasa Mono SC"
      ];
      emoji = [ "Noto Color Emoji" ];
    };
  };
}
