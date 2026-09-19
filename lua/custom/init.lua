local M = {}

-- add extra plugins here
M.plugins = {
    { 'MeanderingProgrammer/render-markdown.nvim' },
    { "DanieleErcole/rasmus.nvim" },
    { "DanieleErcole/min-theme.nvim" },
    { "mellow-theme/mellow.nvim" },
    { "DanieleErcole/mellow-green.nvim" },
    { "DanieleErcole/yoruish.nvim" },
    { "nickjvandyke/opencode.nvim" },
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
    },
}

-- add extra configuration options here, like extra autocmds etc.
-- feel free to create your own separate files and require them in here
M.configs = function()
    require("custom.configs.rasmus")
    require("custom.configs.min-theme")
    require("custom.configs.mellow")
    require("custom.configs.mellow-green")
    require("custom.configs.opencode")
    require("custom.configs.ibl")
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
    if vim.env.NVIM_MODE == "desktop" then
        cmd.colorscheme("yoruish")
    else
        cmd.colorscheme("min-theme")
    end
end

return M
