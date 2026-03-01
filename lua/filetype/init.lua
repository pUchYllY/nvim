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
		vim.keymap.set("i","<c-f>",function() require("commands.keymaps.function_block").lua_function_block() end,{desc=""})
    end,
    desc = "Forza indentazione a 4 spazi per Lua",
})

-- Sovrascrittura per l'estensione 'Mermaid'
vim.api.nvim_create_autocmd({"BufRead","BufNewFile"}, {
    -- Il pattern 'mmd' fa scattare questo comando solo per i file .lua
    pattern="*.mmd",
    callback = function()
        vim.bo.filetype="mermaid" -- forza l'identazione visiva e digitale del tab sui file mermaid
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
    end,
    desc = "Forza indentazione a 4 spazi per Mermaid",
})

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
		vim.keymap.set("i","<c-f>",function() require("commands.keymaps.function_block").pythonReturn_function_block() end,{desc=""})

		-- This macro inserts a block of process function
		vim.keymap.set("i","<c-F>",function() require("commands.keymaps.function_block").pythonPass_function_block() end,{desc=""})
    end,
    desc = "Forza indentazione a 4 spazi per Python",
})

-- Sovrascrittura per l'estensione 'Java'
vim.api.nvim_create_autocmd("FileType", {
    -- Il pattern 'java' fa scattare questo comando solo per i file .java
	pattern="java",
    callback = function()
        vim.bo.filetype="java" -- forza l'identazione visiva e digitale del tab sui file mermaid
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
		vim.keymap.set("i","<c-f>",function() require("commands.keymaps.function_block").c_cppJavaReturn_function_block() end,{desc=""})

		-- This macro inserts a block of process function
		vim.keymap.set("i","<c-F>",function() require("commands.keymaps.function_block").c_cppJavaVoid_function_block() end,{desc=""})
    end,
    desc = "Forza indentazione a 4 spazi per Python",
})
