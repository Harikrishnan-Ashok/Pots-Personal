-- lua/plugins/cmp.lua
return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
  },
  config = function()
    local cmp = require("cmp")

    cmp.setup({
      -- no snippets
      snippet = {
        expand = function() end,
      },
			window = {
        documentation = {
          border = {'╭', '─', '╮', '│', '╯', '─', '╰', '│'},
        },
        completion = {
          border = {'┌', '─', '┐', '│', '┘', '─', '└', '│'},
        }

      },
      mapping = {
        -- navigation
        ["<Down>"] = cmp.mapping.select_next_item(),
        ["<Up>"]   = cmp.mapping.select_prev_item(),
        ["j"]      = cmp.mapping.select_next_item(),
        ["k"]      = cmp.mapping.select_prev_item(),

        -- open menu
        ["<C-Space>"] = cmp.mapping.complete(),

        -- close
        ["<C-e>"] = cmp.mapping.abort(),

        -- confirm with Tab
        ["<Tab>"] = cmp.mapping.confirm({ select = true }),
      },

      sources = cmp.config.sources({
        { name = "nvim_lsp" },
      }, {
        { name = "buffer" },
        { name = "path" },
      }),
    })
  end,
}
