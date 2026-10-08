return {
    "mason-org/mason-lspconfig.nvim",
    opts = {
        ensure_installed = { "pyright", "lua_ls", "bashls" },
    },
    dependencies = {
        { "mason-org/mason.nvim", opts = { ui = { border = "rounded" } } },
        "neovim/nvim-lspconfig",
    },
    config = function(_, opts)
        require("mason-lspconfig").setup(opts)
        -- clangd se usa desde el sistema (pacman), no desde Mason
        vim.lsp.enable("clangd")
    end,
}
