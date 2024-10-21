{ pkgs, ... }:
{
  plugins.treesitter = {
    enable = true;
    settings = {
      indent.enable = true;
      highlight.enable = true;
    };
    folding = false;
    nixvimInjections = true;
    grammarPackages = pkgs.vimPlugins.nvim-treesitter.passthru.allGrammars ++ [
      pkgs.tree-sitter-grammars.tree-sitter-nu
    ];
  };

  extraPlugins = [
    pkgs.tree-sitter-grammars.tree-sitter-nu
  ];

  plugins.treesitter-textobjects = {
    enable = false;
    select = {
      enable = true;
      lookahead = true;
      keymaps = {
        "aa" = "@parameter.outer";
        "ia" = "@parameter.inner";
        "af" = "@function.outer";
        "if" = "@function.inner";
        "ac" = "@class.outer";
        "ic" = "@class.inner";
        "ii" = "@conditional.inner";
        "ai" = "@conditional.outer";
        "il" = "@loop.inner";
        "al" = "@loop.outer";
        "at" = "@comment.outer";
      };
    };
    move = {
      enable = true;
      gotoNextStart = {
        "]m" = "@function.outer";
        "]]" = "@class.outer";
      };
      gotoNextEnd = {
        "]M" = "@function.outer";
        "][" = "@class.outer";
      };
      gotoPreviousStart = {
        "[m" = "@function.outer";
        "[[" = "@class.outer";
      };
      gotoPreviousEnd = {
        "[M" = "@function.outer";
        "[]" = "@class.outer";
      };
    };
    swap = {
      enable = true;
      swapNext = {
        "<leader>a" = "@parameters.inner";
      };
      swapPrevious = {
        "<leader>A" = "@parameter.outer";
      };
    };
  };

  extraConfigLua =
    # lua
    ''
      do
        local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
        parser_config.nu = {
          install_info = {
            url = "${pkgs.tree-sitter-grammars.tree-sitter-nu}", -- local path or git repo
            files = {"src/parser.c"}, -- note that some parsers also require src/scanner.c or src/scanner.cc
            -- optional entries:
            --  branch = "main", -- default branch in case of git repo if different from master
            -- generate_requires_npm = false, -- if stand-alone parser without npm dependencies
            -- requires_generate_from_grammar = false, -- if folder contains pre-generated src/parser.c
          },
          filetype = "nu", -- if filetype does not match the parser name
        }
      end
    '';
}
