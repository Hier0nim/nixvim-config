{ pkgs, ... }:
{
  extraPlugins = with pkgs.vimPlugins; [
    nabla-nvim
  ];

  extraConfigLua = ''
    vim.api.nvim_set_keymap("n", "<leader>nv", ":Nabla<CR>", { desc = "Toggle Nabla", noremap = true, silent = true })

    vim.cmd([[
      command! Nabla lua require("nabla").toggle_virt()
    ]])'';
}
