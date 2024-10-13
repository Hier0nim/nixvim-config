{ pkgs, ... }:

let
  roslyn-nvim = pkgs.vimUtils.buildVimPlugin {
    pname = "roslyn-nvim";
    version = "2024-02-27";
    src = pkgs.fetchgit {
      url = "https://github.com/jasonpanosso/roslyn.nvim";
      rev = "4afa375b57b0ea9e94d5a14e53c6a845332e6759";
      hash = "sha256-3qXMAmyGhgQ+mOYk64SNX1f1YEPreRjop9/JLCyQiPM=";
    };
  };
in
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

  extraPlugins = [ roslyn-nvim ];

  extraConfigLua =
    #lua
    ''
      local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
      capabilities = vim.tbl_deep_extend('force', capabilities, {
        workspace = {
          didChangeWatchedFiles = {
            dynamicRegistration = false,
          },
        },
      })

      require("roslyn").setup({
          on_attach = function() end,
          capabilities = capabilities,
      })
    '';
}
