
require("catppuccin").setup({
  flavour = "mocha", -- latte, frappe, macchiato, mocha
  transparent_background = false,
  integrations = {
    treesitter = true,
    native_lsp = {
      enabled = true,
    },
    lualine = true,
    telescope = true,
    nvimtree = true,
  },
})

vim.cmd.colorscheme "catppuccin"
