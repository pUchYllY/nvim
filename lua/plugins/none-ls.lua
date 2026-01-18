return { "nvimtools/none-ls.nvim",

	opts = function()
		local null_ls = require("null-ls")

		null_ls.setup({
			sources = {
				-- diagnostics and formattings

				-- bash
				null_ls.builtins.diagnostics.shellcheck, -- errors
				null_ls.builtins.formatting.shfmt, -- fomratting

				-- c/cpp
				-- null_ls.builtins.diagnostics.clang_check, -- errors
				-- builtins.diagnostics.cpplint, -- style
				-- builtins.diagnostics.cppcheck,
				null_ls.builtins.formatting.clang_format, -- formatting (used for java formatting too)

				-- dockerls (Dockerfile)
				null_ls.builtins.diagnostics.hadolint, -- syntax
				-- null_ls.builtins.formatting.prettier, -- formatting
				-- docker compose (or YAML)
				-- null_ls.builtins.diagnostics.yamllint, -- syntax

				-- java
				null_ls.builtins.diagnostics.checkstyle, -- style
				-- builtins.formatting., -- formatting

				-- lua
				null_ls.builtins.diagnostics.luacheck, -- stile
				-- null_ls.builtins.diagnostics.selene, -- errori
				null_ls.builtins.formatting.stylua, -- formatting

				-- python
				null_ls.builtins.diagnostics.ruff, -- all (but in this case errors, style)
				null_ls.builtins.formatting.black, -- formatting

				-- rubocop
				null_ls.builtins.diagnostics.rubocop,
				null_ls.builtins.formatting.rubocop,

				-- typescript/javascript
				-- builtins.diagnostics.stylelint, -- CSS, SCSS linter
				null_ls.builtins.formatting.prettier,

				-- SQL
                null_ls.builtins.diagnostics.sqlfluff,
				null_ls.builtins.formatting.sqlfluff,

				--
				-- null_ls.builtins.diagnostics.

				--
				-- null_ls.builtins.diagnostics.

				--
				-- null_ls.builtins.diagnostics.
			},
		})

		vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
	end,
}

--[[
--
-- per installare un linter e un formatter, bisogna:
-- - digitare "null_ls.builtins.diagnostics.nomeLinter" in questo file
-- - ritornare nel terminale e digitare "npm install -g nomeLinter"
-- - ritornare in NeoVim e spostarsi su Mason
-- - installare il linter di null_ls, dato che i linter e i formatter di null_ls hanno lo stesso nome con quelli di Mason
--
-- CONSULTARE I SEGUENTI LINK PER VERIFICARE L'ESISTENZA DEI LINTER, FORMATTER, COMPLETION, ecc. :
--
-- Linter
-- https://github.com/nvimtools/none-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
--
-- Formatter
-- https://github.com/nvimtools/none-ls.nvim/tree/main/lua/null-ls/builtins/formatting
--
-- Completion
-- https://github.com/nvimtools/none-ls.nvim/tree/main/lua/null-ls/builtins/completion
--
--
--]]
