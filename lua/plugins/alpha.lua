return {
	{
		"goolord/alpha-nvim",

		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},

		config = function()
			local alpha = require("alpha")
			local dashboard = require("alpha.themes.dashboard")

			dashboard.section.header.val = {
				"                                                     ",
				"  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
				"  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
				"  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
				"  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
				"  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
				"  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
				"                                                     ",
			}

			--function newProject()  end
			-- attiva la modalita' settings
			function settings()
				vim.cmd("e $MYVIMRC") -- esegue il file principale della sua configurazione
				vim.cmd("cd %:p:h") -- imposta la working directory alla cartella di configurazione
				vim.cmd("sp") -- effettua uno split orizzontale
				vim.cmd("Neotree toggle right") -- apre Neo-tree al lato destro della finestra
				vim.cmd("wincmd h") -- sposta il cursore al documento di testo
				vim.cmd("pwd") -- verifica se la working directory sia stata impostata correttamente
			end

			-- Set menu
			-- Vedere se sia possibile implementare una funzione nella lista parametri di dashboard.button (tutto da vedere)
			dashboard.section.buttons.val = {
				dashboard.button("n", "  > New Project (not available)", ":lua newProject()<CR>"),
				dashboard.button("f", "  > Find file", ":cd $HOME/Desktop | Telescope find_files<CR>"),
				dashboard.button("r", "  > Recent", ":Telescope oldfiles<CR>"),
				dashboard.button("s", "  > Settings", ":lua settings()<CR>"),
				dashboard.button("q", "  > Quit NVIM", ":qa<CR>"),
			}

			alpha.setup(dashboard.opts)

			vim.keymap.set("n","<leader>a",":Alpha<CR>",{desc="Menu (Alpha)"})
			--vim.keymap.set(modes,"<C-n>",newProject(),{desc="New Project"})
			vim.keymap.set("n","<leader>ff",":cd $HOME/Desktop | Telescope find_files<CR>",{desc="Open Existing Project"})
			vim.keymap.set("n","<leader-r>",":Telescope oldfiles<CR>",{desc="Open Recent files"})
			vim.keymap.set("n","<C-s>",":lua settings()",{desc="Settings"})
		end
	}
}
