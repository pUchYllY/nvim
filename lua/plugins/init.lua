local plugins={}

require("plugins.colorscheme")
require("plugins.telescope")
require("plugins.treesitter")
require("plugins.neotree")
require("plugins.lualine")
require("plugins.lsp-config")
require("plugins.telescope-ui")
require("plugins.none-ls")
require("plugins.alpha")
--require("plugins.completions")
require("plugins.debugging")
require("plugins.ai")
require("plugins.auto-indent")
require("plugins.auto-pairs")
require("plugins.avante")
require("plugins.blink")
require("plugins.formatting")
require("plugins.file-manager")
require("plugins.gitsigns")
require("plugins.icons")
require("plugins.mini_ai")
require("plugins.show-keys")
require("plugins.which-keys")

return plugins

--[[
    {

        function safe_extend(dest, src, name)
            if type(src) == "table" then
                vim.list_extend(dest, src)
            else
                print('Warning: plugin module ' .. name .. ' did not return a table')
            end,
        end,

        

        -- importa le singole liste plugin
        colorscheme = require("colorscheme"),
        telescope = require("telescope"),
        treesitter = require("treesitter",),
        neotree = require("neotree"),

        -- unisci le tabelle in plugins
        safe_extend(plugins, colorscheme, "colorscheme"),
        safe_extend(plugins, telescope, "telescope"),
        safe_extend(plugins, treesitter, "treesitter"),
        safe_extend(plugins, neotree, "neotree"),
        
    }
    
--]]
--}
