local lsp={
	{
		"neovim/nvim-lspconfig",
		event="VeryLazy",
		dependencies={
			{"williamboman/mason.nvim",opts={}},
			"williamboman/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
			{"folke/snacks.nvim",opts={}},
			{"j-hui/fidget.nvim",opts={}},

			"saghen/blink.cmp",
			--[[
			{
				"nvim-cmp",
				dependencies={
					{
						"cmp-nvim-lsp",
						"luasnip"
					},
				},
			},
			--]]
		},

		config=function()
			vim.api.nvim_create_autocmd("LspAttach",{
				group=vim.api.nvim_create_augroup("kickstart-lsp-attach",{clear=true}),
				callback=function(event)
					local v_and_n_modes={"v","n"}

					vim.keymap.set(v_and_n_modes,"<leader>rn",vim.lsp.buf.rename,{buffer=event.buf,desc="[R]e[n]ame"})
					vim.keymap.set(v_and_n_modes,"<leader>ca",vim.lsp.buf.code_action,{buffer=event.buf,desc="[C]ode [A]ction"})
					vim.keymap.set(v_and_n_modes,"<leader>cd",vim.lsp.buf.hover,{buffer=event.buf,desc="[C]ode [D]ocumentation"})
					vim.keymap.set("n","<leader><space>",function() Snacks.picker.smart() end,{desc="Smart Find Files"})
					vim.keymap.set("n","gr",function() Snacks.picker.lsp_references() end,{desc="[G]oto [R]eferences"})
					vim.keymap.set("n","gI",function() Snacks.picker.lsp_implementations() end,{desc="[G]oto [I]mplementation"})
					vim.keymap.set("n","gd",function() Snacks.picker.lsp_definitions() end,{desc="[G]oto [D]efinition"})
					vim.keymap.set("n","gD",function() Snacks.picker.lsp_declarations() end,{desc="[G]oto [D]eclaration"})
					vim.keymap.set("n","<leader>ds",function() Snacks.picker.lsp_symbols() end,{desc="Open [D]ocument [S]ymbol"})
					vim.keymap.set("n","<leader>ws",function() Snacks.picker.lsp_workspace_symbols() end,{desc="Open [W]orkspace [S]ymbol"})
					vim.keymap.set("n","<leader>gt",function() Snacks.picker.lsp_type_definitions() end,{desc="[G]oto [T]ype Definition"})

					---@param client vim.lsp.Client
					---@param method vim.lsp.protocol.Method
					---@param bufnr? integer
					---@return boolean
					local function client_supports_method(client,method,bufnr)
						if vim.fn.has("nvim-0.11") == 1 then
							return client:supports_method(method,bufnr)
						else
							return client.supports_method(method,{bufnr=bufnr})
						end
					end

					local client=vim.lsp.get_client_by_id(event.data.client_id)
					if client and client_supports_method(client,vim.lsp.protocol.Methods.textDocument_documentHighlight,event.buf) then
						local highlight_autogroup=vim.api.nvim_create_augroup("kickstart-lsp-highlight",{clear=true})
						vim.api.nvim_create_autocmd({"CursorHold","CursorHoldI"},{
							buffer=event.buf,
							group=highlight_augroup,
							callback=vim.lsp.buf.document_highlight,
						})

						vim.api.nvim_create_autocmd({"CursorMoved","CursorMovedI"},{
							buffer=event.buf,
							group=highlight_augroup,
							callback=vim.lsp.buf.clear_references,
						})

						vim.api.nvim_create_autocmd("LspDetach",{
							group=vim.api.nvim_create_augroup("kickstart-lsp-detach",{clear=true}),
							callback=function(event2)
								vim.lsp.buf.clear_references()
								vim.api.nvim_clear_autocmds({group="kickstart-lsp-highlight",buffer=event2.buf})
							end
						})

						if client and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_inlayHint,event.buf) then
							vim.keymap.set("n","<leader>th",function()
								vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({bufnr=event.buf}))
							end,{buffer=event.buf,desc="[T]oggle Inlay [H]ints"})
						end
					end
				end,
			})

			vim.diagnostic.config({
				severity_sort=true,
				float={border="rounded",source="if_many"},
				--underline={severity=vim.diagnostc.severity.ERROR},
				signs=vim.g.have_nerd_font and {
					text={
						[vim.diagnostic.severity.ERROR]="󰅚 ",
						[vim.diagnostic.severity.WARN]="󰀪 ",
						[vim.diagnostic.severity.INFO]="󰋽 ",
						[vim.diagnostic.severity.HINT]="󰌶 ",
					},
				} or {},

				virtual_text={
					source="if_many",
					spacing=2,
					format=function(diagnostic)
						local diagnostic_message={
							[vim.diagnostic.severity.ERROR]=diagnostic.message,
							[vim.diagnostic.severity.WARN]=diagnostic.message,
							[vim.diagnostic.severity.INFO]=diagnostic.message,
							[vim.diagnostic.severity.HINT]=diagnostic.message,
						}
						return diagnostic_message[diagnostic.severity]
					end,
				}
			})

			local isDiagnEnabled=true
			local toggle_diagnostics=function()
				isDiagnEnabled=not isDiagnEnabled
				if isDiagnEnabled then
					vim.diagnostic.enable(isDiagnEnabled)
					print("Diagnostic Enabled")
				else
					vim.diagnostic.enable(isDiagnEnabled)
					print("Diagnostic Disabled")
				end
			end

			vim.keymap.set("n","<leader>td",toggle_diagnostics,{desc="[T]oggle [D]iagnostic"})

			local capabilities=require("blink.cmp").get_lsp_capabilities()

			local servers={
				bashls={},
				clangd={},
				jdtls={},
				lua_ls={
					--cmd={},
					--filetypes={},
					--capabilities={},
					settings={
						Lua={
							completion={
								callSnippet="Replace",
							},
							diagnostics={
								disable={"missing-fields"},
								globals={"vim"},
							},
						}
					},
				},
				pyright={},
				sqlls={},
			}

			-- [[
			for name,config in pairs(servers) do
				local con=config or {}
				con.capabilities=vim.tbl_deep_extend("force",{},capabilities,con.capabilities or {})
				vim.lsp.config(name,con)
			end
			-- ]]

			local ensure_installed=vim.tbl_keys(servers or {
				"stylua",
			})
			require("mason-tool-installer").setup({ensure_installed=ensure_installed})

			require("mason-lspconfig").setup({
				ensure_installed={},
				automatic_installation=false,
			})
		end
	},
}

return lsp
