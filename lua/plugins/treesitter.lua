return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" }, -- Solo se carga al abrir un archivo real, para acelerar el arranque
  config = function()
    -- 1. Lista de lenguajes a instalar (incluye js y qmljs)
    local parsers = {
      "c", "cpp", "python", "lua", "bash", "markdown", 
      "javascript", "qmljs" 
    }

    -- 2. Instalar de forma asíncrona los parsers que falten (imita el antiguo ensure_installed)
    vim.defer_fn(function()
      require("nvim-treesitter").install(parsers)
    end, 0)

    -- 3. Protección para archivos grandes
    local function is_large_file(buf)
      local max_filesize = 100 * 1024 -- Umbral de 100 KB
      -- Usar vim.uv en lugar del antiguo vim.loop
      local ok, stats = pcall(vim.uv.fs_stat, vim.api.nvim_buf_get_name(buf))
      return ok and stats and stats.size > max_filesize
    end

    -- 4. Rama main: activar el resaltado con la API nativa de Neovim
    vim.api.nvim_create_autocmd("FileType", {
      group = vim.api.nvim_create_augroup("my_native_treesitter", { clear = true }),
      callback = function(ev)
        -- Si es un archivo grande, salir sin activar nada
        if is_large_file(ev.buf) then
          return
        end

        -- Intentar iniciar el resaltado de sintaxis nativo de Neovim
        pcall(vim.treesitter.start, ev.buf)

        -- Activar también el plegado de código basado en el árbol de sintaxis
        vim.opt_local.foldmethod = "expr"
        vim.opt_local.foldexpr = "v:lua.vim.treesitter.foldexpr()"
      end,
    })
  end,
}
