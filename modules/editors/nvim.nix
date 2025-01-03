{ config, lib, system, pkgs, stable, vars, ... }:

let
  colors = import ../theming/colors.nix;

  # nvim-spell-nl-utf8-dictionary = builtins.fetchurl {
  #   url = "http://ftp.vim.org/vim/runtime/spell/nl.utf-8.spl";
  #   sha256 = "sha256:1v4knd9i4zf3lhacnkmhxrq0lgk9aj4iisbni9mxi1syhs4lfgni";
  # };
  #
  # nvim-spell-nl-utf8-suggestions = builtins.fetchurl {
  #   url = "http://ftp.vim.org/vim/runtime/spell/nl.utf-8.sug";
  #   sha256 = "sha256:0clvhlg52w4iqbf5sr4bb3lzja2ch1dirl0963d5vlg84wzc809y";
  # };
in
{
  environment = {
    systemPackages = with pkgs; [
      go
      nodejs
      (python3.withPackages (ps: with ps; [
        pip
      ]))
      ripgrep
      # zig
    ];
    variables = {
      PATH = "$HOME/.npm-packages/bin:$PATH";
      NODE_PATH = "$HOME/.npm-packages/lib/node_modules:$NODE_PATH:";
    };
  };

  programs.neovim = {
    enable = true;
    # viAlias = true;
    # vimAlias = true;
  };
}
