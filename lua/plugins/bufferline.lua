return {
  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    opts = {
      options = {
        offsets = {
          {
            filetype = "neo-tree",
            text = function()
              return vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
            end,
            highlight = "Directory",
            text_align = "center",
            separator = true,
          },
          highlights = {
            separator = {
              fg = '#ffffff',
            },
            buffer_selected = {
              bold = true,
              italic = false,
            },
            -- separator_selected = {},
            -- tab_selected = {},
            -- background = {},
            -- indicator_selected = {},
            -- fill = {},
          },
        },
      },
    },
  },
}
