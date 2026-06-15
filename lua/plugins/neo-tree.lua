return {
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
            "nvim-tree/nvim-web-devicons",
        },
        opts = {
            enable_git_status = true,

            default_component_configs = {
                git_status = {
                    symbols = {
                        added     = "A",
                        modified  = "M",
                        deleted   = "D",
                        renamed   = "R",
                        untracked = "U",
                        ignored   = "I",
                        unstaged  = "*",
                        staged    = "✓",
                        conflict  = "!",
                    },
                },
            },
        }  
    },
}
