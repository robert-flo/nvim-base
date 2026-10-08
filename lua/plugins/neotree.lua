return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-tree/nvim-web-devicons",
  },
  -- neo-tree se carga bajo demanda, así que hay que cargarlo a mano al abrir un directorio (nvim .)
  init = function()
    local arg = vim.fn.argv(0)
    if arg ~= "" and vim.fn.isdirectory(arg) == 1 then
      require("neo-tree")
    end
  end,
  -- Atajo global: Espacio+e muestra u oculta el árbol de archivos
  keys = {
    {
      "<leader>e",
      function()
        require("neo-tree.command").execute({ toggle = true, dir = vim.uv.cwd() })
      end,
      desc = "Explorer NeoTree (cwd)",
    },
  },
  opts = {
    -- Fuentes de datos que se muestran por defecto
    sources = { "filesystem", "buffers", "git_status" },
    -- Configuración del sistema de archivos
    filesystem = {
      bind_to_cwd = false,
      follow_current_file = { 
        enabled = true,         -- Ubicar automáticamente el archivo abierto actualmente
        leave_dirs_open = false -- Al expandir hasta el archivo, mantener cerrados los demás directorios para que quede ordenado
      }, 
      use_libuv_file_watcher = true, -- Vigilar cambios en el sistema de archivos y refrescar automáticamente
      hijack_netrw_behavior = "open_default", -- ✨ Reemplazar por completo el explorador de directorios nativo de Neovim (netrw)
      
      -- ✨ Ajuste clave: mostrar todos los archivos ocultos
      filtered_items = {
        visible = false,         -- Mantener en false para que se apliquen las reglas de abajo
        hide_dotfiles = false,   -- Mostrar siempre los archivos que empiezan por . (como .config, .gitignore)
        hide_gitignored = false, -- Mostrar siempre los archivos ignorados por git (compilados, caché)
        hide_hidden = false,     -- Mostrar los archivos ocultos del sistema
      },
    },
    -- Atajos dentro de la ventana (navegación fluida con h/l al estilo Vim)
    window = {
      mappings = {
        ["l"] = "open",
        ["h"] = "close_node",
        ["<space>"] = "none",
        ["Y"] = {
          function(state)
            local node = state.tree:get_node()
            local path = node:get_id()
            vim.fn.setreg("+", path, "c")
            print("Copied: " .. path)
          end,
          desc = "Copy Path to Clipboard",
        },
      },
    },
    -- Iconos de la interfaz
    default_component_configs = {
      indent = {
        with_expanders = true,
        expander_collapsed = "",
        expander_expanded = "",
        expander_highlight = "NeoTreeExpander",
      },
      git_status = {
        symbols = {
          unstaged = "󰄱",
          staged = "󰱒",
        },
      },
    },
  },
}
