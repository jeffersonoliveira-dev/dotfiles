return {
	cmd = { 'gopls' },
	filetypes = { 'go' },
	settings = {
		gopls = {
			staticcheck = true,
			gofumpt = true,
			usePlaceholders = true,
		},
	},
}
