{
  plugins = {
    cmp-emoji = {
      enable = true;
    };
    cmp = {
      enable = true;
      settings = {
        autoEnableSources = true;
        experimental = {
          ghost_text = false;
        };
        performance = {
          debounce = 60;
          fetchingTimeout = 200;
          maxViewEntries = 30;
        };
        snippet = {
          expand =
            #lua
            ''
              function(args)
                require('luasnip').lsp_expand(args.body)
              end
            '';
        };
        formatting = {
          fields = [
            "kind"
            "abbr"
            "menu"
          ];
        };
        sources = [
          { name = "git"; }
          { name = "nvim_lsp"; }
          { name = "emoji"; }
          {
            name = "buffer"; # text within current buffer
            option.get_bufnrs.__raw = "vim.api.nvim_list_bufs";
            keywordLength = 3;
          }
          {
            name = "copilot";
            group_index = 0;
            priority = 100;
          }
          {
            name = "path"; # file system paths
            keywordLength = 3;
          }
          {
            name = "luasnip"; # snippets
            keywordLength = 3;
          }
        ];

        # See :help nvim_open_win()
        window = {
          completion = {
            border = "single";
          };
          documentation = {
            border = "single";
          };
        };

        completion = {
          completeopt = "menu,menuone,noinsert";
        };

        mapping = {
          # Select the [n]ext item
          "<C-n>" = "cmp.mapping.select_next_item()";
          # Select the [p]revious item
          "<C-p>" = "cmp.mapping.select_prev_item()";

          # Scroll the documentation window [b]ack / [f]orward
          "<C-b>" = "cmp.mapping.scroll_docs(-4)";
          "<C-f>" = "cmp.mapping.scroll_docs(4)";

          # Accept ([y]es) the completion.
          #  This will auto-import if your LSP supports it.
          #  This will expand snippets if the LSP sent a snippet.
          "<C-y>" = "cmp.mapping.confirm { select = true }";

          # Manually trigger a completion from nvim-cmp.
          #  Generally you don't need this, because nvim-cmp will display
          #  completions whenever it has completion options available.
          "<C-Space>" = "cmp.mapping.complete {}";

          # Think of <c-l> as moving to the right of your snippet expansion.
          #  So if you have a snippet that's like:
          #  function $name($args)
          #    $body
          #  end
          #
          # <c-l> will move you to the right of the expansion locations.
          # <c-h> is similar, except moving you backwards.
          "<C-l>" = ''
            cmp.mapping(function()
              if luasnip.expand_or_locally_jumpable() then
                luasnip.expand_or_jump()
              end
            end, { 'i', 's' })
          '';
          "<C-h>" = ''
            cmp.mapping(function()
              if luasnip.locally_jumpable(-1) then
                luasnip.jump(-1)
              end
            end, { 'i', 's' })
          '';

          # For more advanced Luasnip keymaps (e.g. selecting choice nodes, expansion) see:
          #    https://github.com/L3MON4D3/LuaSnip?tab=readme-ov-file#keymaps
        };
      };
    };

    # lsp
    cmp-nvim-lsp = {
      enable = true;
    };
    cmp-buffer = {
      enable = true;
    };
    # file system paths
    cmp-path = {
      enable = true;
    };

    # snippets
    cmp_luasnip = {
      enable = true;
    };

    # autocomplete for cmdline
    cmp-cmdline = {
      enable = false;
    };
  };
  extraConfigLua = ''
    luasnip = require("luasnip")
    kind_icons = {
    	Text = "󰊄",
    	Method = " ",
    	Function = "󰡱 ",
    	Constructor = " ",
    	Field = " ",
    	Variable = "󱀍 ",
    	Class = " ",
    	Interface = " ",
    	Module = "󰕳 ",
    	Property = " ",
    	Unit = " ",
    	Value = " ",
    	Enum = " ",
    	Keyword = " ",
    	Snippet = " ",
    	Color = " ",
    	File = "",
    	Reference = " ",
    	Folder = " ",
    	EnumMember = " ",
    	Constant = " ",
    	Struct = " ",
    	Event = " ",
    	Operator = " ",
    	TypeParameter = " ",
    }

    local cmp = require("cmp")

    -- Based on https://github.com/hrsh7th/cmp-cmdline/issues/108#issuecomment-2052449375
    -- C-n/C-p cycle through completions if a character has been typed and through
    -- command history if not (from https://www.reddit.com/r/neovim/comments/v5pfmy/comment/ibb61w3/)
    local cmd_mapping = {
      ["<C-Space>"] = { c = cmp.mapping.complete({}) },
      ["<C-n>"] = { c = cmp.mapping.select_next_item() },
      ["<C-p>"] = { c = cmp.mapping.select_prev_item() },
      ["<C-e>"] = { c = cmp.mapping.abort() },
      ["<C-y>"] = {
        c = cmp.mapping.confirm({
          behavior = cmp.ConfirmBehavior.Insert,
          select = true,
        }),
      },
    }

    -- Set configuration for specific filetype.
    cmp.setup.filetype("gitcommit", {
    	sources = cmp.config.sources({
    		{ name = "cmp_git" }, -- You can specify the `cmp_git` source if you were installed it.
    	}, {
    		{ name = "buffer" },
    	}),
    })

    -- Use buffer source for `/` and `?`
    cmp.setup.cmdline({ "/", "?" }, {
      mapping = cmd_mapping,
      sources = {
        { name = "buffer" },
      },
    })

    -- Use cmdline & path source for ':'
    cmp.setup.cmdline(":", {
      mapping = cmd_mapping,
      sources = cmp.config.sources({
        { name = "path" },
      }, {
        { name = "cmdline" },
      }),
    })
  '';
}
