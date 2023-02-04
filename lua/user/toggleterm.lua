return {
	size = function (term)
		if term.direction == "horizontal" then
			return 15
		elseif term.direction == "vertical" then
			return vim.o.columns * 0.4
		end
	end,
	open_mapping = [[<a-3>]],
	direction = 'float',
	float_opts = {
		border = 'curved'
	}
}
