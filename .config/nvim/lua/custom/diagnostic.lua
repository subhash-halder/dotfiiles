vim.diagnostic.config({
	virtual_text = {
		spacing = 2,
		prefix = "●", -- or "■", "▎", "x"
	},
	signs = true,
	underline = true,
	update_in_insert = false, -- don’t spam while typing
	severity_sort = true,

	float = {
		border = "rounded",
		source = "if_many", -- show source if multiple LSPs
		header = "",
		prefix = "",
	},
})
