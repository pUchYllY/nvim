local g_signs={
	"lewis6991/gitsigns.nvim",
	event="VeryLazy",
	opts={
		signs={
			add={text="+"},
			change={text="~"},
			delete={text="_"},
			topdelete={text="¯"},
			changedelete={text="~"},
		},

		on_attach=function()
			local gitsigns=require("gitsigns")
			local n_v={"n","v"}

			-- Navigation
			vim.keymap.set("n","]c",function()
				if vim.wo.diff then
					vim.cmd.normal({"]c",bang=true})
				else
					gitsigns.nav_hunk("next")
				end
			end,{desc="Jump to the next git [c]hange"})
			vim.keymap.set("n","[c",function()
				if vim.wo.diff then
					vim.cmd.normal({"[c",bang=true})
				else
					gitsigns.nav_hunk("prev")
				end
			end,{desc="Jump to the previous git [c]hange"})

			-- Actions
			-- Normal & Visual Mode
			vim.keymap.set(n_v,"<leader>hs",function() gitsigns.stage_hunk() end,{desc="git [s]tage hunk"})
			vim.keymap.set(n_v,"<leader>hr",function() gitsigns.reset_hunk() end,{desc="git [r]eset hunk"})

			-- Normal Mode
			vim.keymap.set("n","<leader>hS",gitsigns.stage_buffer,{desc="git [S]tage buffer"})
			vim.keymap.set("n","<leader>hu",gitsigns.stage_hunk,{desc="git [u]ndo stage hunk"})
			vim.keymap.set("n","<leader>hR",gitsigns.reset_buffer,{desc="git [R]eset buffer"})
			vim.keymap.set("n","<leader>hp",gitsigns.preview_hunk,{desc="git [p]review hunk"})
			vim.keymap.set("n","<leader>hb",gitsigns.blame_line,{desc="git [b]lame line"})
			vim.keymap.set("n","<leader>hd",gitsigns.diffthis,{desc="git [d]iff against index"})
			vim.keymap.set("n","<leader>hD",function()
				gitsigns.diffthis("@")
			end,{desc="git [d]iff against last commit"})

			--Toggles
			vim.keymap.set("n","<leader>tb",gitsigns.toggle_current_line_blame,{desc="[T]oggle git show [b]lame line"})
			vim.keymap.set("n","<leader>tD",gitsigns.preview_hunk_inline,{desc="[T]oggle git show [D]eleted"})
			--vim.keymap.set("n","",gitsigns.,{desc=""})
			--vim.keymap.set("n","",gitsigns.,{desc=""})
			--vim.keymap.set("n","",gitsigns.,{desc=""})
			--vim.keymap.set("n","",gitsigns.,{desc=""})
			--vim.keymap.set("n","",gitsigns.,{desc=""})
		end
	},
}

return g_signs
