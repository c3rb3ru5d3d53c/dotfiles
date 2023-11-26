local overrides = require("custom.configs.overrides")

local plugins = {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require("custom.configs.null-ls")
        end,
      },
    },
    config = function()
      require("plugins.configs.lspconfig")
      require("custom.configs.lspconfig")
    end,
  },
  {
    "ray-x/lsp_signature.nvim",
    lazy = false,
    config = function ()
      require("custom.configs.lsp_signature")
    end
  },
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
  },
  {
    "s3rvac/vim-syntax-yara",
    lazy = false,
  },
  {
    "tpope/vim-fugitive",
    lazy = false,
  },
  {
    "NvChad/nvterm",
    lazy = false,
    config = function()
      require("custom.configs.nvterm")
    end
  },
  {
    "ggandor/leap.nvim",
    lazy = false,
    config = function()
      require("custom.configs.leap")
    end
  },
  {
    "David-Kunz/gen.nvim",
    lazy = false,
    config = function()
      require("custom.configs.gen")
    end
  },
  {
    "williamboman/mason.nvim",
    opts = overrides.mason
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },
}

return plugins
