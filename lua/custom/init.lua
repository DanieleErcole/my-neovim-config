local M = {}

-- add extra plugins here
M.plugins = {
    { 'MeanderingProgrammer/render-markdown.nvim' },
    { "DanieleErcole/rasmus.nvim" },
    { "DanieleErcole/min-theme.nvim" },
    { "nickjvandyke/opencode.nvim" },
}

-- add extra configuration options here, like extra autocmds etc.
-- feel free to create your own separate files and require them in here
M.configs = function()
    require("custom.configs.rasmus")
    require("custom.configs.min-theme")
    require("custom.configs.opencode")
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
}

M.cmds = function(cmd)
    if vim.env.NVIM_MODE == "desktop" then
        cmd.colorscheme("rasmus")
    else
        cmd.colorscheme("min-theme")
    end
end

return M
