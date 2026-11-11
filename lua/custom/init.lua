local M = {}

-- add extra plugins here
M.plugins = {
    { 'MeanderingProgrammer/render-markdown.nvim' },
    { "DanieleErcole/rasmus.nvim" },
    { "DanieleErcole/min-theme.nvim" },
    { "mellow-theme/mellow.nvim" },
    { "DanieleErcole/yoruish.nvim", },
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
    },
    {
        'nvim-flutter/flutter-tools.nvim',
        lazy = false,
        dependencies = {
            'nvim-lua/plenary.nvim',
        },
        config = true,
    }
}

-- add extra configuration options here, like extra autocmds etc.
-- feel free to create your own separate files and require them in here
M.configs = function()
    require("custom.configs.yoruish")
    require("custom.configs.rasmus")
    require("custom.configs.min-theme")
    require("custom.configs.mellow")
    require("custom.configs.ibl")
    require("custom.configs.flutter-tools")
end

-- add servers to be used for auto formatting here
M.formatting_servers = {
    hls = {
        filetypes = { 'haskell', 'lhaskell', 'cabal' },
        settings = {
            haskell = {
                cabalFormattingProvider = "cabal-fmt",
                formattingProvider = "ormolu"
            },
        },
    },
    rust_analyzer = {
        settings = {
            ["rust_analyzer"] = {
                cargo = {
                    allFeatures = true
                },
            },
        },
    },
    pylsp = {},
}

M.cmds = function(cmd)
    cmd.colorscheme("yoruish")
end

return M
