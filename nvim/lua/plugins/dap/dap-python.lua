return {
    {
        "mfussenegger/nvim-dap-python",
        keys = {
            { "<leader>dPt", function() require('dap-python').test_method() end, desc = "Debug Method" },
            { "<leader>dPc", function() require('dap-python').test_class() end,  desc = "Debug Class" },
            {
                "<leader>dA",
                function()
                    local args_str = vim.fn.input("Args: ")
                    local args = {}
                    for arg in args_str:gmatch("%S+") do
                        table.insert(args, arg)
                    end

                    -- Assuming the first configuration in the list is the one you want to modify
                    require('dap').configurations.python[1].args = args
                end,
                desc = "Set args for DAP"
            },
        },
        config = function()
            require('dap-python').setup('~/.virtualenvs/debugpy/bin/python')
        end,
    }
}
