return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  event = "VeryLazy", -- Carga diferida para no ralentizar la pantalla de inicio
  init = function()
    -- Evitar parpadeo de la barra de estado antes de cargar lualine
    vim.g.lualine_laststatus = vim.o.laststatus
    if vim.fn.argc(-1) > 0 then
      vim.o.statusline = " "
    else
      vim.o.laststatus = 0
    end
  end,
  opts = function()
    -- Restaurar la barra de estado global anterior (el 3 definido en options.lua)
    vim.o.laststatus = vim.g.lualine_laststatus

    return {
      options = {
        theme = "auto", -- Usar directamente el tema instalado
        globalstatus = true,  -- Activar una única barra de estado global
        component_separators = { left = "│", right = "│" },
        section_separators = { left = "", right = "" }, -- Usar bordes redondeados (Kitty los soporta perfectamente)
        disabled_filetypes = { 
          statusline = { "dashboard", "lazy" } -- Ocultar la barra de estado en la pantalla de inicio y en el gestor de plugins
        },
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch" },
        lualine_c = {
          {
            "diagnostics", -- Diagnósticos de errores nativos
            symbols = { error = " ", warn = " ", info = " ", hint = " " },
          },
          { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
          { 
            "filename", 
            path = 1, -- 0: solo nombre, 1: ruta relativa, 2: ruta absoluta
            symbols = { modified = "  ", readonly = "  ", unnamed = "[No Name]" }
          },
        },
        lualine_x = {
          -- Vista simple de diferencias de Git
          {
            "diff",
            symbols = { added = " ", modified = " ", removed = " " },
          },
        },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
      extensions = { "lazy" },
    }
  end,
}
