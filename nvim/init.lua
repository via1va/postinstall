-- Загрузка ядра и плагинов
require("via.core")
require("lazy").setup("via.plugins")
-- init.lua или lua/config/lsp.lua
-- Цветовая схема
-- vim.cmd.colorscheme("base16-gruvbox-dark-hard")
-- Прозрачность фона
vim.api.nvim_create_autocmd({ "ColorScheme", "VimEnter" }, {
  callback = function()
    local hl_groups = {
      "Normal",
      "SignColumn",
      "NormalNC",
      "TelescopeBorder",
      "NvimTreeNormal",
      "EndOfBuffer",
      "MsgArea",
      "LineNr",
      "LineNrAbove",
      "LineNrBelow",
      "CursorLineNr",
      "StatusLine",
      "StatusLineNC",
      "TabLine",
      "TabLineFill",
      "TabLineSel",
      "WinBar",
      "WinBarNC",
      "lualine_c_normal",
      "lualine_c_insert",
      "lualine_c_visual",
      "lualine_c_replace",
      "lualine_c_command",
    }
    for _, name in ipairs(hl_groups) do
      vim.cmd(string.format("highlight %s ctermbg=none guibg=none", name))
    end
  end,
})
