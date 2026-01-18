local s_k={
	"nvzone/showkeys",
	event="VeryLazy",
	cmd="ShowkeysToggle",
	opts={
		position="bottom-right",
		maxkeys=5,
	},

	config=function()
		vim.keymap.set("n","<leader>tk",":ShowkeysToggle<CR>",{desc="Toggle Show Keys"})
	end,

	init=function()
		require("showkeys").toggle()
	end,
}

return s_k
