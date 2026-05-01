-- custom  function keymap
vim.keymap.set("n", "<leader>yx", CopyRelativePath, { desc = "Copy relative file path" })
vim.keymap.set("n", "<leader>yX", CopyAbsolutePath, { desc = "Copy absolute file path" })
vim.keymap.set("n", "gC", OpenCommitForCurrentLine, { desc = "Open commit for current line" })
vim.keymap.set("n", "gP", OpenPRForCurrentLine, { desc = "Open PR for current line commit" })

-- Keymaps for file navigation
vim.keymap.set("n", "<leader>eo", "<CMD>Oil<CR>", { desc = "Open parent directory" })
vim.keymap.set("n", "<leader>ee", ":NvimTreeToggle<CR>", { desc = "Toggle NvimTree" })

-- Formate buffer
vim.keymap.set(
	"n",
	"<leader>cf",
	':lua require("conform").format { async = true, lsp_format = "fallback" }<CR>',
	{ desc = "Toggle NvimTree" }
)

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Diagnostic keymaps
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Remap <Leader>w to Ctrl-w
vim.keymap.set("n", "<leader>w", "<C-w>")

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

vim.keymap.set("n", "<C-s>", ":w<cr>", { desc = "Save current buffer" })
vim.keymap.set("i", "<C-s>", "<Esc>:w<cr>", { desc = "Save current buffer" })

vim.keymap.set("n", "<C-q>", ":q<cr>", { desc = "Close window" })

vim.keymap.set("n", "<S-l>", ":bnext<CR>", { desc = "go to next buffer" })
vim.keymap.set("n", "<S-h>", ":bprevious<CR>", { desc = "go to previous buffer" })

vim.keymap.set("n", "<S-q>", "<cmd>Bdelete!<CR>", { desc = "Delete Buffer" })

vim.keymap.set("n", "<leader>gg", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", { desc = "[G]it Toggle lazy git" })
vim.keymap.set("n", "<leader>gb", "<cmd>Gitsigns blame_line<CR>", { desc = "[G]it blame line" })
vim.keymap.set(
	"n",
	"<leader>gf",
	'<cmd>lua require("custom.utils").git_diff_current_line()<CR>',
	{ desc = "[G]it file history" }
)

vim.keymap.set(
	"n",
	"<leader>cc",
	"<cmd>lua require('Comment.api').toggle.linewise.current()<CR>",
	{ desc = "[C]ode [C]omment" }
)
vim.keymap.set(
	"x",
	"<leader>cc",
	"<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
	{ desc = "[C]ode [C]omment" }
)

vim.keymap.set(
	"n",
	"<leader>cd",
	"<cmd>lua vim.diagnostic.open_float()<CR>",
	{ desc = "[C]ode [D]iagnostics Floating window" }
)

vim.keymap.set(
	"n",
	"<leader>cs",
	'<cmd>lua require("custom.switch_case").switch_case()<CR>',
	{ desc = "[C]ode [S]witch Case" }
)
vim.keymap.set("n", "<leader>dc", '<cmd>lua require("dap").continue()<CR>', { desc = "[D]ebug [c]continue" })
vim.keymap.set("n", "<leader>du", '<cmd>lua require("dapui").toggle()<CR>', { desc = "[D]ebug [t]oggle UI" })

vim.keymap.set("v", "p", "P")

vim.keymap.set("n", "<leader>cx", "<cmd>Compile<CR>", { desc = "[C]ompile" })

-- Jump to the definition of the word under your cursor.
--  This is where a variable was first declared, or where a function is defined, etc.
--  To jump back, press <C-t>.
vim.keymap.set("n", "gd", require("telescope.builtin").lsp_definitions, { desc = "[G]oto [D]efinition" })

-- Find references for the word under your cursor.
vim.keymap.set(
	"n",
	"gr",
	":lua require('telescope.builtin').lsp_references({show_line=false})<CR>",
	{ desc = "[G]oto [R]eferences" }
)

-- Jump to the implementation of the word under your cursor.
--  Useful when your language has ways of declaring types without an actual implementation.
vim.keymap.set("n", "gI", require("telescope.builtin").lsp_implementations, { desc = "[G]oto [I]mplementation" })

-- Jump to the type of the word under your cursor.
--  Useful when you're not sure what type a variable is and you want to see
--  the definition of its *type*, not where it was *defined*.
vim.keymap.set("n", "<leader>D", require("telescope.builtin").lsp_type_definitions, { desc = "Type [D]efinition" })

-- Fuzzy find all the symbols in your current document.
--  Symbols are things like variables, functions, types, etc.
vim.keymap.set("n", "<leader>cs", require("telescope.builtin").lsp_document_symbols, { desc = "[D]ocument [S]ymbols" })

-- Fuzzy find all the symbols in your current workspace.
--  Similar to document symbols, except searches over your entire project.
vim.keymap.set(
	"n",
	"<leader>ws",
	require("telescope.builtin").lsp_dynamic_workspace_symbols,
	{ desc = "[W]orkspace [S]ymbols" }
)

-- Rename the variable under your cursor.
--  Most Language Servers support renaming across files, etc.
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "[R]e[n]ame" })

-- Execute a code action, usually your cursor needs to be on top of an error
-- or a suggestion from your LSP for this to activate.
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "[C]ode [A]ction" })

-- WARN: This is not Goto Definition, this is Goto Declaration.
--  For example, in C this would take you to the header.
vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "[G]oto [D]eclaration" })

vim.keymap.set("i", "<C-k>", vim.lsp.buf.signature_help, { desc = "Function Signature Help" })

