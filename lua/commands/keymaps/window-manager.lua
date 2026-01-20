local wm={}

wm.write=function()
	vim.ui.input(
		{prompt="Write this file?",},
		function(input)
			if input == "" then -- Enter → close all files
				vim.cmd("w")
				print(vim.fn.expand("%:t").." written.")

			elseif input==nil then
				-- CTRL+C or ESC → messaggio 
				print(vim.fn.expand("%:t").." not written.")
			end
		end
	)
end

wm.write_all=function()
	vim.ui.input(
		{prompt="Write all opened files?",},

		function(input)
			if input == "" then -- Enter → close all files
				vim.cmd("wa")
				print("All opened files written.")
			elseif input==nil then
				-- CTRL+C or ESC → messaggio 
				print("All opened files not written.")
			end
		end
	)
end

wm.write_and_quit=function()
	vim.ui.input(
		{prompt="Write this file and quit?",},
		function(input)
			if input == "" then -- Enter → save and close itself
				vim.cmd("wq")
				print(vim.fn.expand("%:t").." written and closed.")
			else
				-- Every response → file will not get saved and it will not close itself
				print(vim.fn.expand("%:t").." not written and closed.")
			end
		end
	)
end

wm.write_and_quit_all=function()
	vim.ui.input(
		{prompt="Write all opened files and close them?",},
		function(input)
			if input == "" then -- Enter → save and close itself
				vim.cmd("wqa")
			else
				-- Every response → file will not get saved and it will not close itself
				print("All opened files not written and closed.")
			end
		end
	)
end

wm.quit=function()
	vim.ui.input(
		{prompt = "Close this file?",},

		function(input)
			if input == "" then -- Enter → close all files
				vim.cmd("q")
				print(vim.fn.expand("%:t").." closed.")
			elseif input==nil then
				--
				-- CTRL+C or ESC → messaggio 
				print(vim.fn.expand("%:t").." closed.")
			end
		end
	)
end

wm.quit_all=function()
	vim.ui.input(
		{prompt = "Close all files?",},

		function(input)
			if input == "" then -- Enter → close all files
				vim.cmd("qa")
			elseif input==nil then
				--
				-- CTRL+C or ESC → messaggio 
				print("All opened files not closed.")
			end
		end
	)
end

wm.quit_all_without_saving=function()
	vim.ui.input(
		{prompt = "Close all files without saving?",},

		function(input)
			if input == "" then -- Enter → close all files
				vim.cmd("qa!")
			elseif input==nil then
				--
				-- CTRL+C or ESC → messaggio 
				print("All opened files not written and closed.")
			end
		end
	)
end

--[[
wm.source_this_file=function()
	dofile(vim.fn.expand("%"))
	vim.notify("Your modifies have been applied")
end
--]]

return wm
