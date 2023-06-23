{ config, lib, pkgs, ... }:

{
 programs.zsh = {
    enable = true;
    enableCompletion = true;
    plugins = [
      {
        # will source zsh-autosuggestions.plugin.zsh
        name = "zsh-autosuggestions";
        src = pkgs.fetchFromGitHub {
          owner = "zsh-users";
          repo = "zsh-autosuggestions";
          rev = "v0.4.0";
          sha256 = "0z6i9wjjklb4lvr7zjhbphibsyx51psv50gm07mbb0kj9058j6kc";
        };
      }
    ];
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "thefuck" ];
      theme = "lambda";
    };
    shellAliases = {
      es = "exa -al --icons";
      est = "exa -al --icons --tree";
      ip = "ip --color=auto";
      vim = "nvim";
      tmx = "tmux";
      ga = "git add .";
      gs = "git status .";
      gaf = "git add";
      gcmsg = "git commit -m";
      ggpush = "git push origin";
      ggpull = "git pull origin";
      lzg = "lazygit";
      lzd = "lazydocker";
    };

    initExtra = ''
      bindkey '^ ' autosuggest-accept
      # jumper
      eval "$(zoxide init bash)"
      export SECOND_BRAIN="$HOME/org"
      export ZK_NOTEBOOK_DIR="$HOME/org/zettlekastans/"
                              '';
  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };
}
