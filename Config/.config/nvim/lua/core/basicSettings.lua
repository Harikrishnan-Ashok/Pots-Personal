-- Set leader key to space
vim.g.mapleader = " "
-- Basic options
vim.o.number = true
vim.o.relativenumber = true
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.smarttab = true
vim.o.softtabstop = 2
vim.o.mouse = "a"
vim.opt.clipboard = { "unnamed", "unnamedplus" }
vim.o.showmode = false

-- Tab behavior for CoC (completion in insert mode)
vim.keymap.set("i", "<Tab>", function()
  if vim.fn["coc#pum#visible"]() == 1 then
    return vim.fn["coc#pum#confirm"]()
  else
    return "  "
  end
end, { expr = true, silent = true })

-- Terminal shortcut
vim.keymap.set("n", "ter", ":term<CR>i", { noremap = true, silent = true })

-- Telescope keybindings (replace <leader> with Lua-compatible mappings)
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { noremap = true, silent = true })

-- Map 'cls' in normal mode to clear search highlight
vim.keymap.set("n", "cls", ":noh<CR>", { noremap = true, silent = true })
