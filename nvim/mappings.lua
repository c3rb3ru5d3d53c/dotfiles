return {
  n = {
    ["<S-h>"] = { "0", desc = "Line Start"},
    ["<S-l>"] = { "$", desc = "Line End"},
    ["<leader>bD"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(
          function(bufnr) require("astronvim.utils.buffer").close(bufnr) end
        )
      end,
      desc = "Pick to close",
    },
    ["<leader>b"] = { name = "Buffers" },
    ["<C-j>"] = { ":TmuxNavigateDown<CR>", desc = "Tmux Navigate Down" },
    ["<C-k>"] = { ":TmuxNavigateUp<CR>", desc = "Tmux Navigate Up", },
    ["<C-l>"] = { ":TmuxNavigateRight<CR>", desc = "Tmux Navigate Right"},
    ["<C-h>"] = { ":TmuxNavigateLeft<CR>", desc = "Tmux Navigate Left"},
    ["U"] = { ":redo<CR>", desc = "Redo"}
  },
  i = {
     ["<A-i>"] = { "<cmd>IconPickerInsert emoji<CR>", desc = "Pick Icons" },
  },
  t = {},
}
