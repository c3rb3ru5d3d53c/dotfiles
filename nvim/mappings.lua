local M = {}

M.general = {
  n = {
    ["<C-j>"] = { ":TmuxNavigateDown<CR>", "Tmux Navigate Down", opts = { nowait = true } },
    ["<C-k>"] = { ":TmuxNavigateUp<CR>", "Tmux Navigate Up", opts = { nowait = true } },
    ["<C-l>"] = { ":TmuxNavigateRight<CR>", "Tmux Navigate Right", opts = { nowait = true } },
    ["<C-h>"] = { ":TmuxNavigateLeft<CR>", "Tmux Navigate Left", opts = { nowait = true } },
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["U"] = { ":redo <CR>", "redo", opts = { nowait = true } },
    ["<leader>fs"] = { ":w <CR>", "Save File" , opts = { nowait = true }},
    ["<leader>qq"] = { ":qa! <CR>", "Force Quit", opts = { nowait = true} },
    ["<leader>qs"] = { ":wqa! <CR>", "Save and Quit", opts = { nowait = true } },
    ["<leader>qn"] = { ":q <CR>", "Normal Quit", opts = { nowait = true } },
    ["<leader>ad"] = { ":Gen Display_Response<CR>", "AI Display Response", opts = { nowait = true } },
    ["<leader>ai"] = { ":Gen Insert_Response<CR>", "AI Insert Reponse", opts = { nowait = true } },
    ["<leader>gf"] = { ":Git<CR>", "Git Fugative", opts = { nowait = true } },
    ["<leader>gd"] = { ":Gdiffsplit<CR>", "Git Diff", opts = { nowait = true } },
    ["<leader>gp"] = { ":Git push<CR>", "Git Push", opts = { nowait = true } },
    ["<leader>gc"] = { ":Git commit<CR>", "Git Commit", opts = { nowait = true } },
  },
  v = {
    [">"] = { ">gv", "indent"},
    ["<leader>qn"] = { ":q <CR>", "Normal Quit", opts = { nowait = true } },
    ["<leader>ad"] = { ":Gen Display_Response_Selection<CR>", "AI Display Response Selection", opts = { nowait = true } },
    ["<leader>ai"] = { ":Gen Insert_Response_Selection<CR>", "AI Insert Response Selection", opts = { nowait = true } },
    ["<leader>ac"] = { ":Gen Insert_Response_Code_Selection<CR>", "AI Insert Response Code Selection", opts = { nowait = true } },
    ["<leader>as"] = { ":Gen Summarize<CR>", "AI Summarize", opts = { nowait = true } },

  },
  i = {
    ["jk"] = { "<ESC>", "escape insert mode" , opts = { nowait = true }},
  }
}

return M
