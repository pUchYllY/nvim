local opts = {}

-- configurazione impostazioni native per Neovim
-- impostazioni tabulari
vim.o.tabstop = 4 -- la tabulazione e' larga 4 spazi 
vim.o.softtabstop = 4 -- il tasto Tab inserisce e simula 4 spazi
vim.o.shiftwidth = 4 -- l'identazione (spostamento) e' di 4 spazi
vim.o.expandtab = false -- sostituisce la tabulazione (fatta dal comando <TAB>) in 4 spazi
vim.o.numberwidth = 4 -- imposta il numero di colonne per la colonna 1

-- altre possibili impostazioni
vim.o.cursorline = true
vim.o.number = true

--[[ utile per selezionare la tabulazioni per ogni linguaggio
-- Sovrascrittura per il filetype 'lua'
vim.api.nvim_create_autocmd("FileType", {
    -- Il pattern 'lua' fa scattare questo comando solo per i file .lua
    pattern={"lua"}
    callback = function()
        -- **vim.opt_local** assicura che l'impostazione sia solo per il buffer aperto
        vim.opt_local.tabstop = 4
        vim.opt_local.shiftwidth = 4
        vim.opt_local.softtabstop = 4
        vim.opt_local.expandtab = true
    end,
    desc = "Forza indentazione a 4 spazi per Lua",
})
--]]

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
    end,
    desc = "Forza indentazione a 4 spazi per Mermaid",
})

-- Sovrascrittura per l'estensione 'Mermaid'
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
    end,
    desc = "Forza indentazione a 4 spazi per Python",
})

--

-- Enable mouse mode, can be useful for resizing splits for example!
vim.o.mouse = ""

-- Don't show the mode, since it's already in the status line
vim.o.showmode = false

-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.schedule(function()
	vim.o.clipboard = "unnamedplus"
end)

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
-- vim.o.signcolumn = "yes"

-- Decrease update time
vim.o.updatetime = 250

-- Decrease mapped sequence wait time
vim.o.timeoutlen = 300

-- Configure how new splits should be opened
vim.o.splitright = true
vim.o.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
--
--  Notice listchars is set using `vim.opt` instead of `vim.o`.
--  It is very similar to `vim.o` but offers an interface for conveniently interacting with tables.
--   See `:help lua-options`
--   and `:help lua-options-guide`
vim.o.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- Preview substitutions live, as you type!
vim.o.inccommand = "split"

-- Minimal number of screen lines to keep above and below the cursor.
vim.o.scrolloff = 10

-- if performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
-- instead raise a dialog asking if you wish to save the current file(s)
-- See `:help 'confirm'`
vim.o.confirm = true
--
return opts
