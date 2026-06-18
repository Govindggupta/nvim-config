return {
  {
    "folke/tokyonight.nvim",
    priority = 1000,
    config = function()
      require("tokyonight").setup({
        transparent = true,
      })

      vim.cmd.colorscheme("tokyonight")


      --Transparent background Setting
      vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
      vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
      vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
      vim.api.nvim_set_hl(0, "NeoTreeNormal", { bg = "none" })
      vim.api.nvim_set_hl(0, "NeoTreeNormalNC", { bg = "none" })
      vim.api.nvim_set_hl(0, "CursorLine", { bg = "none" })

      -- Neotree line color change
      vim.api.nvim_set_hl(0, "NeoTreeWinSeparator", { fg = "#ffffff", bg = "NONE" })

      -- bufferline saparator line color change  
      vim.api.nvim_set_hl(0, "BufferLineOffsetSeparator", {fg = "#ffffff",})
    end,
  },
}
