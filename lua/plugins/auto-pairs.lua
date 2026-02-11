local a_p={

	'windwp/nvim-autopairs',
	event = "InsertEnter",

	opts = {
		enabled = function(bufnr) return true end, -- control if auto-pairs should be enabled when attaching to a buffer
		disable_filetype = { "TelescopePrompt", "spectre_panel", "snacks_picker_input" },
		disable_in_macro = true, -- disable when recording or executing a macro
		disable_in_visualblock = false, -- disable when insert after visual block mode
		disable_in_replace_mode = true,
		ignored_next_char = [=[[%w%%%'%[%"%.%`%$]]=],
		enable_moveright = true,
		enable_afterquote = true, -- add bracket pairs after quote
		enable_check_bracket_line = true, --- check bracket in same line
		enable_bracket_in_quote = true, --
		enable_abbr = false, -- trigger abbreviation
		break_undo = true, -- switch for basic rule break undo sequence
		check_ts = false,
		map_cr = true,
		map_bs = true, -- map the <BS> key
		map_c_h = false, -- Map the <C-h> key to delete a pair
		map_c_w = false, -- map <c-w> to delete a pair if possible
	},
	-- use opts = {} for passing setup options
	-- this is equivalent to setup({}) function

	config=function(_,opts)
		local npairs = require("nvim-autopairs") 
		local Rule = require("nvim-autopairs.rule") 

		npairs.setup(opts)

		npairs.add_rules({
			Rule("~","~","mermaid")
				:with_pair(function() return true end)
		})
	end,



	--[[
	"nvim-mini/mini.pairs",
	event="VeryLazy",
	version=false,
	config={
		-- In which modes mappings from this `config` should be created
		modes = { insert = true, command = false, terminal = false },

		-- Global mappings. Each right hand side should be a pair information, a
		-- table with at least these fields (see more in |MiniPairs.map()|):
		-- - <action> - one of "open", "close", "closeopen".
		-- - <pair> - two character string for pair to be used.
		-- By default pair is not inserted after `\`, quotes are not recognized by
		-- <CR>, `'` does not insert pair after a letter.
		-- Only parts of tables can be tweaked (others will use these defaults).
		-- Supply `false` instead of table to not map particular key.
		mappings = {
			['('] = { action = 'open', pair = '()', neigh_pattern = '[^\\].' },
			['['] = { action = 'open', pair = '[]', neigh_pattern = '[^\\].' },
			['{'] = { action = 'open', pair = '{}', neigh_pattern = '[^\\].' },

			[')'] = { action = 'close', pair = '()', neigh_pattern = '[^\\].' },
			[']'] = { action = 'close', pair = '[]', neigh_pattern = '[^\\].' },
			['}'] = { action = 'close', pair = '{}', neigh_pattern = '[^\\].' },

			['"'] = { action = 'closeopen', pair = '""', neigh_pattern = '[^\\].',   register = { cr = false } },
			["'"] = { action = 'closeopen', pair = "''", neigh_pattern = '[^%a\\].', register = { cr = false } },
			['`'] = { action = 'closeopen', pair = '``', neigh_pattern = '[^\\].',   register = { cr = false } },
			["~"] = { action = "closeopen", pair = "~~", neigh_pattern = "[^\\].",   register = { cr = false } }
		},
	},
	--]]
}

return a_p



