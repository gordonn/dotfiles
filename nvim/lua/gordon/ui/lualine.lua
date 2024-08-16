return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local lualine = require("lualine")
    -- local lazy_status = require("lazy.status") -- to configure lazy pending updates count

    local colors = {
      blue = "#83a598",
      green = "#b8bb26",
      violet = "#d3869b",
      yellow = "#fabd2f",
      red = "#fb4934",
      fg = "#ebdbb2",
      bg = "#282828",
      inactive_bg = "#282828",
      seperator = "#3c3836",
    }

    local my_lualine_theme = {
      normal = {
        a = { bg = colors.blue, fg = colors.bg, gui = "bold" },
        b = { bg = colors.seperator, fg = colors.fg },
        c = { bg = "NONE", fg = colors.fg },
      },
      insert = {
        a = { bg = colors.green, fg = colors.bg, gui = "bold" },
        b = { bg = colors.seperator, fg = colors.fg },
        c = { bg = "NONE", fg = colors.fg },
      },
      visual = {
        a = { bg = colors.violet, fg = colors.bg, gui = "bold" },
        b = { bg = colors.seperator, fg = colors.fg },
        c = { bg = "NONE", fg = colors.fg },
      },
      command = {
        a = { bg = colors.yellow, fg = colors.bg, gui = "bold" },
        b = { bg = colors.seperator, fg = colors.fg },
        c = { bg = "NONE", fg = colors.fg },
      },
      replace = {
        a = { bg = colors.red, fg = colors.bg, gui = "bold" },
        b = { bg = colors.seperator, fg = colors.fg },
        c = { bg = "NONE", fg = colors.fg },
      },
      inactive = {
        a = { bg = "NONE", fg = colors.semilightgray, gui = "bold" },
        b = { bg = colors.seperator, fg = colors.semilightgray },
        c = { bg = "NONE", fg = colors.semilightgray },
      },
    }

    -- configure lualine with modified theme
    lualine.setup({
      options = {
        theme = my_lualine_theme,
        globalstatus = true,
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
      },

      sections = {
        lualine_x = { "filetype" },
        lualine_b = { "branch" },
      },
    })
  end,
}
