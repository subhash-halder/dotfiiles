local cmp = require("blink.cmp")
cmp.build():wait(60000)
cmp.setup({
	-- Use LuaSnip for snippets loaded from friendly-snippets (including Go).
	snippets = { preset = "luasnip" },
})
