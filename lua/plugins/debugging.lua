local d={
    -- NOTE: Yes, you can install new plugins here!
    "mfussenegger/nvim-dap",
    -- NOTE: And you can specify dependencies as well
    dependencies = {
        -- Creates a beautiful debugger UI
        "rcarriga/nvim-dap-ui",

        -- Required dependency for nvim-dap-ui
        "nvim-neotest/nvim-nio",
        "theHamsta/nvim-dap-virtual-text",

        -- Installs the debug adapters for you
        "mason-org/mason.nvim",
        --'jay-babu/mason-nvim-dap.nvim',
    },

    config = function()
        local dap = require("dap")
        local dapui = require("dapui")

        --[[
        require("mason-nvim-dap").setup({
            -- Makes a best effort to setup the various debuggers with
            -- reasonable debug configurations
            automatic_installation = true,

            -- You can provide additional configuration to the handlers,
            -- see mason-nvim-dap README for more information
            handlers = {},

            -- You'll need to check that you have the required things installed
            -- online, please don't ask me how to install them :)
            ensure_installed = {
                -- Update this to ensure that you have the debuggers for the langs you want
            },
        })
        --]]

        -- dapUI setup
        dapui.setup({
            controls = {
                element = "repl",
                enabled = true,
                icons = {
                    disconnect = "",
                    pause = "",
                    play = "",
                    run_last = "",
                    step_back = "",
                    step_into = "",
                    step_out = "",
                    step_over = "",
                    terminate = ""
                }
            },
            element_mappings = {},
            expand_lines = true,
            floating = {
                border = "single",
                mappings = {
                    close = { "q", "<Esc>" }
                }
            },
            force_buffers = true,
            icons = {
                collapsed = "",
                current_frame = "",
                expanded = ""
            },
            layouts = { 
                {
                    elements = { 
                        {
                            id = "scopes",
                            size = 0.25
                        }, 
                        {
                            id = "breakpoints",
                            size = 0.25
                        }, 
                        {
                            id = "stacks",
                            size = 0.25
                        }, 
                        {
                            id = "watches",
                            size = 0.25
                        } 
                    },
                    position = "left",
                    size = 40
                }, 
                {
                    elements = { 
                        {
                            id = "repl",
                            size = 0.5
                        }, 
                        {
                            id = "console",
                            size = 0.5
                        },
                    },
                    position = "bottom",
                    size = 10
                } 
            },
            mappings = {
                edit = "e",
                expand = { "<CR>", "<2-LeftMouse>" },
                open = "o",
                remove = "d",
                repl = "r",
                toggle = "t"
            },
            render = {
                indent = 1,
                max_value_lines = 100
            }
        })

        -- enable nvim-dap virtual text setup
        require("nvim-dap-virtual-text").setup({})

        --[[ Change breakpoint icons
        vim.api.nvim_set_hl(0, 'DapBreak', { fg = '#e51400' })
        vim.api.nvim_set_hl(0, 'DapStop', { fg = '#ffcc00' })
        local breakpoint_icons = vim.g.have_nerd_font
        and { Breakpoint = '', BreakpointCondition = '', BreakpointRejected = '', LogPoint = '', Stopped = '' }
        or { Breakpoint = '●', BreakpointCondition = '⊜', BreakpointRejected = '⊘', LogPoint = '◆', Stopped = '⭔' }
        for type, icon in pairs(breakpoint_icons) do
            local tp = 'Dap' .. type
            local hl = (type == 'Stopped') and 'DapStop' or 'DapBreak'
            vim.fn.sign_define(tp, { text = icon, texthl = hl, numhl = hl })
        end
        --]]

        dap.listeners.after.event_initialized.dapui_config = dapui.open
        --dap.listeners.before.event_terminated.dapui_config = dapui.close
        --dap.listeners.before.event_exited.dapui_config = dapui.close

        -- keymap per dap
        vim.keymap.set('n', '<leader>dt', dap.toggle_breakpoint, {desc="Toggle Breakpoint"})
        vim.keymap.set('n', '<leader>dc', dap.continue, {desc="Continue"})
        vim.keymap.set('n', '<leader>dB', dap.set_breakpoint, {desc="Set Breakpoint"})
        -- vim.keymap.set('n', '<leader>dlp', function() dap.set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end, {desc="?"})

        -- keymap per spostamento in debugging
        vim.keymap.set("n","<leader>sl",dap.step_over, {desc="Step Over"})
        vim.keymap.set("n","<leader>sj",dap.step_into, {desc="Step Into"})
        vim.keymap.set("n","<leader>sk",dap.step_out, {desc="Step Out"})
        -- vim.keymap.set("n","<leader>dsl",dap.step_last, {desc="Step Last"})
        vim.keymap.set("", "<leader>sb", dap.step_back, {desc="Step Back"})

        -- keymap per dapUI
        vim.keymap.set("n", "<leader>duo", dapui.open, {desc="Open User Interface"})
        vim.keymap.set("n", "<leader>duc", dapui.close, {desc="Close User Interface"})

        -- debugger adapters
        --installazione adapter codelldb C/C++    
        dap.adapters.codelldb={
            type="executable",    
            command="/home/antonio/.local/share/nvim/mason/bin/codelldb",

            -- On windows you may have to uncomment this:
            -- detached = false,
        }

        -- language confifurations
        -- C++
        dap.configurations.cpp={
            {
                name = "Launch file",
                type = "codelldb",
                request = "launch",
                program = function()
                    return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
                end,
                cwd = '${workspaceFolder}',
                stopOnEntry = false,
            },
        }
        -- C
        dap.configurations.c=dap.configurations.cpp
        
        -- Rust
        dap.configurations.rust=dap.configurations.cpp

    end
}

return d
