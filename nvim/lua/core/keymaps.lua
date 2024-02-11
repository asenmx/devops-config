-- Utility function to set key mappings with description
local function opts(desc)
    return { noremap = true, silent = true, desc = desc }
end

-- Set the leader key to space
vim.g.mapleader = " "

-- Open netrw file explorer
vim.keymap.set("n", "<leader>vv", vim.cmd.Ex, opts("Open netrw file explorer"))

-- Makes the space key do nothing in normal and visual modes
vim.keymap.set({ "n", "v" }, "<leader>", "<Nop>", opts("Disable Space in normal and visual mode"))

-- Move selected lines down in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", opts("Move selected lines down in visual mode"))

-- Move selected lines up in visual mode
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", opts("Move selected lines up in visual mode"))

-- Join lines and restore cursor position in normal mode
vim.keymap.set("n", "J", "mzJ`z", opts("Join lines and restore cursor position"))

-- Scroll down and center in normal mode
vim.keymap.set("n", "<C-d>", "<C-d>zz", opts("Scroll down and center screen"))

-- Scroll up and center in normal mode
vim.keymap.set("n", "<C-u>", "<C-u>zz", opts("Scroll up and center screen"))

-- Search next and center in normal mode
vim.keymap.set("n", "n", "nzzzv", opts("Search next and center screen"))

-- Search previous and center in normal mode
vim.keymap.set("n", "N", "Nzzzv", opts("Search previous and center screen"))

-- Delete selection into black hole register in visual mode
vim.keymap.set("x", "<leader>p", [["_dP"]], opts("Delete into black hole register"))

-- Yank to clipboard in normal and visual mode
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], opts("Yank to clipboard"))

-- Yank entire line to clipboard in normal mode
vim.keymap.set("n", "<leader>Y", [["+Y]], opts("Yank entire line to clipboard"))

-- Delete into black hole register in normal and visual mode
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d"]], opts("Delete into black hole register"))

-- Use Ctrl-c to escape insert mode (not recommended)
vim.keymap.set("i", "<C-c>", "<Esc>", opts("Escape insert mode using Ctrl-c"))

-- Disable the Q key in normal mode
vim.keymap.set("n", "Q", "<nop>", opts("Disable Q in normal mode"))

-- Open a new tmux window with sessionizer
vim.keymap.set("n", "<C-f>", ":silent !tmux neww tmux-sessionizer<CR>", opts("Open new tmux window"))


-- Navigate compiler errors forward and center screen
vim.keymap.set("n", "<C-k>", ":cnext<CR>zz", opts("Navigate to next compiler error"))

-- Navigate compiler errors backward and center screen
vim.keymap.set("n", "<C-j>", ":cprev<CR>zz", opts("Navigate to previous compiler error"))

-- Search and replace the word under cursor globally (interactive)
vim.keymap.set(
    "n",
    "<leader>s",
    [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
    opts("Search and replace word under cursor")
)

-- Make the current file executable
vim.keymap.set("n", "<leader>x", ":!chmod +x %<CR>", opts("Make file executable"))

-- Toggle Undotree
vim.keymap.set("n", "<Leader>u", ":UndotreeToggle<CR>", opts("Toggle Undotree"))


-- Disable arrows
vim.keymap.set({ 'n', 'i' }, '<Up>', '<Nop>', { noremap = true, silent = true })
vim.keymap.set({ 'n', 'i' }, '<Down>', '<Nop>', { noremap = true, silent = true })
vim.keymap.set({ 'n', 'i' }, '<Left>', '<Nop>', { noremap = true, silent = true })
vim.keymap.set({ 'n', 'i' }, '<Right>', '<Nop>', { noremap = true, silent = true })


-- -- LSP Keymaps
-- vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts("LSP: Go to declaration"))
-- vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts("LSP: Go to definition"))
-- vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts("LSP: Hover information"))
-- vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts("LSP: Go to implementation"))
-- vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts("LSP: Show signature help"))
-- vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, opts("LSP: Add workspace folder"))
-- vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, opts("LSP: Remove workspace folder"))
-- vim.keymap.set("n", "<leader>wl", vim.lsp.buf.list_workspace_folders, opts("LSP: List workspace folders"))
-- vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, opts("LSP: Go to type definition"))
-- vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts("LSP: Rename symbol"))
-- vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts("LSP: Code actions"))
-- vim.keymap.set('n', '<leader>gr', vim.lsp.buf.references, opts("LSP: List references"))
-- vim.keymap.set('n', '<leader>ge', vim.diagnostic.open_float, opts("Diagnostics: Open floating window"))
-- vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts("Diagnostics: Go to previous diagnostic"))
-- vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts("Diagnostics: Go to next diagnostic"))
-- vim.keymap.set('n', '<leader>gq', vim.diagnostic.setloclist, opts("Diagnostics: Set to location list"))
-- vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts("LSP: Workspace symbols"))
-- vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, opts("LSP: Format buffer"))

-- Better window movement
vim.keymap.set("n", "<C-h>", "<C-w>h", opts("Move to left split"))
vim.keymap.set("n", "<C-j>", "<C-w>j", opts("Move to bottom split"))
vim.keymap.set("n", "<C-k>", "<C-w>k", opts("Move to top split"))
vim.keymap.set("n", "<C-l>", "<C-w>l", opts("Move to right split")) -- Open terminal in the directory of the current file

function OpenTerminal()
    local cwd = vim.fn.expand("%:p:h")
    os.execute("alacritty --working-directory " .. cwd .. " & disown")
end

vim.keymap.set("n", "<leader><Cr>", OpenTerminal, opts("Open terminal in current file directory"))

-- local rust_tools = _G.rust_tools or false
-- if rust_tools then
--     vim.keymap.set(
--         "n",
--         "<leader>vca",
--         require("rust-tools").code_action_group.code_action_group,
--         opts("LSP: Code action")
--     )
--     vim.keymap.set("n", "K", require("rust-tools").hover_actions.hover_actions, opts("LSP: Hover"))
-- else
--     vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action, opts("LSP: Code action"))
--     vim.keymap.set("n", "K", vim.lsp.buf.hover, opts("LSP: Hover"))
-- end
