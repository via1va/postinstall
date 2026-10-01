return {
  -- Цветовые схемы (приоритетная загрузка)
  {
    "RRethy/nvim-base16",
    priority = 1000,
  },
  -- --
  {
    "uZer/pywal16.nvim",
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("pywal16")
    end,
  },

  -- Файловый менеджер
  {
    "nvim-tree/nvim-tree.lua",

    config = function()
      require("nvim-tree").setup({
        view = {
          width = 20,
          side = "left",
        },

        renderer = {
          indent_markers = {
            enable = false,
          },

          icons = {
            show = {
              file = false,
              folder = false,
              folder_arrow = false,
              git = false,
              modified = false,
              diagnostics = false,
            },

            glyphs = {
              folder = {
                arrow_closed = " ",
                arrow_open = " ",
              },
            },
          },
        },
      })
    end,
  },
  --
  --
  -- Mason для управления LSP  -- Mason для управления LSP
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "gopls", "lua_ls", "pyright", "ts_ls", "eslint" },
      })
    end,
  },

  -- Автодополнение (по событию)
  {
    "hrsh7th/nvim-cmp",
    event = { "InsertEnter", "CmdlineEnter" },
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
    },
    config = function()
      local cmp = require("cmp")
      cmp.setup({
        mapping = cmp.mapping.preset.insert({
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "buffer" },
          { name = "path" },
        }),
      })
    end,
  },

  -- Подсветка синтаксиса (по событию)
  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("nvim-treesitter").setup({
        ensure_installed = { "lua", "python", "javascript", "typescript", "tsx", "html", "css", "json" },
        highlight = { enable = true },
        indent = { enable = true },
      })
    end,
  },

  -- Статусная строка (VeryLazy)
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    config = function()
      require('lualine').setup {
        options = {
          icons_enabled = true,
          theme = 'auto',
          component_separators = { left = ' ', right = ' ' },
          section_separators = { left = ' ', right = '' },
          disabled_filetypes = {
            statusline = {},
            winbar = {},
          },
          ignore_focus = {},
          always_divide_middle = true,
          always_show_tabline = true,
          globalstatus = false,
          refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
            refresh_time = 16, -- ~60fps
            events = {
              'WinEnter',
              'BufEnter',
              'BufWritePost',
              'SessionLoadPost',
              'FileChangedShellPost',
              'VimResized',
              'Filetype',
              'CursorMoved',
              'CursorMovedI',
              'ModeChanged',
            },
          }
        },
        sections = {
          -- lualine_a = { 'mode' },
          lualine_b = { 'diff', 'diagnostics' },
          lualine_x = { 'fileformat', 'filetype' },
          lualine_y = { 'progress' },
          lualine_z = { 'location' },
          lualine_c = { 'branch ', 'filename' },
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = { 'filename' },
          lualine_x = { 'location' },
          lualine_y = {},
          lualine_z = {}
        },
        tabline = {},
        winbar = {},
        inactive_winbar = {},
        extensions = {}
      }
    end,
  },

  -- Git интеграция (по событию)
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("gitsigns").setup()
    end,
  },
  -- Автопары скобок (по событию)
  {
    "windwp/nvim-autopairs",
    event = { "InsertEnter" },
    config = function()
      require("nvim-autopairs").setup()
    end,
  },

  -- Комментарии (по событию)


  { 'nvim-mini/mini.comment', version = '*' },

  -- -- Буферная строка (VeryLazy)
  {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    config = function()
      require("bufferline").setup({
        options = {
          separator_style = "thin",
          show_buffer_icons = false,
          show_buffer_close_icons = false,
          show_close_icon = false,
        },
      })
    end,
  },
  -- Форматирование

  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    config = function()
      require("conform").setup({
        formatters_by_ft = {
          lua = { "stylua" },
          python = { "black" },
          go = { "gofmt", "goimports" },
          javascript = { "prettier" },
          typescript = { "prettier" },
          javascriptreact = { "prettier" },
          typescriptreact = { "prettier" },
          html = { "prettier" },
          css = { "prettier" },
          json = { "prettier" },
        },
        format_on_save = {
          timeout_ms = 500,
          lsp_fallback = true,
        },
      })
    end,
  },

  -- React разработка (по Filetype)
  {
    "windwp/nvim-ts-autotag",
    ft = { "html", "javascript", "typescript", "javascriptreact", "typescriptreact" },
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
  -- Быстрая навигация (по клавишам - lazy load)
  {
    "ggandor/leap.nvim",
    keys = { "s", "S" },
    config = function()
      require("leap").add_default_mappings()
    end,
  },

  -- Which-key для подсказок (VeryLazy)
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
      require("which-key").setup()
    end,
  },

  -- Улучшенные UI элементы (VeryLazy)
  {
    "stevearc/dressing.nvim",
    event = "VeryLazy",
  },
  { "sonjiku/yawnc.nvim" },
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      require("toggleterm").setup({
        size = 12,
        open_mapping = [[<c-t>]],
        hide_numbers = true,
        shade_filetypes = {},
        shade_terminals = true,
        shading_factor = 2,
        start_in_insert = true,
        insert_mappings = true,
        persist_size = true,
        direction = "float",
        close_on_exit = true,
        shell = vim.o.shell,
        float_opts = {
          border = "curved",
          winblend = 0,
          highlights = {
            border = "Normal",
            background = "Normal",
          },
        },
      })

      -- Кеймапы для переключения терминалов
      vim.keymap.set("n", "<c-t>", "<cmd>ToggleTerm<CR>", { desc = "Toggle Terminal" })
      vim.keymap.set("n", "<leader>1", "<cmd>ToggleTerm 1<CR>", { desc = "Terminal 1" })
    end,
  },
 
  { 'nvim-mini/mini.nvim',  version = false },

    event = 'VimEnter',
    config = function() require("vgit").setup() end,
  }, -- Lua
  {
    'Pocco81/true-zen.nvim',},
    { 'thembones79/mine-pine' }
}
