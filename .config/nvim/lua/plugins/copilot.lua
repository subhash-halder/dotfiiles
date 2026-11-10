vim.g.copilot_no_tab_map = true

local cmp = require("blink.cmp")

vim.keymap.set("i", "<Tab>", function()
	local suggestion = vim.fn["copilot#GetDisplayedSuggestion"]()
	if suggestion.text ~= "" then
		return vim.fn["copilot#Accept"]("<Tab>")
	end

	if cmp.snippet_active() then
		return cmp.snippet_forward()
	end

	return "<Tab>"
end, {
	expr = true,
	replace_keycodes = false,
})
