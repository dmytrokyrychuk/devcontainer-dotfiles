{...}: {
  programs.home-manager.enable = true;
  home.packages = [
  ];

  programs.fzf.enable = true;
  programs.starship.enable = true;
  programs.starship.settings = {
    container.disabled = true;
  };

  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting  # Disable greeting
    '';
  };
}
