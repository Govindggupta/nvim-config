-- Highlight, edit, and navigate code
return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects",
  },
  config = function()
    -- The main branch no longer auto-installs parsers, so install the missing ones ourselves.
    require("nvim-treesitter").install({
      "lua",
      "python",
      "javascript",
      "typescript",
      "vimdoc",
      "vim",
      "regex",
      "terraform",
      "sql",
      "dockerfile",
      "toml",
      "json",
      "java",
      "groovy",
      "go",
      "gitignore",
      "graphql",
      "yaml",
      "make",
      "cmake",
      "markdown",
      "markdown_inline",
      "bash",
      "tsx",
      "css",
      "html",
    })

    -- Start treesitter highlighting for any filetype that has an installed parser.
    vim.api.nvim_create_autocmd("FileType", {
      callback = function(args)
        pcall(vim.treesitter.start, args.buf)
      end,
    })

    -- Use treesitter indentation only where an indents query exists.
    vim.api.nvim_create_autocmd("FileType", {
      callback = function(args)
        local ok, files = pcall(vim.treesitter.query.get_files, vim.bo[args.buf].filetype, "indents")
        if ok and #files > 0 then
          vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end
      end,
    })

    require("nvim-treesitter-textobjects").setup({
      select = { lookahead = true },
      move = { set_jumps = true },
    })

    local function select_textobject(key, query)
      vim.keymap.set({ "x", "o" }, key, function()
        require("nvim-treesitter-textobjects.select").select_textobject(query, "textobjects")
      end)
    end

    select_textobject("aa", "@parameter.outer")
    select_textobject("ia", "@parameter.inner")
    select_textobject("af", "@function.outer")
    select_textobject("if", "@function.inner")
    select_textobject("ac", "@class.outer")
    select_textobject("ic", "@class.inner")

    local function map_move(key, method, query)
      vim.keymap.set({ "n", "x", "o" }, key, function()
        require("nvim-treesitter-textobjects.move")[method](query, "textobjects")
      end)
    end

    map_move("]m", "goto_next_start", "@function.outer")
    map_move("]]", "goto_next_start", "@class.outer")
    map_move("]M", "goto_next_end", "@function.outer")
    map_move("][", "goto_next_end", "@class.outer")
    map_move("[m", "goto_previous_start", "@function.outer")
    map_move("[[", "goto_previous_start", "@class.outer")
    map_move("[M", "goto_previous_end", "@function.outer")
    map_move("[]", "goto_previous_end", "@class.outer")

    vim.keymap.set("n", "<leader>a", function()
      require("nvim-treesitter-textobjects.swap").swap_next("@parameter.inner")
    end)
    vim.keymap.set("n", "<leader>A", function()
      require("nvim-treesitter-textobjects.swap").swap_previous("@parameter.inner")
    end)

    -- Register additional file extensions
    vim.filetype.add({
      extension = {
        tf = "terraform",
        tfvars = "terraform",
        pipeline = "groovy",
        multibranch = "groovy",
      },
    })
  end,
}
