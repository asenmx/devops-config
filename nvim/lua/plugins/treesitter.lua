return { {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
        {
            "nvim-treesitter/nvim-treesitter-textobjects",
        },
    },
    config = function()
        require 'nvim-treesitter'.setup {
            -- A list of parser names, or "all" (the five listed parsers should always be installed)
            ensure_installed = {
                "bash",
                "c",
                "html",
                "javascript",
                "jsdoc",
                "json",
                "lua",
                "luadoc",
                "luap",
                "markdown",
                "markdown_inline",
                "python",
                "query",
                "regex",
                "tsx",
                "typescript",
                "vim",
                "vimdoc",
                "yaml",
                "ninja",
                "rst",
                "toml",

            },
            -- Install parsers synchronously (only applied to `ensure_installed`)
            sync_install = false,

            keymaps = {
                init_selection = "gnn",
                node_incremental = "grn",
                scope_incremental = "grc",
                node_decremental = "grma",
                ["ak"] = { query = "@block.outer", desc = "around block" },
                ["ik"] = { query = "@block.inner", desc = "inside block" },
                ["ac"] = { query = "@class.outer", desc = "around class" },
                ["ic"] = { query = "@class.inner", desc = "inside class" },
                ["a?"] = { query = "@conditional.outer", desc = "around conditional" },
                ["i?"] = { query = "@conditional.inner", desc = "inside conditional" },
                ["af"] = { query = "@function.outer", desc = "around function " },
                ["if"] = { query = "@function.inner", desc = "inside function " },
                ["al"] = { query = "@loop.outer", desc = "around loop" },
                ["il"] = { query = "@loop.inner", desc = "inside loop" },
                ["aa"] = { query = "@parameter.outer", desc = "around argument" },
                ["ia"] = { query = "@parameter.inner", desc = "inside argument" },
            },
            move = {
                enable = true,
                set_jumps = true,
                goto_next_start = {
                    ["]k"] = { query = "@block.outer", desc = "Next block start" },
                    ["]f"] = { query = "@function.outer", desc = "Next function start" },
                    ["]a"] = { query = "@parameter.inner", desc = "Next argument start" },
                },
                goto_next_end = {
                    ["]K"] = { query = "@block.outer", desc = "Next block end" },
                    ["]F"] = { query = "@function.outer", desc = "Next function end" },
                    ["]A"] = { query = "@parameter.inner", desc = "Next argument end" },
                },
                goto_previous_start = {
                    ["[k"] = { query = "@block.outer", desc = "Previous block start" },
                    ["[f"] = { query = "@function.outer", desc = "Previous function start" },
                    ["[a"] = { query = "@parameter.inner", desc = "Previous argument start" },
                },
                goto_previous_end = {
                    ["[K"] = { query = "@block.outer", desc = "Previous block end" },
                    ["[F"] = { query = "@function.outer", desc = "Previous function end" },
                    ["[A"] = { query = "@parameter.inner", desc = "Previous argument end" },
                },
            },
                 swap = {
      enable = true,
      swap_next = {
        [">K"] = { query = "@block.outer", desc = "Swap next block" },
        [">F"] = { query = "@function.outer", desc = "Swap next function" },
        [">A"] = { query = "@parameter.inner", desc = "Swap next argument" },
      },
      swap_previous = {
        ["<K"] = { query = "@block.outer", desc = "Swap previous block" },
        ["<F"] = { query = "@function.outer", desc = "Swap previous function" },
        ["<A"] = { query = "@parameter.inner", desc = "Swap previous argument" },
      },},
            -- Automatically install missing parsers when entering buffer
            -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
            auto_install = true,

            -- List of parsers to ignore installing (or "all")
            ignore_install = { "javascript" },

            ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
            -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

            highlight = {
                enable = true,

                -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
                -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
                -- the name of the parser)
                -- list of language that will be disabled
                disable = { "c", "rust" },
                -- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
                disable = function(lang, buf)
                    local max_filesize = 100 * 1024 -- 100 KB
                    local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
                    if ok and stats and stats.size > max_filesize then
                        return true
                    end
                end,

                -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
                -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
                -- Using this option may slow down your editor, and you may see some duplicate highlights.
                -- Instead of true it can also be a list of languages
                additional_vim_regex_highlighting = false,
            },
        }
    end

}
}
