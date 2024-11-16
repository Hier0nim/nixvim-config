{ pkgs, ... }:
{
  extraPlugins = with pkgs.vimPlugins; [
    r-nvim
    cmp-r
  ];

  extraConfigLua =
    #lua
    ''
      require("cmp").setup({ sources = {{ name = "cmp_r" }}})
      require("cmp_r").setup({})
    '';
}
