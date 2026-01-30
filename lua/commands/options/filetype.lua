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
    end,
    desc = "Forza indentazione a 4 spazi per Python",
})

-- Sovrascrittura per l'estensione 'Java'
vim.api.nvim_create_autocmd("FileType", {
    -- Il pattern 'mmd' fa scattare questo comando solo per i file .lua
    pattern={"*.java","*.json"},
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
