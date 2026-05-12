local opencode = require("opencode")

vim.keymap.set({ "n", "t" }, "<leader>o", function()
    opencode.toggle()
end, { desc = "Toggle opencode" })
