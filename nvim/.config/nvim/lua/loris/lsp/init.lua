local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	return
end

require("loris.lsp.lsp-installer")
require("loris.lsp.handlers").setup()
