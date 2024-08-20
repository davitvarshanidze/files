-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
vim.api.nvim_command("command! E Explore")

vim.cmd([[
  set guicursor=n:Block,i:Block,v:Block,c:Block
]])

require("lualine").setup({
  options = {
    theme = "auto",
    component_separators = { left = "", right = "" },
    section_separators = { left = "", right = "" },
  },
  sections = {
    lualine_a = { "mode" },
    lualine_b = { "branch", "diff", "diagnostics" },
    lualine_c = {
      {
        "diagnostics",
        sources = { "nvim_lsp" },
        symbols = { error = "", warn = "", info = "", hint = "" },
      },
    },
    lualine_x = {
      "encoding",
      "fileformat",
      "filename",
      { "filetype", icon_only = true },
    },
    lualine_y = { "progress" },
    lualine_z = { "location" },
  },
})
