vim.g.mapleader = " "

-- Oil
vim.keymap.set("n", "<leader>w", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- Telescope
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>fa", builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", builtin.git_files, {})
vim.keymap.set("n", "<leader>fl", builtin.live_grep, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})

-- Undotree
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

-- Comment
local comment = require("mini.comment")

vim.keymap.set("n", "<leader>/", function()
	comment.toggle_lines(vim.fn.line("."), vim.fn.line("."))
end, { desc = "Toggle comment (line) with <leader>/" })

vim.keymap.set("v", "<leader>/", function()
	local esc = vim.api.nvim_replace_termcodes("<Esc>", true, false, true)
	vim.api.nvim_feedkeys(esc, "nx", false)

	local line_start = vim.fn.getpos("'<")[2]
	local line_end = vim.fn.getpos("'>")[2]

	comment.toggle_lines(line_start, line_end)
end, { desc = "Toggle comment (selection) with <leader>/" })

-- Barbar
-- Move to previous/next
vim.keymap.set("n", "<S-Tab>", "<Cmd>BufferPrevious<CR>", opts)
vim.keymap.set("n", "<Tab>", "<Cmd>BufferNext<CR>", opts)

-- Re-order to previous/next
vim.keymap.set("n", "<A-,>", "<Cmd>BufferMovePrevious<CR>", opts)
vim.keymap.set("n", "<A-.>", "<Cmd>BufferMoveNext<CR>", opts)

-- Goto buffer in position...
vim.keymap.set("n", "<A-1>", "<Cmd>BufferGoto 1<CR>", opts)
vim.keymap.set("n", "<A-2>", "<Cmd>BufferGoto 2<CR>", opts)
vim.keymap.set("n", "<A-3>", "<Cmd>BufferGoto 3<CR>", opts)
vim.keymap.set("n", "<A-4>", "<Cmd>BufferGoto 4<CR>", opts)
vim.keymap.set("n", "<A-5>", "<Cmd>BufferGoto 5<CR>", opts)
vim.keymap.set("n", "<A-6>", "<Cmd>BufferGoto 6<CR>", opts)
vim.keymap.set("n", "<A-7>", "<Cmd>BufferGoto 7<CR>", opts)
vim.keymap.set("n", "<A-8>", "<Cmd>BufferGoto 8<CR>", opts)
vim.keymap.set("n", "<A-9>", "<Cmd>BufferGoto 9<CR>", opts)
vim.keymap.set("n", "<A-0>", "<Cmd>BufferLast<CR>", opts)

-- Pin/unpin buffer
vim.keymap.set("n", "<A-p>", "<Cmd>BufferPin<CR>", opts)

-- Close buffer
vim.keymap.set("n", "<A-q>", "<Cmd>BufferClose<CR>", opts)

-- Magic buffer-picking mode
vim.keymap.set("n", "<C-p>", "<Cmd>BufferPick<CR>", opts)
vim.keymap.set("n", "<C-s-p>", "<Cmd>BufferPickDelete<CR>", opts)

-- Sort automatically by...
vim.keymap.set("n", "<Space>bb", "<Cmd>BufferOrderByBufferNumber<CR>", opts)
vim.keymap.set("n", "<Space>bn", "<Cmd>BufferOrderByName<CR>", opts)
vim.keymap.set("n", "<Space>bd", "<Cmd>BufferOrderByDirectory<CR>", opts)
vim.keymap.set("n", "<Space>bl", "<Cmd>BufferOrderByLanguage<CR>", opts)
vim.keymap.set("n", "<Space>bw", "<Cmd>BufferOrderByWindowNumber<CR>", opts)

-- FTerm
vim.keymap.set("n", "<A-`>", function()
	require("FTerm").toggle()
	vim.defer_fn(function()
		local bufnr = vim.api.nvim_get_current_buf()
		if vim.api.nvim_buf_get_option(bufnr, "buftype") == "terminal" then
			local opts = { noremap = true, silent = true }
			vim.api.nvim_buf_set_keymap(bufnr, "n", "<C-x>", "i", opts)
			vim.api.nvim_buf_set_keymap(bufnr, "n", "<Esc>", "<Cmd>lua require('FTerm').toggle()<CR>", opts)
		end
	end, 10)
end, { noremap = true, silent = true })

vim.keymap.set("t", "<C-x>", function()
	local bufnr = vim.api.nvim_get_current_buf()
	vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes([[<C-\><C-n>]], true, false, true), "n", false)

	local opts = { noremap = true, silent = true }
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<C-x>", "i", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<Esc>", "<Cmd>lua require('FTerm').toggle()<CR>", opts)
end, { noremap = true, silent = true })

vim.keymap.set("t", "<Esc>", function()
	vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes([[<C-\><C-n>]], true, false, true), "n", false)
	require("FTerm").toggle()
end, { noremap = true, silent = true })

-- Disable PageUp/PageDown keys
vim.keymap.set("n", "<PageUp>", "<Nop>")
vim.keymap.set("n", "<PageDown>", "<Nop>")
vim.keymap.set("i", "<PageUp>", "<Nop>")
vim.keymap.set("i", "<PageDown>", "<Nop>")
vim.keymap.set("v", "<PageUp>", "<Nop>")
vim.keymap.set("v", "<PageDown>", "<Nop>")

-- Delete
vim.keymap.set("o", "s", "$", { noremap = true })
vim.keymap.set("n", "ds", "d$", { noremap = true })
vim.keymap.set("o", "f", "0", { noremap = true })
vim.keymap.set("n", "df", "d0", { noremap = true })

-- Disable F1
vim.keymap.set({ "n", "i", "v" }, "<F1>", "<Nop>", { noremap = true, silent = true })

-- Clear highlight search
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { silent = true })

-- Select all
vim.keymap.set("n", "<C-a>", "ggVG", { noremap = true, silent = true })
