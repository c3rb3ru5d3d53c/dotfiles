return {
  updater = {
    remote = "origin", 
    channel = "stable", 
    version = "latest", 
    branch = "nightly", 
    commit = nil, 
    pin_plugins = nil, 
    skip_prompts = false, 
    show_changelog = true, 
    auto_quit = false, 
    remotes = {},
  },

  
  colorscheme = "astrodark",

  
  diagnostics = {
    virtual_text = true,
    underline = true,
  },

  lsp = {
    
    formatting = {
      
      format_on_save = {
        enabled = true, 
        allow_filetypes = { 
          
        },
        ignore_filetypes = { 
          
        },
      },
      disabled = { 
        
        
      },
      timeout_ms = 1000, 
    },
    servers = {
      "pyright", "yls", "clangd"
    },
  },
  lazy = {
    defaults = { lazy = true },
    performance = {
      rtp = {
        disabled_plugins = { "tohtml", "gzip", "matchit", "zipPlugin", "netrwPlugin", "tarPlugin"},
      },
    },
  },
  icons = {
    VimIcon = "",
    ScrollText = "",
    GitBranch = "",
    GitAdd = "",
    GitChange = "",
    GitDelete = "",
  },
  heirline = {
    separators = {
      none = { "", "" },
      left = { "", "  " },
      right = { "  ", "" },
      center = { "  ", "  " },
      tab = { "", " " },
      breadcrumbs = "  ",
      path = "  ",
    },
    colors = {
      bg = '#000000',
      fg = '#ffffff',
      section_bg = '#000000',
    },
    attributes = {
      buffer_active = { bold = true, italic = true },
      buffer_picker = { bold = true },
      macro_recording = { bold = true },
      git_branch = { bold = true },
      git_diff = { bold = true },
    },
    icon_highlights = {
      breadcrumbs = false,
      file_icon = {
        tabline = function(self) return self.is_active or self.is_visible end,
        statusline = true,
        winbar = false,
      },
    },
  },
  plugins = {
    {
      "rebelot/heirline.nvim",
      opts = function(_, opts)
        local status = require("astronvim.utils.status")
        opts.statusline = { 
          hl = { fg = "fg", bg = "bg" },
          status.component.mode { mode_text = { padding = { left = 1, right = 1 } } },
          status.component.git_branch(),
          status.component.file_info { filetype = {}, filename = false, file_modified = false },
          status.component.git_diff(),
          status.component.diagnostics(),
          status.component.fill(),
          status.component.cmd_info(),
          status.component.fill(),
          status.component.lsp(),
          status.component.treesitter(),
          status.component.nav(),
        }
        return opts
      end,
    },
  },
  polish = function()
    vim.api.nvim_command(':set showtabline=0')
    vim.api.nvim_command(':set wrap')
    vim.api.nvim_command(':set nornu')
  end,
}
