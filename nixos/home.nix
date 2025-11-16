{ config, pkgs, ... }:

{
  home.username = "vince";
  home.homeDirectory = "/home/vince";

  programs.git = {
    enable = true;
    settings.user = {
      name = "Vincent Brodin";
      email = "vincent.brodin21@gmail.com";
    };
  };
  programs.waybar.enable = true;
  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };
  programs.tmux = {
    enable = true;
    escapeTime = 0;
    shortcut = "SPACE";
    baseIndex = 1;
    keyMode = "vi";
    terminal = "screen-256color";
    extraConfig = ''
      bind -r ^ last-window
      bind -r k select-pane -U
      bind -r j select-pane -D
      bind -r h select-pane -L
      bind -r l select-pane -R

      set -g status-position top
      set -g status-justify centre
      set -g status-style 'fg=colour7 bg=default'

      # left: session name
      set -g status-left '#S'
      set -g status-left-style 'fg=colour4'
      set -g status-left-length 40

      # right: host name
      set -g status-right '#H'
      set -g status-right-style 'fg=colour4'
      set -g status-right-length 40

      # windows: plain text, subtle highlight on current
      setw -g window-status-format '#I:#W '
      setw -g window-status-current-format '#[fg=colour4]#I:#W '
      setw -g window-status-style 'fg=colour7'
      setw -g window-status-current-style 'fg=colour4'

      # pane borders (thin contrast)
      set -g pane-border-style 'fg=colour8'
      set -g pane-active-border-style 'fg=colour4'

    '';
  };

  home.packages = [
    # HELIX
    pkgs.helix
    pkgs.nil
    pkgs.nixfmt-rfc-style
    # RUST
    pkgs.rustc
    pkgs.cargo
    pkgs.rustfmt
    pkgs.rust-analyzer
    # DEV
    pkgs.pkg-config
    pkgs.openssl
    pkgs.gcc
    pkgs.gh
    # MISC
    pkgs.rofi
    pkgs.rose-pine-hyprcursor
    #FONTS
    pkgs.nerd-fonts.fira-mono
    pkgs.nerd-fonts.fira-code
  ];

  fonts = {
    fontconfig.enable = true;
  };

  home.file = {
  };
  home.sessionVariables = {

  };

  programs.home-manager.enable = true;
  home.stateVersion = "24.11"; # DO NOT CHANGE
}
