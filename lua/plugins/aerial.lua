return {
  "stevearc/aerial.nvim",
  dependencies = {
     "nvim-treesitter/nvim-treesitter",
     "nvim-tree/nvim-web-devicons"
  },
  -- Atajos globales muy cómodos
  keys = {
    { "<leader>o", "<cmd>AerialToggle!<CR>", desc = "Vista de esquema (Aerial)" },
    -- Integración con Telescope: búsqueda difusa entre todas las funciones/variables del archivo actual
    { "<leader>fs", "<cmd>Telescope aerial<CR>", desc = "Buscar símbolos del archivo (Symbols)" },
  },
  opts = {
    -- Prioridad de motores: primero LSP (el más preciso), luego Treesitter
    backends = { "lsp", "treesitter", "markdown" },
    
    layout = {
      -- Ajuste clave: abrir siempre a la derecha de la pantalla, como en VS Code
      default_direction = "prefer_right", 
      max_width = { 40, 0.2 },
      width = nil,
      min_width = 15,
    },
    
    -- Indicador visual: en el esquema de la derecha, resalta la función en la que estás
    highlight_mode = "split_width",
    
    -- Al mover el cursor por el esquema, el código de la izquierda se desplaza en tiempo real
    autojump = true,
    
    -- Al pulsar Enter sobre una función y saltar a ella, el panel de esquema sigue abierto
    close_on_select = false,
    
    -- Mostrar guías de conexión del árbol para una interfaz con más jerarquía
    show_guides = true,
    guides = {
      mid_item = "├─",
      last_item = "└─",
      nested_top = "│ ",
      whitespace = "  ",
    },
  },
  -- Carga la extensión de Telescope
  config = function(_, opts)
    require("aerial").setup(opts)
    require("telescope").load_extension("aerial")
  end,
}
