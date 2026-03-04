-- Sovrascrittura per il filetype 'lua'
vim.api.nvim_create_autocmd("FileType", {
    -- Il pattern 'lua' fa scattare questo comando solo per i file .lua
    pattern={"lua",},
    callback = function()
        -- **vim.opt_local** assicura che l'impostazione sia solo per il buffer aperto
        vim.opt_local.tabstop = 4
        vim.opt_local.shiftwidth = 4
        vim.opt_local.softtabstop = 4
        vim.opt_local.expandtab = false

		vim.schedule(
			function()
				vim.opt_local.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
			end
		)

		--local function_block=require("commands.keymap.function")

		-- This macro inserts a block of function
		vim.keymap.set("i","<c-f>",function() require("commands.keymaps.function_block").lua_function_block() end,{expr=true,desc=""})
    end,
    desc = "Forza indentazione a 4 spazi per Lua",
})

