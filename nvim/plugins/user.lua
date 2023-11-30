return {
  {
    "xiyaowong/transparent.nvim",
    lazy = false,
    config = function()
      require("transparent").setup({
        groups = {
          "Normal",
          "NormalNC",
          "Comment",
          "Constant",
          "Special",
          "Identifier",
          "Statement",
          "PreProc",
          "Type",
          "Underlined",
          "Todo",
          "String",
          "Function",
          "Conditional",
          "Repeat",
          "Operator",
          "Structure",
          "LineNr",
          "NonText",
          "SignColumn",
          "CursorLine",
          "CursorLineNr",
          --"StatusLine",
          --"StatusLineNC",
          "EndOfBuffer",
        },
        extra_groups = {
          "BqfPreviewFloat",
          "NormalFloat",
          "NormalNC",
          "NvimTreeNormal",
          "NeoTreeNormal",
          "NeoTreeNormalNC",
          "NeoTreePreview",
          "NeoTreeTabInactive",
          "LineNr",
          "CursorColumn",
          "CursorLine",
          "CursorLineNr",
          "FloatBorder",
          "WinBar",
          "WinBarNC",
          "TreesitterContext",
          "Pmenu",
          "DapUIPlayPause",
          "DapUIRestart",
          "DapUIStop",
          "DapUIStepOut",
          "DapUIStepBack",
          "DapUIStepInto",
          "DapUIStepOver",
          "DapUIPlayPauseNC",
          "DapUIRestartNC",
          "DapUIStopNC",
          "DapUIStepOutNC",
          "DapUIStepBackNC",
          "DapUIStepIntoNC",
          "DapUIStepOverNC",
          "SignColumn",
          --"StatusLine",
          "TelescopeBorder",
          "TelescopeNormal",
          "TelescopePreviewNormal",
          "TelescopeResultsNormal",
          "TelescopePromptNormal",
          --"TabLineFill",
          "TreesitterContextLineNumber",
          "QuickFixLine",
          "Pmenu",
          "PmenuSel",
          "PmenuSbar",
          "PmenuThumb",
          "NotifyINFOBody",
          "NotifyWARNBody",
          "NotifyERRORBody",
          "NotifyDEBUGBody",
          "NotifyTRACEBody",
          "NotifyINFOBorder",
          "NotifyWARNBorder",
          "NotifyERRORBorder",
          "NotifyDEBUGBorder",
          "NotifyTRACEBorder",
          "WhichKeyFloat",
        },
      })
    end
  },
  {
    "ziontee113/icon-picker.nvim",
    dependencies = {
      {
        "nvim-telescope/telescope-ui-select.nvim",
        lazy = false,
        config = function()
          require("telescope").setup({
            extensions = {
              ["ui-select"] = {
                require("telescope.themes").get_dropdown{}
              }
            }
          })
          require("telescope").load_extension("ui-select")
        end
      },
    },
    lazy = false,
    config = function()
      require("icon-picker").setup({
        disable_legacy_commands = true
      })
    end
  },
  {
    "ggandor/leap.nvim",
    lazy = false,
    config = function()
      require('leap').add_default_mappings()
    end
  },
  {
    "s3rvac/vim-syntax-yara",
    lazy = false,
  },
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      require("lspconfig").clangd.setup({
        cmd = {"clangd", "--background-index"},
        filetypes = {"c", "cpp", "h", "hpp"}
      })
      require("lspconfig").yls.setup({
        cmd = { "yls" },
        filetypes = { "yar", "yara" }
      })
      require("lspconfig").pyright.setup({
        cmd = { "pyright-langserver", "--stdio" },
        filetypes = { "python" },
        settings = {
          python = {
            analysis = {
              typeCheckingMode = "off",
              signatureHelp = true,
              includeSnippets = true,
              functionDocumentation = true,
            },
          },
        }
      })
    end
  },
  {
    "ray-x/lsp_signature.nvim",
    lazy = false,
    config = function ()
      require("lsp_signature").setup({
        bind = true,
        hint_enable = true,
        hint_prefix = "",
        handler_opts = {
          border = "rounded"
        }
      })
    end
  },
  {
    "David-Kunz/gen.nvim",
    lazy = false,
    config = function()
      require("gen").setup({
        model = "mistral:latest",
        display_mode = "float",
        show_prompt = false,
        show_model = false,
        no_auto_close = false,
        init = nil,
        command = "curl --silent --no-buffer -X POST http://localhost:11434/api/generate -d $body",
        list_models = "<function>",
        debug = false,
      })
    end
  }
}

