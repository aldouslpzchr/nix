{ pkgs, ... }:
{

  programs.lf = {
    enable = true;
    commands = {
      editor-open = ''$$EDITOR $f'';
      mkdir = ''
        ''${{
          printf "Directory Name: "
          read DIR
          mkdir $DIR
        }}
      '';
      open = ''&${pkgs.glib}/bin/gio open $f'';
    };
    keybindings = {
      "\\\"" = "";
      c = "mkdir";
      "." = "set hidden!";
      "`" = "mark-load";
      "\\'" = "mark-load";

      gh = "cd";
      V = ''''$${pkgs.bat}/bin/bat --paging=always "$f"'';

    };
    settings = {
      preview = true;
      hidden = true;
      drawbox = true;
      ignorecase = true;
    };
  };
}
