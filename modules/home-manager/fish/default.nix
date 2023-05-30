{ config, lib, pkgs, ... }:

{
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting
      source $pkgs.nix-index/etc/profile.d/command-not-found.sh
    '';
    shellAliases = {
      gs = "git status";
      clone = "git clone";
      ls = "ls -alh";
      es = "exa --long --color auto --icons";
      cat = "bat";
      clr = "clear";
      cls = "clear";
      ext = "exit";
      tdr = "tldr -t base16";
      vim = "nvim";
      tmx = "tmux";
      lzg = "lazygit";
      lzd = "lazydocker";
      ggpull = "git pull origin";
      ggpush = "git push origin";
      gcmsg = "git commit --message";
      gco = "git checkout";
      gcs = "git commit --gpg-sign";
      gd = "git diff";
      gcl = "git clone --recurse-submodules";
      ga = "git add";
      gaa = "git add --all";
      gb = "git branch";
      gba = "git branch --all";
      g = "git";
      ip = "ip --color=auto";
      gaf = "git add";
    };
    shellAbbrs = {
      ls = "ls -lah";
      gs = "git status";
      es = "exa --long --color auto --icons";
      cat = "bat";
      clr = "clear";
      cls = "clear";
      ext = "exit";
      tdr = "tldr -t base16";
      vim = "nvim";
      tmx = "tmux";
      lzg = "lazygit";
      lzd = "lazydocker";
      ggpull = "git pull origin";
      ggpush = "git push origin";
      gcmsg = "git commit --message";
      gco = "git checkout";
      gcs = "git commit --gpg-sign";
      gd = "git diff";
      gcl = "git clone --recurse-submodules";
      ga = "git add";
      gaa = "git add -ll";
      gb = "git branch";
      gba = "git branch -ll";
      g = "git";
      ip = "ip --color=auto";
      clone = "git clone";
    };
    plugins = [
      {
        name = "grc";
        src = pkgs.fishPlugins.grc.src;
      }
      {
        name = "done";
        src = pkgs.fishPlugins.done.src;
      }
      {
        name = "fzf-fish";
        src = pkgs.fishPlugins.fzf-fish.src;
      }
      {
        name = "forgit";
        src = pkgs.fishPlugins.hydro.src;
      }
      # Manually packaging and enable a plugin
      {
        name = "z";
        src = pkgs.fetchFromGitHub {
          owner = "jethrokuan";
          repo = "z";
          rev = "e0e1b9dfdba362f8ab1ae8c1afc7ccf62b89f7eb";
          sha256 = "0dbnir6jbwjpjalz14snzd3cgdysgcs3raznsijd6savad3qhijc";
        };
      }
    ];
  };
  programs.fzf = {
    enable = true;
    enableFishIntegration = true;
  };
  programs.command-not-found.enable = false;
  programs.nix-index.enable = true;
  programs.nix-index.enableFishIntegration = true;
}
