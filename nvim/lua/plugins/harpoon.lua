return {
    -- {{{ Define the Harpoon lazy.vim specificaiton.

    "ThePrimeagen/harpoon",
    enabled = true,
    branch = "harpoon2",
    config = function()
        local harpoon = require("harpoon").setup()
        vim.keymap.set("n", "<leader>ha", function() harpoon:list():append() end)
        vim.keymap.set("n", "<leader>hL", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

        vim.keymap.set("n", "<leader>1", function() harpoon:list():select(1) end)
        vim.keymap.set("n", "<leader>2", function() harpoon:list():select(2) end)
        vim.keymap.set("n", "<leader>3", function() harpoon:list():select(3) end)
        vim.keymap.set("n", "<leader>4", function() harpoon:list():select(4) end)
        -- Toggle previous & next buffers stored within Harpoon list
        vim.keymap.set("n", "<leader>hh", function() harpoon:list():prev() end)
        vim.keymap.set("n", "<leader>hl", function() harpoon:list():next() end)
    end,

    -- ----------------------------------------------------------------------- }}}
}
