return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    preset = "modern",
    -- Nombres para los grupos de prefijos, para que el menú sea más claro al pulsar Espacio
    spec = {
      { "<leader>f", group = "Buscar (Find)" },
      { "<leader>s", group = "Ventanas (Split)" },
      { "<leader>n", group = "Notificaciones (Noice)" },
      { "<leader>g", group = "Git" },
    },
  },
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Atajos del buffer actual (which-key)",
    },
  },
}