--- Harpoon keymaps ---
local harpoon_mark = require("harpoon.mark")
local harpoon_ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>ha", harpoon_mark.add_file, { desc = "[H]arpoon [A]dd" })
vim.keymap.set("n", "<leader>hh", harpoon_ui.toggle_quick_menu, { desc = "[H]arpoon [H]ide" })

vim.keymap.set("n", "<leader><leader>", function()
	harpoon_ui.nav_next()
end, { desc = "[H]arpoon [N]ext" })
vim.keymap.set("n", "<leader>h1", function()
	harpoon_ui.nav_file(1)
end, { desc = "[H]arpoon [1]" })
vim.keymap.set("n", "<leader>h2", function()
	harpoon_ui.nav_file(2)
end, { desc = "[H]arpoon [2]" })
vim.keymap.set("n", "<leader>h3", function()
	harpoon_ui.nav_file(3)
end, { desc = "[H]arpoon [3]" })
vim.keymap.set("n", "<leader>h4", function()
	harpoon_ui.nav_file(4)
end, { desc = "[H]arpoon [4]" })

--- terminal related mapping ---

function _G.set_terminal_keymaps()
	local opts = { noremap = true }
	-- vim.api.nvim_buf_set_keymap(0, 't', '<esc>', [[<C-\><C-n>]], opts)
	vim.api.nvim_buf_set_keymap(0, "t", "<C-h>", [[<C-\><C-n><C-W>h]], opts)
	vim.api.nvim_buf_set_keymap(0, "t", "<C-j>", [[<C-\><C-n><C-W>j]], opts)
	vim.api.nvim_buf_set_keymap(0, "t", "<C-k>", [[<C-\><C-n><C-W>k]], opts)
	vim.api.nvim_buf_set_keymap(0, "t", "<C-l>", [[<C-\><C-n><C-W>l]], opts)
end

vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

--- dap ---

local dap = require("dap")
local dapui = require("dapui")
vim.keymap.set("n", "<F5>", dap.continue, { desc = "Debug: Start/Continue" })
vim.keymap.set("n", "<leader>dc", dap.continue, { desc = "Debug: Start/Continue" })
vim.keymap.set("n", "<F1>", dap.step_into, { desc = "Debug: Step Into" })
vim.keymap.set("n", "<leader>di", dap.step_into, { desc = "Debug: Step Into" })
vim.keymap.set("n", "<F2>", dap.step_over, { desc = "Debug: Step Over" })
vim.keymap.set("n", "<leader>ds", dap.step_over, { desc = "Debug: Step Over" })
vim.keymap.set("n", "<F3>", dap.step_out, { desc = "Debug: Step Out" })
vim.keymap.set("n", "<leader>do", dap.step_out, { desc = "Debug: Step Out" })
vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "Debug: Toggle Breakpoint" })
vim.keymap.set("n", "<leader>dx", dap.disconnect, { desc = "Debug: Close debugger" })
vim.keymap.set("n", "<leader>dk", dapui.eval, { desc = "Debug: eval word under cursor" })
vim.keymap.set("n", "<leader>dt", dapui.toggle, { desc = "Debug: Toggle DapUI" })
vim.keymap.set("n", "<leader>dB", function()
	dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
end, { desc = "Debug: Set conditional breakpoint" })
vim.keymap.set("n", "<F7>", dapui.toggle, { desc = "Debug: See last session result." })
vim.keymap.set("n", "<leader>du", dapui.toggle, { desc = "Debug: See last session result." })

--- git ---

local gitsigns = require("gitsigns")

vim.keymap.set("n", "]c", function()
	if vim.wo.diff then
		vim.cmd.normal({ "]c", bang = true })
	else
		gitsigns.nav_hunk("next")
	end
end, { desc = "Jump to next git [c]hange" })

vim.keymap.set("n", "[c", function()
	if vim.wo.diff then
		vim.cmd.normal({ "[c", bang = true })
	else
		gitsigns.nav_hunk("prev")
	end
end, { desc = "Jump to previous git [c]hange" })

-- Actions
-- visual mode
vim.keymap.set("v", "<leader>hs", function()
	gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
end, { desc = "stage git hunk" })
vim.keymap.set("v", "<leader>hr", function()
	gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
end, { desc = "reset git hunk" })
-- normal mode
vim.keymap.set("n", "<leader>hs", gitsigns.stage_hunk, { desc = "git [s]tage hunk" })
vim.keymap.set("n", "<leader>hr", gitsigns.reset_hunk, { desc = "git [r]eset hunk" })
vim.keymap.set("n", "<leader>hS", gitsigns.stage_buffer, { desc = "git [S]tage buffer" })
vim.keymap.set("n", "<leader>hu", gitsigns.undo_stage_hunk, { desc = "git [u]ndo stage hunk" })
vim.keymap.set("n", "<leader>hR", gitsigns.reset_buffer, { desc = "git [R]eset buffer" })
vim.keymap.set("n", "<leader>hp", gitsigns.preview_hunk, { desc = "git [p]review hunk" })
vim.keymap.set("n", "<leader>hb", gitsigns.blame_line, { desc = "git [b]lame line" })
vim.keymap.set("n", "<leader>hd", gitsigns.diffthis, { desc = "git [d]iff against index" })
vim.keymap.set("n", "<leader>hD", function()
	gitsigns.diffthis("@")
end, { desc = "git [D]iff against last commit" })
-- Toggles
vim.keymap.set("n", "<leader>tb", gitsigns.toggle_current_line_blame, { desc = "[T]oggle git show [b]lame line" })
vim.keymap.set("n", "<leader>tD", gitsigns.toggle_deleted, { desc = "[T]oggle git show [D]eleted" })
