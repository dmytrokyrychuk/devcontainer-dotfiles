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

  # You must manually include this file in your main git config file.
  xdg.configFile."git/extra-config".source = ./.config/git/extra-config;

  home.sessionVariables.EDITOR = "code --wait";
}
