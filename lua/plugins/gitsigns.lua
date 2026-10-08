return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    -- Mostrar quién modificó la línea actual y cuándo, al final de la línea
    current_line_blame = false,
    on_attach = function(bufnr)
      local gs = require("gitsigns")
      local function map(mode, lhs, rhs, desc)
        vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
      end

      -- Navegar entre bloques de cambios (hunks)
      map("n", "]h", function() gs.nav_hunk("next") end, "Siguiente cambio (Git)")
      map("n", "[h", function() gs.nav_hunk("prev") end, "Cambio anterior (Git)")

      -- Acciones sobre el bloque actual
      map("n", "<leader>gp", gs.preview_hunk, "Previsualizar cambio")
      map("n", "<leader>gs", gs.stage_hunk, "Preparar cambio (stage)")
      map("n", "<leader>gr", gs.reset_hunk, "Descartar cambio")
      map("n", "<leader>gS", gs.stage_buffer, "Preparar todo el archivo")
      map("n", "<leader>gR", gs.reset_buffer, "Descartar todo el archivo")
      map("n", "<leader>gb", function() gs.blame_line({ full = true }) end, "Autor de la línea (blame)")
      map("n", "<leader>gB", gs.toggle_current_line_blame, "Alternar blame en línea")
      map("n", "<leader>gd", gs.diffthis, "Ver diferencias del archivo")
    end,
  },
}
