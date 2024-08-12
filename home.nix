{...}: {
  programs.home-manager.enable = true;
  home.packages = [
  ];

  # FIXME: these programs are not activated in shells that are not managed by home-manager.
  # Since fish was removed, these programs should probably be deleted.
  programs.zoxide.enable = true;
  programs.fzf.enable = true;
  programs.starship.enable = true;
  programs.starship.settings = {
    container.disabled = true;
    package.disabled = true;
    python.disabled = true;
    docker_context.disabled = true;
  };

  # You must manually include this file in your main git config file.
  xdg.configFile."git/extra-config".source = ./.config/git/extra-config;

  home.sessionVariables.EDITOR = "code --wait";
}
