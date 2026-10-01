---- Цветовая схема
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")
vim.opt.fillchars:append({ vert = " ", horiz = " ", vertleft = " ", vertright = " ", verthoriz = " " })

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
-- Базовые настройки Neovim
vim.opt.number = false
vim.opt.relativenumber = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.smartindent = true
vim.opt.wrap = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.termguicolors = true
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.updatetime = 300
vim.opt.showmatch = true
vim.opt.matchtime = 3

-- Глобальный буфер обмена
vim.opt.clipboard = "unnamedplus"

-- Лидер клавиша
vim.g.mapleader = " "

-- Кеймапы
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")
-- vim.keymap.set("n", "<leader>f", ":Format<CR>")
-- Навигация по буферам
vim.keymap.set("n", "<Tab>", ":bnext<CR>")
vim.keymap.set("n", "<S-Tab>", ":bprevious<CR>")
vim.keymap.set("n", "<leader>x", ":bdelete<CR>")

-- Навигация по окнам
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

-- Перемещение строк
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")




vim.api.nvim_set_hl(0, "WinSeparator", { fg = "NONE", bg = "NONE" })
-- Навигация по сплитам (вместо Ctrl+w hjkl)
vim.keymap.set("n", "<leader>h", "<C-w>h", { desc = "Сдвиг влево" })
vim.keymap.set("n", "<leader>j", "<C-w>j", { desc = "Сдвиг вниз" })
vim.keymap.set("n", "<leader>k", "<C-w>k", { desc = "Сдвиг вверх" })
vim.keymap.set("n", "<leader>l", "<C-w>l", { desc = "Сдвиг вправо" })

-- Оптимизация производительности
vim.opt.timeoutlen = 300
vim.opt.ttimeoutlen = 10
vim.opt.redrawtime = 1500
vim.opt.ttimeout = true

-- Оптимизация LSP
vim.lsp.set_log_level("warn")
--
-- -- Go форматирование при сохранении
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "go",
--   callback = function()
--     vim.opt_local.expandtab = false
--     vim.opt_local.shiftwidth = 0
--     vim.opt_local.tabstop = 2
--   end,
-- })

-- Отключить лишние визуальные эффекты
vim.opt.cursorline = false
vim.opt.foldmethod = "manual"
vim.opt.foldenable = false
-- инфа снизу.
vim.opt.laststatus = 0

-- LSP inlay hints
vim.lsp.inlay_hint.enable(true)

-- LSP диагностика
vim.diagnostic.config({
  virtual_text = {
    prefix = "●",
  },
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})

-- vim.cmd.colorscheme("base16-gruvbox-dark-soft")
-- Профилирование стартапа (раскомментируй для отладки)
-- vim.cmd([set laststatus=0])
-- vim.cmd([[ profile start /tmp/nvim.profile | profile func * | profile file * ]])
