return {
  "nvim-treesitter/nvim-treesitter",
  version = false,
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" },
  enabled = true,
  cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
  config = function () 
    local configs = require("nvim-treesitter.configs")

    configs.setup({
      ensure_installed = { 
        "lua",
        "vimdoc",
        "javascript",
        "typescript",
        "html",
        "tsx",
        "bash",
        "markdown",
        "markdown_inline",
      },
      sync_install = true,
      highlight = { 
        enable = true,
        use_languagetree = true,
      },
      indent = { 
        enable = true
      },
    })
  end,
}
