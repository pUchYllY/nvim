local M={}

M.c_cppJavaVoid_function_block=function()
	local keys = vim.api.nvim_replace_termcodes("void name_function(<Right>{<CR><Tab><CR><Up><Right>", true, false, true)
	vim.api.nvim_feedkeys(keys, "m", false)
end

M.c_cppjavaReturn_function_block=function()
	local keys = vim.api.nvim_replace_termcodes("int name_function(<Right>{return 0;", true, false, true)
	vim.api.nvim_feedkeys(keys, "m", false)
end

M.cppJavaClassReturn_function_block=function()
	local keys = vim.api.nvim_replace_termcodes("Class name_function(<Right>{return instance;<s-Left><s-Left><s-Left><CR><CR><CR><Tab><Up><Up><Tab>", true, false, true)
	vim.api.nvim_feedkeys(keys, "m", false)
end

M.lua_function_block=function()
	local keys = vim.api.nvim_replace_termcodes("function(<Right>end<S-Left><CR><CR><Up><Tab>", true, false, true)
	vim.api.nvim_feedkeys(keys, "m", false)
end

M.pythonReturn_function_block=function()
	local keys = vim.api.nvim_replace_termcodes("(<Right>->Class:<CR><CR><CR><Tab>return instance<Up><Up><Tab>", true, false, true)
	vim.api.nvim_feedkeys(keys, "m", false)
end

M.pythonPass_function_block=function()
	local keys = vim.api.nvim_replace_termcodes("(<Right>:pass<S-Left><CR><CR><Up><Tab>", true, false, true)
	vim.api.nvim_feedkeys(keys, "m", false)
end

return M
