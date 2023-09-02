local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.ensure_installed({
	"tsserver",
	"eslint",
	"rust_analyzer",
})

local cmp = require("cmp")

cmp.setup({
	preselect = "item",
	completion = {
		completeopt = "menu,menuone,noinsert",
	},
})

local cmp_select_opts = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
	["<CR>"] = cmp.mapping.confirm({ select = true }),
	["<C-Space>"] = cmp.mapping.complete(),
	["<C-k>"] = cmp.mapping.select_prev_item(cmp_select_opts),
	["<C-j>"] = cmp.mapping.select_next_item(cmp_select_opts),
})

lsp.setup_nvim_cmp({
	mapping = cmp_mappings,
})

lsp.on_attach(function(client, bufnr)
	local opts = { buffer = bufnr, remap = false }

	local file_type = vim.api.nvim_buf_get_option(bufnr, "filetype")
	local is_valid_filetype = file_type == "typescript"
		or file_type == "javascript"
		or file_type == "typescriptreact"
		or file_type == "javascriptreact"

	if is_valid_filetype then
		vim.api.nvim_create_autocmd("BufWritePre", {
			buffer = bufnr,
			command = "EslintFixAll",
		})
	end

	vim.keymap.set("n", "gd", function()
		vim.lsp.buf.definition()
	end, opts)
	vim.keymap.set("n", "gr", function()
		vim.lsp.buf.references()
	end, opts)
	vim.keymap.set("n", "K", function()
		vim.lsp.buf.hover()
	end, opts)
	vim.keymap.set("n", "L", function()
		vim.diagnostic.open_float()
	end, opts)
end)

lsp.setup()

vim.diagnostic.config({
	virtual_text = true,
})
