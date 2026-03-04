local plugins={}

require("plugins.alpha")
require("plugins.blink")
require("plugins.colorscheme")
require("plugins.gitsigns")
require("plugins.icons")
require("plugins.lsp-config")
require("plugins.lualine")
require("plugins.neotree")
require("plugins.show-keys")
require("plugins.telescope")
require("plugins.telescope-ui")
require("plugins.treesitter")
require("plugins.which-keys")

return plugins


--require("plugins.auto-pairs") -- da cancellare


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
