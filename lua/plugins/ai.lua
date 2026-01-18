local ai={
	"Exafunction/windsurf.nvim",
	event="VeryLazy",
	dependencies={
		"nvim-lua/plenary.nvim",
		"saghem/blink.cmp",
	},

	config=function()
		require("codeium").setup({
			enable_cmp_source=false,
			virtual_text={
				enabled=true
			},
			workspace_root={
				use_lsp=true
			},
		})

		-- Mappings codeium
		vim.keymap.set("n","<leader><S-c>",":Codeium Toggle")
		vim.keymap.set("n","<leader>ca",":Codeium Auth",{desc="Log/Register your Codeium Acccount"})
		vim.keymap.set("n","<leader>cc",":Codeium Chat",{desc="[C]hat with [C]odeeium"})
	end
}

return ai
