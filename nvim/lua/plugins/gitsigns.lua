return { {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
        signs = {
            add = { text = "▎" },
            change = { text = "▎" },
            delete = { text = "" },
            topdelete = { text = "" },
            changedelete = { text = "▎" },
            untracked = { text = "▎" },
        },
        on_attach = function(buffer)
            local gs = package.loaded.gitsigns

            local function map(mode, l, r, desc)
                vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc })
            end
            local function opts(desc)
                return { noremap = true, silent = true, desc = desc }
            end

            -- Gitsigns Mappings
            vim.keymap.set("n", "]h", gs.next_hunk, opts("Next Hunk"))
            vim.keymap.set("n", "[h", gs.prev_hunk, opts("Prev Hunk"))
            vim.keymap.set({ "n", "v" }, "<leader>Ghs", ":Gitsigns stage_hunk<CR>", opts("Stage Hunk"))
            vim.keymap.set({ "n", "v" }, "<leader>Ghr", ":Gitsigns reset_hunk<CR>", opts("Reset Hunk"))
            vim.keymap.set("n", "<leader>GhS", gs.stage_buffer, opts("Stage Buffer"))
            vim.keymap.set("n", "<leader>Ghu", gs.undo_stage_hunk, opts("Undo Stage Hunk"))
            vim.keymap.set("n", "<leader>GhR", gs.reset_buffer, opts("Reset Buffer"))
            vim.keymap.set("n", "<leader>Ghp", gs.preview_hunk, opts("Preview Hunk"))
            vim.keymap.set("n", "<leader>Ghb", function() gs.blame_line({ full = true }) end, opts("Blame Line"))
            vim.keymap.set("n", "<leader>Ghd", gs.diffthis, opts("Diff This"))
            vim.keymap.set("n", "<leader>GhD", function() gs.diffthis("~") end, opts("Diff This ~"))
            vim.keymap.set({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", opts("GitSigns Select Hunk"))
        end,
    },
} }
