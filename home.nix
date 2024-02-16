{...}: {
  programs.home-manager.enable = true;
  home.packages = [
  ];

  programs.zoxide.enable = true;
  programs.fzf.enable = true;
  programs.starship.enable = true;
  programs.starship.settings = {
    container.disabled = true;
    package.disabled = true;
    python.disabled = true;
    docker_context.disabled = true;
  };

  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting  # Disable greeting
    '';
  };

  programs.kakoune.enable = true;
  # Use defaultEditor after 23.11 release.
  # programs.kakoune.defaultEditor = true;
  home.sessionVariables.EDITOR = "kak";
}
