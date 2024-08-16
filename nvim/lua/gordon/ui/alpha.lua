return {
  "goolord/alpha-nvim",
  event = "VimEnter",
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    dashboard.section.header.val = {
      [[██╗     ███████╗ █████╗       ██╗   ██╗██╗███╗   ███╗]],
      [[██║     ██╔════╝██╔══██╗      ██║   ██║██║████╗ ████║]],
      [[██║     █████╗  ██║  ██║█████╗╚██╗ ██╔╝██║██╔████╔██║]],
      [[██║     ██╔══╝  ██║  ██║╚════╝ ╚████╔╝ ██║██║╚██╔╝██║]],
      [[███████╗███████╗╚█████╔╝        ╚██╔╝  ██║██║ ╚═╝ ██║]],
      [[╚══════╝╚══════╝ ╚════╝          ╚═╝   ╚═╝╚═╝     ╚═╝]],
    }

    vim.cmd([[highlight MyHeaderHighlight guifg=#83a598 guibg=NONE]])
    vim.cmd([[highlight Highlight guifg=#8ec07c guibg=NONE]])

    dashboard.section.header.opts = {
      hl = "MyHeaderHighlight",
      position = "center",
    }

    dashboard.section.custom_text = {
      type = "text",
      val = "[ ━━━━━━ ❖  ━━━━━━ ]",
      opts = {
        position = "center",
        hl = "Highlight",
      },
    }

    dashboard.section.buttons.val = {
      dashboard.button("LDR ff", "   Find File", "<cmd>Telescope find_files<CR>"),
      dashboard.button("LDR wr", "󰈚   Restore Files", "<cmd>SessionRestore<CR>"),
      dashboard.button("LDR fs", "󰈭   Find Word", "<cmd>Telescope live_grep<CR>"),
    }

    dashboard.config.layout = {
      { type = "padding", val = 11 }, -- Optional padding above the header
      dashboard.section.header,
      { type = "padding", val = 2 }, -- Padding between the header and the custom text
      dashboard.section.custom_text,
      { type = "padding", val = 2 }, -- Padding between the custom text and the buttons
      dashboard.section.buttons,
      { type = "padding", val = 0 }, -- Optional padding below the buttons
    }

    -- Send config to alpha
    alpha.setup(dashboard.opts)

    -- Disable folding on alpha buffer
    vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
  end,
}
