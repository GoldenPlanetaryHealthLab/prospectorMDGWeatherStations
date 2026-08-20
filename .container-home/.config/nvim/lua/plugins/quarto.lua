-- ~/.config/lazyvim-quarto/lua/plugins/quarto.lua

return {
  {
    "quarto-dev/quarto-nvim",
    ft = { "quarto", "markdown" },
    dependencies = {
      "jmbuhr/otter.nvim",
      "nvim-treesitter/nvim-treesitter",
      "jpalardy/vim-slime",
    },
    opts = {
      lspFeatures = {
        enabled = true,
        chunks = "curly",
        languages = { "r", "python", "julia", "bash", "html" },
        diagnostics = {
          enabled = true,
          triggers = { "BufWritePost" },
        },
        completion = {
          enabled = true,
        },
      },
      codeRunner = {
        enabled = true,
        default_method = "slime",
        never_run = { "yaml" },
      },
    },
    keys = function()
      local runner = require("quarto.runner")
      return {
        { "<space><cr>", runner.run_cell, desc = "Quarto: run cell" },
        { "<localleader>rc", runner.run_cell, desc = "Quarto: run cell" },
        { "<localleader>ra", runner.run_above, desc = "Quarto: run cell and above" },
        { "<localleader>rA", runner.run_all, desc = "Quarto: run all cells" },
        { "<localleader>rl", runner.run_line, desc = "Quarto: run line" },
        { "<localleader>r", runner.run_range, mode = "v", desc = "Quarto: run visual range" },
      }
    end,
  },

  {
    "jpalardy/vim-slime",
    init = function()
      vim.g.slime_target = "neovim"
      vim.g.slime_no_mappings = 1
      vim.g.slime_bracketed_paste = 1
      vim.g.slime_suggest_default = 1
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "markdown",
        "markdown_inline",
        "yaml",
        "r",
        "python",
        "bash",
        "lua",
        "html",
      },
    },
  },
}
