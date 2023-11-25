local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<leader>fs"] = { ":w <CR>", "Save File" , opts = { nowait = true }},
    ["<leader>jw"] = { ":HopWord <CR>", "Jump Word", opts = { nowait = true} },
    ["<leader>jc"] = { ":HopChar1 <CR>", "Jump Character", opts = { nowait = true } },
    ["<leader>jl"] = { ":HopLine <CR>", "Jump Line", opts = { nowait = true} },
    ["<leader>qq"] = { ":qa! <CR>", "Force Quit", opts = { nowait = true} },
    ["<leader>qs"] = { ":wqa! <CR>", "Save and Quit", opts = { nowait = true } },
  },
  v = {
    [">"] = { ">gv", "indent"},
  },
  i = {
    ["jk"] = { "<ESC>", "escape insert mode" , opts = { nowait = true }},
  }
}

return M
