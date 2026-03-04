local M={}

M.c_cppJavaVoid_function_block=function()
	local code=[[
	void name_function(){
		<cursor>
	}
	]]

	code=code:gsub("<cursor>","")
	return vim.api.nvim_replace_code_termcodes(code,true,false,true)
end

M.c_cppjavaReturn_function_block=function()
	local code = [[
	int name_function(){
		<cursor>

		return 0;
	}
	]]

	code=code:gsub("<cursor>","")
	return vim.api.nvim_replace_code_termcodes(code,true,false,true)
end

M.cppJavaClassReturn_function_block=function()
	local keys =[[
	Class name_function(){
		<cursor>

		return instance;
	}
	]] 

	code=code:gsub("<cursor>","")
	return vim.api.nvim_replace_code_termcodes(code,true,false,true)
end

M.lua_function_block=function()
	local code = [[
	function()
		<cursor>
	end
	]]

	code=code:gsub("<cursor>","")
	return vim.api.nvim_replace_code_termcodes(code,true,false,true)
end

M.pythonReturn_function_block=function()
	local code =[[
	def name_function()->Class_name:
		<cursor>
		return instance
	]] 

	code=code:gsub("<cursor>","")
	return vim.api.nvim_replace_code_termcodes(code,true,false,true)
end

M.pythonPass_function_block=function()
	local code =[[
	def name_function()->None:
		<cursor>
		pass
	]] 

	code=code:gsub("<cursor>","")
	return vim.api.nvim_replace_code_termcodes(code,true,false,true)
end

return M
