return {
    {
        'kaarmu/typst.vim',
        ft = 'typst',
        lazy = false,
    },
    {
        'chomosuke/typst-preview.nvim',
        lazy = false, -- or ft = 'typst'
        version = '1.*',
        opts = {
            open_cmd = 'zen-browser --new-window %s -P Clean'
        }, -- lazy.nvim will implicitly calls `setup {}`
        config = function ()
            require 'typst-preview'.setup {
                open_cmd = 'zen-browser --new-window %s -P Clean'
            }

            require("lspconfig")["tinymist"].setup {
                settings = {
                    formatterMode = "typstyle",
                    exportPdf = "onType",
                    semanticTokens = "disable",
                },

                on_attach = function(client, bufnr)
                    vim.keymap.set("n", "<leader>tp", function()
                        client:exec_cmd({
                            title = "pin",
                            command = "tinymist.pinMain",
                            arguments = { vim.api.nvim_buf_get_name(0) },
                        }, { bufnr = bufnr })end, 
                        { desc = "[T]inymist [P]in", noremap = true })

                    vim.keymap.set("n", "<leader>tu", function()
                        client:exec_cmd({
                            title = "unpin",
                            command = "tinymist.pinMain",
                            arguments = { vim.v.null },
                        }, { bufnr = bufnr }) end,
                        { desc = "[T]inymist [U]npin", noremap = true })
                end,
            }
        end
    },
}
