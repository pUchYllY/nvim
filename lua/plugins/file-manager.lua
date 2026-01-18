local f_man = {
	"stevearc/oil.nvim",
	---@module "oil"
	---@type oil.SetupOpts
	opts = {},
	dependencies = { { "nvim-mini/mini.icons", opts = {} } },
	keys = {
		{
			"-",
			function()
				require("oil").open_float()
			end,
			desc = "Open Parent Directory",
		}
	},
	lazy = false,
}

return f_man
