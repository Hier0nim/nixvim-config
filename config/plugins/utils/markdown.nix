_: {
  plugins = {
    markdown-preview = {
      enable = true;
      settings = {
        browser = "librewolf";
        echo_preview_url = 1;
        port = "6969";
        preview_options = {
          disable_filename = 1;
          disable_sync_scroll = 1;
          sync_scroll_type = "middle";
        };
        theme = "dark";
      };
    };
    render-markdown = {
      enable = true;
    };
  };

  extraConfigLua = ''
    -- Setup render-markdown plugin
    require("render-markdown").setup({
    	bullet = { right_pad = 2 },
    })

    -- Add keymaps only for markdown files
    vim.api.nvim_create_autocmd("FileType", {
    	pattern = "markdown",
    	callback = function()
    		vim.api.nvim_buf_set_keymap(
    			0,
    			"n",
    			"<leader>mp",
    			"<cmd>MarkdownPreview<cr>",
    			{ desc = "Toggle Markdown Preview", noremap = true, silent = true }
    		)
    		vim.api.nvim_buf_set_keymap(
    			0,
    			"n",
    			"<leader>mr",
    			"<cmd>RenderMarkdown toggle<cr>",
    			{ desc = "Toggle Render Markdown", noremap = true, silent = true }
    		)
    	end,
    })
  '';
}
