local treesitter_fts = {
	"bash",
	"c",
	"diff",
	"html",
	"lua",
	"luadoc",
	"markdown",
	"markdown_inline",
	"query",
	"vim",
	"vimdoc",
	"go",
	"rust",
	"javascript",
	"typescript",
}

require("nvim-treesitter").install(treesitter_fts)

vim.api.nvim_create_autocmd("FileType", {
	pattern = treesitter_fts,
	callback = function(args)
		vim.treesitter.start()
		vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
	end,
})
