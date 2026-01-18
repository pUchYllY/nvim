return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			"nvim-tree/nvim-web-devicons",

			-- :Neotree filesystem reveal left (or right) --> mostra il percorso file (come un albero) alla sinistra (o alla destra) del terminale
		},
		opts = {
			-- options go here
		},
		lazy = false, -- neo-tree will lazily load itself
		config = function(_, opts)
			require("neo-tree").setup(opts)
			-- [[
			-- Funzione che controlla se NeoVim è stato avviato senza file
			local function should_open_neotree()
				local argString = vim.fn.argv()[1]
				-- Return a boolean value based on two boolean conditionals:
				-- the first conditional is based on return the args number major than 0 
				-- the second conditional is based on return the buffer, as a table (array Lua); if the table has strings different to "nvim ." the return true
				-- in the the end, the overall return conditional says:

				-- "Return true if the args number major than 0 and the terminal buffer is not equal to 'nvim .' "
				return vim.fn.argc() > 0 and argString ~= "."
			end

			local function should_open_explorer()
				local argString = vim.fn.argv()[1]

				-- Return true if the args number is between to 0 and 1, and the terminal buffer is equal to "nvim ."
				return (vim.fn.argc() > 0 and vim.fn.argc() <= 1) and argString == "."
			end

			vim.api.nvim_create_autocmd("VimEnter", {
				callback = function()
					if should_open_neotree() then
						vim.cmd("Neotree show filesystem right")
						vim.cmd("wincmd h")

						--[[
						vim.defer_fn(function()
							if vim.fn.argc() == 0 then
								vim.cmd("Neotree reveal filesystem right")
								vim.cmd("wincmd h")
							end
						end,150) -- ms delay neotree
						--]]

						--[[
						vim.cmd("Neotree reveal filesystem right")

						vim.defer_fn(function()
							local bufs = vim.api.nvim_list_bufs()
							for _, buf in ipairs(bufs) do
								if vim.api.nvim_buf_get_option(buf,"buftype") == "" then
									vim.api.nvim_set_current_buf(buf)
									break
								end
							end
						end, 10)
						--]]

					elseif should_open_explorer() then
						vim.cmd.Ex()
					end
				end,
			})

			-- 3. Mappatura Facoltativa per "Toggle"
			-- Aggiungere una mappatura per aprire/chiudere l'albero è sempre utile.
			vim.keymap.set("n", "<leader>e", ":Neotree toggle filesystem right<CR>", { desc = "Toggle Neo-tree" })
		end,
	},
}
