{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./keybase.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Set your time zone.
  time.timeZone = "Europe/Rome";

  # The global useDHCP flag is deprecated, therefore explicitly set to false here.
  # Per-interface useDHCP will be mandatory in the future, so this generated config
  # replicates the default behaviour.
  networking.useDHCP = false;
  networking.interfaces.enp0s31f6.useDHCP = true;
  networking.interfaces.wlp2s0.useDHCP = true;

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;
  services.gnome.core-utilities.enable = false;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.slightknack = {
    shell = pkgs.zsh;
    isNormalUser = true;
    home = "/home/slightknack";
    description = "Isaac Clayton";
    extraGroups = [ "wheel" "networkmanager" ];
  };

  nixpkgs.config.allowUnfree = true;

  fonts.fonts = with pkgs; [
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    liberation_ttf
    fira-code
    fira-code-symbols
    ibm-plex
    mplus-outline-fonts
    dina-font
    proggyfonts
    nerdfonts
  ];

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    # Desktop
    gnome.gnome-tweak-tool
    gnomeExtensions.paperwm

    # The Internet!
    firefox-wayland
    discord
    slack

    # Developer apps
    alacritty
    atom

    # Keybase, because... heck
    kbfs
    keybase
    keybase-gui

    # Shell should-be-builtins
    git
    zsh
    file
    tree
    gcc
    llvm
    libclang
    clang
    cmake
    gnumake
    makeWrapper
    binutils
    wget
    pkg-config
    libusb
    dbus

    # Shell tools
    oh-my-zsh
    rustup
    rust-analyzer
    neofetch
    portaudio

    # AppImages, ugh }:(
    (appimage-run.override {
      extraPkgs = pkgs: [ pkgs.libsecret ];
    })
  ];

  programs.zsh.enable = true;
  programs.zsh.ohMyZsh = {
    enable = true;
    plugins = [
      "git"
    ];
    theme = "miloshadzic";
  };

  hardware.pulseaudio.enable = true;

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  system.stateVersion = "21.05"; # Did you read the comment?
}
