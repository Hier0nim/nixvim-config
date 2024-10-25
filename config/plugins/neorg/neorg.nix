{
  plugins.neorg = {
    enable = true;
    modules = {
      "core.defaults" = {
        __empty = null;
      };
      "core.concealer" = {
        __empty = null;
      };
      "core.dirman" = {
        config = {
          default_workspace = "notes";
          workspaces = {
            notes = "~/SecondBrain";
          };
        };
      };
    };
  };

  keymaps = [
    {
      key = "<leader>ni";
      action = "<CMD>Neorg index<CR>";
      options = {
        desc = "Index";
      };
    }
    {
      key = "<leader>nr";
      action = "<CMD>Neorg return<CR>";
      options = {
        desc = "Return";
      };
    }
  ];

  extraConfigLua = ''
    vim.api.nvim_create_autocmd("FileType", {
    	pattern = "norg",
    	callback = function()
    		vim.api.nvim_buf_set_keymap(
    			0,
    			"n",
    			"<leader>nt",
    			"<CMD>Neorg journal today<CR>",
    			{ desc = "Todays's Journal", noremap = true, silent = true }
    		)
    		vim.api.nvim_buf_set_keymap(
    			0,
    			"n",
    			"<leader>nc",
    			"<CMD>Neorg toggle-concealer<CR>",
    			{ desc = "Toggle Concealer", noremap = true, silent = true }
    		)
    	end,
    })
  '';
}
