return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000, -- Mantener la máxima prioridad
    opts = {
      -- Conservar el bonito subrayado ondulado de los diagnósticos LSP
      lsp_styles = {
        underlines = {
          errors = { "undercurl" },
          hints = { "undercurl" },
          warnings = { "undercurl" },
          information = { "undercurl" },
        },
      },
      -- Activar la integración visual con plugins que usas ahora o usarás en el futuro
      integrations = {
        cmp = true,             -- Autocompletado
        blink_cmp = true,
        dashboard = true,       -- Pantalla de inicio
        gitsigns = true,        -- Indicadores de Git
        illuminate = true,      -- Resaltado de palabras iguales
        indent_blankline = { enabled = true }, -- Guías de indentación
        mason = true,           -- Gestor de paquetes LSP
        native_lsp = { enabled = true },       -- LSP nativo
        noice = true,           -- Ventanas de mensajes
        telescope = true,       -- Buscador
        treesitter = true,      -- Resaltado de sintaxis
        which_key = true,       -- Ayuda de atajos
      },
    },
    config = function(_, opts)
      -- Primero pasa las opts anteriores a catppuccin
      require("catppuccin").setup(opts)
      -- Luego activa el tema
      vim.cmd.colorscheme("catppuccin")
    end,
  }
}
