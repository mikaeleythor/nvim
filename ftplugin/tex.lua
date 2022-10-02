local dirs
local root = vim.api.nvim_command_output([[:pw]]) .. "/"

--Getting the last directory in full path
for dir in string.gmatch(root, "%w+/") do
  dirs = dir
end

--Substituting / for .tex
local file = string.gsub(dirs, "/", "") .. ".tex"

local commands = {
  'augroup AutoCompileLatex',
	'autocmd BufwritePost *.tex :silent !pdflatex -interaction nonstopmode ' .. file
}

--for key, command in pairs(commands) do
  --vim.api.nvim_command(command)
--end


