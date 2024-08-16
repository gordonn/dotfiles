return {
  "nvim-tree/nvim-tree.lua",
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function()
    local nvimtree = require("nvim-tree")

    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    nvimtree.setup({
      renderer = {
        root_folder_label = false,
        indent_markers = {
          enable = true,
        },
        icons = {
          glyphs = {
            default = " ",
            symlink = " ",
            git = {
              untracked = " ",
            },
          },
          show = {
            git = true,
            folder = true,
            file = true,
            folder_arrow = false,
          },
        },
      },
      actions = {
        open_file = {
          window_picker = {
            exclude = {
              filetype = {
                "packer",
                "qf",
              },
              buftype = {
                "terminal",
                "help",
              },
            },
          },
        },
      },
      filters = {
        exclude = { ".git", "node_modules", ".cache" },
      },
      update_focused_file = {
        enable = true,
        update_root = true,
      },
      git = {
        enable = true,
        ignore = false,
        timeout = 500,
      },
      hijack_directories = { enable = true },
      view = {
        side = "left",
        adaptive_size = true,
      },
    })

    local keymap = vim.keymap

    keymap.set("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" })
    keymap.set("n", "<leader>ef", "<cmd>NvimTreeFindFileToggle<CR>", { desc = "Toggle file explorer on current file" })
    keymap.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>", { desc = "Collapse file explorer" })
    keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", { desc = "Refresh file explorer" })
  end,
}
