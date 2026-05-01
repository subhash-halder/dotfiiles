---------------------
--- neovim option ---
---------------------
require("config")
----------------------
--- neovim plugins ---
----------------------
vim.pack.add({
	{ src = "https://github.com/folke/tokyonight.nvim" },
	{ src = "https://github.com/subhash-halder/vim-tmux-navigator" },
	{ src = "https://github.com/stevearc/oil.nvim" },
	{ src = "https://github.com/nvim-tree/nvim-tree.lua" },
	{ src = "https://github.com/stevearc/conform.nvim" },
	{ src = "https://github.com/tpope/vim-sleuth" },
	{ src = "https://github.com/nvim-mini/mini.nvim", version = "stable" },
	{ src = "https://github.com/numToStr/Comment.nvim" },
	{ src = "https://github.com/folke/which-key.nvim" },
	{ src = "https://github.com/theprimeagen/harpoon" },
	{ src = "https://github.com/akinsho/toggleterm.nvim" },
	--- lsp & snippet ---
	{ src = "https://github.com/L3MON4D3/LuaSnip" },
	{ src = "https://github.com/rafamadriz/friendly-snippets" },
	{ src = "https://github.com/saghen/blink.lib" },
	{ src = "https://github.com/saghen/blink.cmp" },
	{ src = "https://github.com/j-hui/fidget.nvim" },
	--- telescope ---
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" },
	{ src = "http://github.com/nvim-telescope/telescope.nvim" },
	--- debugger ---
	{ src = "https://github.com/mfussenegger/nvim-dap" },
	{ src = "https://github.com/rcarriga/nvim-dap-ui" },
	{ src = "https://github.com/nvim-neotest/nvim-nio" },
	{ src = "https://github.com/thehamsta/nvim-dap-virtual-text" },

	-- dependencies
	{ src = "https://github.com/nvim-lua/plenary.nvim" },
	{ src = "https://github.com/nvim-telescope/telescope-fzf-native.nvim" },
	{ src = "https://github.com/nvim-telescope/telescope-ui-select.nvim" },
	{ src = "https://github.com/nvim-telescope/telescope-live-grep-args.nvim" },
	{ src = "https://github.com/nvim-tree/nvim-web-devicons" },
})

require("tokyonight").setup()
require("oil").setup()
require("luasnip.loaders.from_vscode").lazy_load()
require("Comment").setup()
require("fidget").setup()
require("harpoon").setup()
require("./plugins.nvim-tree")
require("plugins.conform")
require("plugins.mini")
require("plugins.telescope")
require("plugins.dap")
require("plugins.toggleterm")

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "go", "ts", "js", "md" },
	callback = function()
		vim.treesitter.start()
	end,
})

-- Load the colorscheme here.
-- Like many other themes, this one has different styles, and you could load
-- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
vim.cmd.colorscheme("tokyonight-moon")

-- You can configure highlights by doing something like:
vim.cmd.hi("Comment gui=none")

-----------------
--- lsp setup ---
-----------------

vim.lsp.enable({ "lua_ls", "gopls", "ts_ls", "clangd" })
-- require("lsp.init")
require("plugins.blink")

----------------------
--- custom sctipts ---
----------------------
require("custom.diagnostic")
require("custom.compile")
require("custom.copy-file-path")
require("custom.camel-snake-case")
require("custom.lazygit")
require("custom.open-current-line-commit")
require("custom.utils")
---------------------
--- neovim keymap ---
---------------------
require("key-mapping")
