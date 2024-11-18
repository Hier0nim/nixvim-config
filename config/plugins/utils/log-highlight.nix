{ pkgs, ... }:
{
  extraPlugins = with pkgs.vimPlugins; [
    log-highlight
  ];

  extraConfigLua =
    #lua
    ''
      require('log-highlight').setup {}
    '';
}
