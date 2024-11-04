{ pkgs, hostname, ... }:
let
  initExtra = ''
    export PATH="$PATH:$HOME/bin:$HOME/.local/bin:$HOME/go/bin"
    source ${pkgs.zsh-vi-mode}/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh
    # Navigation with lf
    lfcd () {
        # `command` is needed in case `lfcd` is aliased to `lf`
        cd "$(command lf -print-last-dir "$@")"
    }
    bindkey -s '^o' 'lfcd\n'
    bindkey -s '^O' 'lfcd\n'
  '';
in
{
  programs = {
    zsh = {
      enable = true;
      autosuggestion.enable = true;
      #      syntaxHighlighting.enable = true;
      enableCompletion = true;
      history = {
        size = 100000;
        extended = true;
      };
      initExtra = initExtra;
      plugins = [
        {
          name = "powerlevel10k";
          src = pkgs.zsh-powerlevel10k;
          file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
        }
        {
          name = "powerlevel10k-config";
          src = ./p10k-config;
          file = "p10k.zsh";
        }
        {
          name = "zsh-nix-shell";
          file = "nix-shell.plugin.zsh";
          src = pkgs.fetchFromGitHub {
            owner = "chisui";
            repo = "zsh-nix-shell";
            rev = "v0.7.0";
            sha256 = "149zh2rm59blr2q458a5irkfh82y3dwdich60s9670kl3cl5h2m1";
          };
        }
      ];
    };
  };
}
