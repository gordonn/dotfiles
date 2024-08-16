local lsp_zero = require("lsp-zero")

-- lsp_attach is where you enable features that only work
-- if there is a language server active in the file
local lsp_attach = function(client, bufnr)
  lsp_zero.default_keymaps({ buffer = bufnr })
end

lsp_zero.extend_lspconfig({
  lsp_attach = lsp_attach,
})

--[[
███╗░░░███╗░█████╗░░██████╗░█████╗░███╗░░██╗
████╗░████║██╔══██╗██╔════╝██╔══██╗████╗░██║
██╔████╔██║███████║╚█████╗░██║░░██║██╔██╗██║
██║╚██╔╝██║██╔══██║░╚═══██╗██║░░██║██║╚████║
██║░╚═╝░██║██║░░██║██████╔╝╚█████╔╝██║░╚███║
╚═╝░░░░░╚═╝╚═╝░░╚═╝╚═════╝░░╚════╝░╚═╝░░╚══╝
]]

require("mason").setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗",
    },
  },
})
require("mason-lspconfig").setup({
  -- replace the language servers listed here
  -- with the ones you want to install
  ensure_installed = {
    "lua_ls",
    "clangd",
  },
  handlers = {
    function(server_name)
      require("lspconfig")[server_name].setup({})
    end,
  },
})

--[[
███╗░░██╗██╗░░░██╗██╗███╗░░░███╗░░░░░░░█████╗░███╗░░░███╗██████╗░
████╗░██║██║░░░██║██║████╗░████║░░░░░░██╔══██╗████╗░████║██╔══██╗
██╔██╗██║╚██╗░██╔╝██║██╔████╔██║█████╗██║░░╚═╝██╔████╔██║██████╔╝
██║╚████║░╚████╔╝░██║██║╚██╔╝██║╚════╝██║░░██╗██║╚██╔╝██║██╔═══╝░
██║░╚███║░░╚██╔╝░░██║██║░╚═╝░██║░░░░░░╚█████╔╝██║░╚═╝░██║██║░░░░░
╚═╝░░╚══╝░░░╚═╝░░░╚═╝╚═╝░░░░░╚═╝░░░░░░░╚════╝░╚═╝░░░░░╚═╝╚═╝░░░░░
]]

local cmp = require("cmp")

cmp.setup({
  sources = {
    { name = "nvim_lsp" },
  },
  snippet = {
    expand = function(args)
      -- You need Neovim v0.10 to use vim.snippet
      vim.snippet.expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
    ["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
    ["<C-e>"] = cmp.mapping.abort(), -- close completion window
    ["<CR>"] = cmp.mapping.confirm({ select = false }),
  }),
  formatting = {
    fields = { "abbr", "kind", "menu" },
    format = require("lspkind").cmp_format({
      mode = "symbol", -- show only symbol annotations
      maxwidth = 40, -- prevent the popup from showing more than provided characters
      ellipsis_char = "...", -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead
    }),
  },
})
