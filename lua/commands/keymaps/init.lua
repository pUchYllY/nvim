local k = {}
-- [[
-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
-- impostare la barra-spaziatrice come mapleader

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- This global options disable all Neovim commands
--vim.g;

vim.keymap.set("n", "<leader>ve", function() vim.cmd.Explore() end, { desc = "[V]im Explorer" })


-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Diagnostic keymaps
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set("t", "<Esc><Esc>", "<C-\'><C-n>", { desc = "Exit terminal mode" })

-- TIP: Disable arrow keys in normal mode
vim.keymap.set("n", "<left>", '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set("n", "<right>", '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set("n", "<up>", '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set("n", "<down>", '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- NOTE: Some terminals have colliding keymaps or are not able to send distinct keycodes
-- vim.keymap.set("n","<C-S-h>","<C-w>H",{desc = "Move window to the left"})
-- vim.keymap.set("n","<C-S-l>","<C-w>L",{desc = "Move window to the right"})
-- vim.keymap.set("n","<C-S-j>","<C-w>J",{desc = "Move window to the lower"})
-- vim.keymap.set("n","<C-S-k>","<C-w>K",{desc = "Move window to the upper"})

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.hl.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.hl.on_yank()
	end,
})

-- This variable give you to toggle number lines:
local isNumber_lineEnabled = true
--This function toggles your number lines
local function toggle_numberLine()
	isNumber_lineEnabled = not isNumber_lineEnabled
	if isNumber_lineEnabled then
		vim.cmd("set number!")
		print("Number lines Enabled")
	else
		vim.cmd("set number!")
		print("Number lines Disabled")
	end
end
-- This keymap toggle your current window number lines
vim.keymap.set('n', '<leader>n', toggle_numberLine, { desc = "Toggle [N]umber Lines" })
--]]

local w = require("commands.keymaps.window-manager")

-- This keymap ask you if you want get out from Neovim
vim.keymap.set("n", "<leader>qq", function() w.quit() end, { desc = "Quit from Neovim?" })

-- This keymap quit from all opened files
vim.keymap.set("n", "<leader>qa", function() w.quit_all() end, { desc = "[Q]uit from Neovim." })

-- This keymap quit from Neovim without saving all opened files
vim.keymap.set("n", "<leader>qas", function() w.quit_all_without_saving() end,{ desc = "[Q]uit from Neovim without saving." })

-- This keymap saves your files (only one selected file)
vim.keymap.set("n", "<leader>ww", function() w.write() end, { desc = "[W]rite your single document" })

-- This keymap saves your files (ALL)
vim.keymap.set("n", "<leader>wa", function() w.write_all() end, { desc = "[W]rite [A]ll opened files" })

-- This keymap saves and closes your files (only one selected file)
vim.keymap.set("n", "<leader>wq", function() w.write_and_quit() end, { desc = "Write and [Q]uit from your file" })

-- This keymap saves and closes your opened files (ALL)
vim.keymap.set("n", "<leader>wqa", function() w.write_and_quit_all() end, { desc = "Write and Close [A]ll Opened Files" })

-- This keymap applies new configuration's modifies
--vim.keymap.set("n", "<leader>%", function() w.source_this_file() end, { desc = "Source this File (Neovim command)" })

--]
return k
