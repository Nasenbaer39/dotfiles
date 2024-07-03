return {
    "nvim-treesitter/nvim-treesitter",
    build = function()
	require("nvim-treesitter.install").update({ with_sync = true })()
    end,
    config = function()
	require("nvim-treesitter.configs").setup({
	    ensure_installed = {"lua", "cpp"},
	    sync_installed = false,
	    highlight = { enabled = true },
	    indent = { enabled = true },
	})
    end,
}
