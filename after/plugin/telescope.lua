local builtin = require("telescope.builtin")
local actions = require("telescope.actions")

-- All files in the current folder
vim.keymap.set("n", "<leader>pf", builtin.find_files, {})

-- Git changes
vim.keymap.set("n", "<leader>gt", builtin.git_status, {})

-- All files in the current git repository
vim.keymap.set("n", "<C-p>", builtin.git_files, {})

-- Find a word
vim.keymap.set("n", "<leader>ps", builtin.live_grep, {})

-- Find a word under cursor
vim.keymap.set("n", "ffw", builtin.grep_string, {})

-- NEEDS TO BE SET TO gr BUT LSP OVERWRITES IT!! TODO
-- Find all lsp references
vim.keymap.set("n", "gar", builtin.lsp_references, {})

-- Find all lsp definitions
vim.keymap.set("n", "gd", builtin.lsp_definitions, {})

-- Find lsp errors in the current buffer TODO make it work in the whole repo
vim.keymap.set("n", "ee", builtin.diagnostics, {})

require("telescope").setup({
	defaults = {
		mappings = {
			i = {
				["<C-k>"] = actions.move_selection_previous,
				["<C-j>"] = actions.move_selection_next,
			},
		},
	},
})
