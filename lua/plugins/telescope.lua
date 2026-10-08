return {
  "nvim-telescope/telescope.nvim",
  cmd = "Telescope",
  version = "*", 
  dependencies = {
    "nvim-lua/plenary.nvim", 
    { 
      "nvim-telescope/telescope-fzf-native.nvim", 
      build = "make" 
    },
  },
  -- Atajos con carga bajo demanda, inspirados en LazyVim
  keys = {
    { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Buscar archivos (Find Files)" },
    { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Buscar texto global (Live Grep)" },
    { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Cambiar entre archivos abiertos (Buffers)" },
    { "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Archivos recientes (Recent)" },
  },
  config = function()
    local telescope = require("telescope")

    -- Configuración principal y apariencia
    telescope.setup({
      defaults = {
        prompt_prefix = " ",   -- Iconos modernos inspirados en LazyVim
        selection_caret = " ",
      },
    })

    -- Muy importante: activar el motor fzf nativo en C para acelerar la búsqueda
    telescope.load_extension("fzf")
  end,
}
