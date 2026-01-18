-- aggiungi mason/bin al PATH
vim.env.PATH = vim.fn.stdpath("data") .. "/mason/bin:" .. vim.env.PATH

require("commands.options")
require("commands.keymaps")

require("config.lazy")
