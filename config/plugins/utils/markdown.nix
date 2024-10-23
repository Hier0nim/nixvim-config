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

  keymaps = [
    {
      mode = "n";
      key = "<leader>mp";
      action = "<cmd>MarkdownPreview<cr>";
      options = {
        desc = "Toggle Markdown Preview";
      };
    }
    {
      mode = "n";
      key = "<leader>mr";
      action = "<cmd>RenderMarkdown toggle<cr>";
      options = {
        desc = "Toggle Render Markdown";
      };
    }
  ];

  extraConfigLua = ''
    require("render-markdown").setup({
    	bullet = { right_pad = 2 },
    })
  '';
}
