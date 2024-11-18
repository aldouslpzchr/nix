{pkgs, ...}: {
  ##########################################################################
  #
  #  Install all apps and packages here.
  #
  #  NOTE: Your can find all available options in:
  #    https://daiderd.com/nix-darwin/manual/index.html
  #
  # TODO Fell free to modify this file to fit your needs.
  #
  ##########################################################################

  # Install packages from nix's official package repository.
  #
  # The packages installed here are available to all users, and are reproducible across machines, and are rollbackable.
  # But on macOS, it's less stable than homebrew.
  #
  # Related Discussion: https://discourse.nixos.org/t/darwin-again/29331
  environment.systemPackages = with pkgs; [
    git
    neovim
    vscode
    just
    cargo
    direnv
    (google-cloud-sdk.withExtraComponents [google-cloud-sdk.components.gke-gcloud-auth-plugin])
    k9s
    kubectl
    kubernetes-helm
    terraform
    gh
    lazydocker
    python311
    python311Packages.virtualenv
    devbox
    devcontainer
  ];

  # TODO To make this work, homebrew need to be installed manually, see https://brew.sh
  #
  # The apps installed by homebrew are not managed by nix, and not reproducible!
  # But on macOS, homebrew has a much larger selection of apps than nixpkgs, especially for GUI apps!
  homebrew = {
    enable = true;

    onActivation = {
      autoUpdate = true; # Fetch the newest stable branch of Homebrew's git repo
      upgrade = true; # Upgrade outdated casks, formulae, and App Store apps
      # 'zap': uninstalls all formulae(and related files) not listed in the generated Brewfile
      cleanup = "zap";
    };

    taps = [
      "homebrew/services"
      "FelixKratz/formulae"
      "nikitabobko/tap"
    ];

    # `brew install`
    # TODO Feel free to add your favorite apps here.
    brews = [
      "wget" # download tool
      "curl" # no not install curl via nixpkgs, it's not working well on macOS!
      "aria2" # download tool
      "httpie" # http client
      "borders" # JankyBorders
      "docker" # docker client
      "docker-compose" # docker compose client
    ];

    # `brew install --cask`
    # TODO Feel free to add your favorite apps here.
    casks = [
      "jetbrains-toolbox"
      "orbstack" # to run docker
      "lastpass"
      "discord"
      "anki"
      "raycast"
      "stats"
      "obsidian"
      "ticktick"
      "nikitabobko/tap/aerospace"
      "wezterm"
      "vivaldi"
      "sublime-text"
      "neovide"
      "parsec"
    ];
  };

  fonts = {
    packages = with pkgs; [
      carlito
      vegur
      source-code-pro
      jetbrains-mono
      font-awesome
      corefonts
      meslo-lgs-nf
      (nerdfonts.override {
        fonts = [
          "FiraCode"
          "Hack"
          "DroidSansMono"
          "Meslo"
          "Hack"
          "Iosevka"
          "IosevkaTerm"
          "JetBrainsMono"
          "ComicShannsMono"
          "CodeNewRoman"
          "FantasqueSansMono"
        ];
      })
    ];
  };
}
