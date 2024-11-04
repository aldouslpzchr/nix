{
  pkgs,
  config,
  ...
}: let
  link = config.lib.file.mkOutOfStoreSymlink;
in {
  home = {
    packages = with pkgs; [
      # astronvim extra requirements
      ripgrep
      lazygit
      nodejs

      stylua

      # for astronvim nix pack
      alejandra
      deadnix
      statix
      nixd
    ];

    file = {
      ".config/nvim/lua" = {
        enable = true;
        source = link ./nvim-astronvim/lua;
        recursive = true;
        target = ".config/nvim/lua";
      };
      ".config/nvim/init.lua" = {
        enable = true;
        source = link ./nvim-astronvim/init.lua;
        # recursive = true;
        target = ".config/nvim/init.lua";
      };
    };
  };

  programs = {
    git.extraConfig.core.editor = "nvim";
  };
}
