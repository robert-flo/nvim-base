return {
  "folke/noice.nvim",
  event = "VeryLazy",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify", -- Notificaciones elegantes en la esquina superior derecha
  },
  opts = {
    lsp = {
      -- Sobrescribir el renderizado de LSP para que las ventanas de documentación se vean mejor
      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
        ["cmp.entry.get_documentation"] = true,
      },
      hover = { enabled = true },
      signature = { enabled = true },
    },
    presets = {
      bottom_search = false,        -- Desactivar la búsqueda clásica abajo y usar una ventana flotante centrada
      command_palette = true,       -- Paleta de comandos central al estilo VS Code
      long_message_to_split = true, -- Los mensajes de error largos se abren en una división para leerlos
      lsp_doc_border = true,        -- Añadir borde a la documentación flotante de LSP (a juego con el estilo redondeado)
    },
    -- Configuración de notificaciones
    messages = {
      enabled = true,
      view = "notify",              -- Enviar los mensajes por defecto a la notificación de arriba a la derecha
      view_warn = "notify",
      view_error = "notify",
    },
  },
  keys = {
    { "<leader>nh", "<cmd>Noice history<cr>", desc = "Historial de notificaciones (Noice)" },
    { "<leader>nd", "<cmd>Noice dismiss<cr>", desc = "Cerrar todas las notificaciones" },
  }
}
