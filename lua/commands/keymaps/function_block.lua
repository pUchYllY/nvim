local M={}

M.c_cppJavaVoid_function_block=function()
	local code= "void name_method(){<NL><NL>}<Up><Tab>"

	--code=code:gsub("<cursor>","")

	local term_code = vim.api.nvim_replace_termcodes(code,true,false,true)
	vim.api.nvim_feedkeys(term_code,"n",false)
end

M.c_cppJavaReturn_function_block=function()
	local code = "int name_method(){<NL><NL><NL>return 0;<NL>}<Up><Up><Up><Tab>"

	--code=code:gsub("<cursor>","")

	local term_code = vim.api.nvim_replace_termcodes(code,true,false,true)
	vim.api.nvim_feedkeys(term_code,"n",false)
end

M.cppJavaClassReturn_function_block=function()
	local code = "Class_name name_method(){<NL><NL><NL>return instance;<NL>}<Up><Up><Up><Tab>"

	--code=code:gsub("<cursor>","")

	local term_code = vim.api.nvim_replace_termcodes(code,true,false,true)
	vim.api.nvim_feedkeys(term_code,"n",false)
end

M.lua_function_block=function()
	local code = "function()<NL><NL>end<Up><Tab>"

	--code=code:gsub("<cursor>","")

	local term_code = vim.api.nvim_replace_termcodes(code,true,false,true)
	vim.api.nvim_feedkeys(term_code,"n",false)
end

M.pythonReturn_function_block=function()
	local code = "def name_def()->int:<NL><NL><NL>return 0<Up><Up><Tab>"

	--code=code:gsub("<cursor>","")

	local term_code = vim.api.nvim_replace_termcodes(code,true,false,true)
	vim.api.nvim_feedkeys(term_code,"n",false)
end

M.pythonClassReturn_function_block=function()
	local code = "def name_def()->Class_name:<NL><NL><NL>return instance<Up><Up><Tab>"

	--code=code:gsub("<cursor>","")

	local term_code = vim.api.nvim_replace_termcodes(code,true,false,true)
	vim.api.nvim_feedkeys(term_code,"n",false)
end

M.pythonPass_function_block=function()
	local code = "def name_def()->None:<NL><NL><NL>pass<Up><Up><Tab>"

	--code=code:gsub("<cursor>","")

	local term_code = vim.api.nvim_replace_termcodes(code,true,false,true)
	vim.api.nvim_feedkeys(term_code,"n",false)
end

return M
