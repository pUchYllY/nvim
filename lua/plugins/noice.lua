local n={
	"folke/noice.nvim",
	event="VeryLazy",
	opts={
		routes={
			{
				filter={event="notify"},
				wiew="popup"
			},
			wiews={
				popup={
					position={
						row="50%",
						column="50%",
					},
					size={
						width=60,
						height="auto"
					},
					border={
						style="rounded"
					}
				}
			}
		}
	},
	dependencies={"MunifTanjim/nui.nvim"},
}

return n
