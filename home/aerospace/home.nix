{config, ...}: let
  link = config.lib.file.mkOutOfStoreSymlink;
in {
  home = {
    file = {
      ".config/aerospace/aerospace.toml" = {
        enable = true;
        source = link ./config.toml;
        # recursive = true;
        target = ".config/aerospace/aerospace.toml";
      };
    };
  };
}
