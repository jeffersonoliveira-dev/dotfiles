local ok_mason, mason = pcall(require, "mason")
if ok_mason then
	mason.setup()
end

local ok_mason_lspconfig, mason_lspconfig = pcall(require, "mason-lspconfig")
if ok_mason_lspconfig then
	mason_lspconfig.setup({
		ensure_installed = {
			"gopls",
			"jdtls",
			"pyright",
			"rust_analyzer",
			"solargraph",
			"ts_ls",
		},
		automatic_installation = true,
	})
end
