-- Sovrascrittura per l'estensione 'Python'
vim.api.nvim_create_autocmd({"BufRead","BufNewFile"}, {
	-- Il pattern 'mmd' fa scattare questo comando solo per i file .lua
	pattern="*.py",
	callback = function()
		vim.bo.filetype="python" -- forza l'identazione visiva e digitale del tab sui file mermaid
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

		-- This macro inserts a block of function with a return
		vim.keymap.set("i","<c-r>",function() require("commands.keymaps.function_block").pythonReturn_function_block() end,{expr=true,desc=""})

		-- This macro inserts a block of process function
		vim.keymap.set("i","<c-f>",function() require("commands.keymaps.function_block").pythonPass_function_block() end,{expr=true,desc=""})

		-- This macro inserts a block of instance return function
		vim.keymap.set("i","<c-l>",function() require("commands.keymaps.function_block").pythonClassReturn_function_block() end,{expr=true,desc=""})
	end,
	desc = "Forza indentazione a 4 spazi per Python",
})

