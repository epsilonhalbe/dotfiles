return require("packer").startup(function()
  use { "nvim-treesitter/nvim-treesitter" }
  use { "folke/tokyonight.nvim" }
  use { "nvim-orgmode/orgmode",
    config = function() require("orgmode").setup{} end
  }
  use { 'lewis6991/spellsitter.nvim',
    config = function() require('spellsitter').setup() end
  }
  use { "sindrets/diffview.nvim",
    cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles" },
    module = "diffview",
    config = function() require("diffview").setup{} end,
  }
  use { "dhruvasagar/vim-table-mode" }
  use { "akinsho/org-bullets.nvim",
    config = function()
      require("org-bullets").setup {
        symbols = { "◉", "○", "✸", "✿" }
      }
    end
  }
  use({ "kazhala/close-buffers.nvim", cmd = "BDelete" })

  use { "RRethy/vim-illuminate",
    event = "CursorHold",
    module = "illuminate",
    config = function() vim.g.Illuminate_delay = 500 end,
  }

  use({
    "simrat39/symbols-outline.nvim",
    cmd = { "SymbolsOutline" },
  })

  use { "folke/which-key.nvim",
    config = function() require("which-key").setup{} end
  }
  use { "lewis6991/gitsigns.nvim",
    requires = { "nvim-lua/plenary.nvim" },
    config = function() require("gitsigns").setup{} end
  }

  use { "nvim-lualine/lualine.nvim",
    options = {
      theme = "tokyonight"
    },
    requires = {"kyazdani42/nvim-web-devicons", opt = true}
  }
  use { "blackCauldron7/surround.nvim",
    config = function()
      require"surround".setup{ mappings_style = "surround" }
    end
  }
  use { "nvim-telescope/telescope.nvim",
    requires = {
      {"nvim-lua/popup.nvim"},
      {"nvim-lua/plenary.nvim"}
    }
  }
  use { "rcarriga/nvim-notify",
    event = "VimEnter",
    config = function()
      vim.notify = require("notify")
    end,
  }
  use { "ms-jpq/coq_nvim",
    branch = "coq",
    event = "VimEnter",
    config = "vim.cmd[[COQnow]]"
        }
  use { "ms-jpq/coq.artifacts",
    branch = "artifacts"
  }
  use { "ahmedkhalf/project.nvim",
    config = function() require("project_nvim").setup{} end
  }
  use { "ms-jpq/chadtree",
    branch = "chad"
  }
  use { "glepnir/dashboard-nvim",
    options = {
      theme = "monokai_tasty"
    }
  }
  use { "phaazon/hop.nvim",
    keys = { "gh" },
    cmd = { "HopWord", "HopChar1" },
    config = function()
      vim.api.nvim_set_keymap("n", "gh", "<cmd>HopWord<cr>", {expr = true, noremap = true})
      -- require("util").nmap("s", "<cmd>HopChar1<CR>")
      -- you can configure Hop the way you like here; see :h hop-config
      require("hop").setup{}
    end,
  }
  use { "wbthomason/packer.nvim" }
  use { "junegunn/vim-easy-align" }
  use { "shoukoo/commentary.nvim",
    config = function() require("commentary").setup{} end
  }
  use { "tpope/vim-sleuth" }
  use { "lukas-reineke/indent-blankline.nvim",
    event = "BufReadPre",
    config = function() require("indent_blankline").setup{} end,
  }
  use { "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function() require("trouble").setup{} end
  }

  use { "windwp/nvim-spectre",
    opt = true,
    module = "spectre",
    wants = { "plenary.nvim", "popup.nvim" },
    requires = { "nvim-lua/popup.nvim", "nvim-lua/plenary.nvim" },
  }

  use { "kyazdani42/nvim-web-devicons",
    module = "nvim-web-devicons",
    config = function() require("nvim-web-devicons").setup{ default = true } end,
  }
end)
