return {
  {
    "Mofiqul/vscode.nvim",
    priority = 1000,
    config = function()
      require("vscode").setup({
        transparent = true,
      })

      vim.cmd.colorscheme("vscode")
    end,
  },
}
