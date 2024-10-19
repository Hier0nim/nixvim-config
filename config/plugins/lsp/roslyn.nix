{ pkgs, ... }:
{
  extraPackages = with pkgs; [
    roslyn-ls
    (
      with dotnetCorePackages;
      combinePackages [
        sdk_8_0
      ]
    )
  ];

  extraPlugins = with pkgs.vimPlugins; [
    roslyn-nvim
  ];

  extraConfigLua =
    #lua
    ''
      require('roslyn').setup {
        exe = 'Microsoft.CodeAnalysis.LanguageServer'
      }
    '';
}
