-- La tecla líder debe definirse antes de crear cualquier atajo con <leader>
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.opt.number = true           -- Mostrar números de línea absolutos
vim.opt.relativenumber = false  -- Desactivar números relativos (actívalos si los necesitas)
vim.opt.expandtab = true        -- Convertir Tab en espacios
vim.opt.shiftwidth = 4          -- Indentación de 4 espacios (adecuado para C++/Python)
vim.opt.tabstop = 4             -- Un Tab equivale a 4 espacios
vim.opt.smartindent = true      -- Activar indentación inteligente

vim.opt.termguicolors = true    -- Activar color verdadero de 24 bits (Kitty lo soporta perfectamente)
vim.opt.swapfile = false        -- Desactivar los molestos archivos de intercambio .swp
vim.opt.mouse = "a"             -- Permitir el uso del ratón
vim.opt.laststatus = 3          -- Una única barra de estado global
vim.opt.clipboard = "unnamedplus" -- Compartir portapapeles entre Neovim y el sistema (muy importante)

vim.opt.formatoptions:remove({ "c", "r", "o" }) -- No continuar comentarios automáticamente al saltar de línea
vim.opt.cursorline = true                       -- Resaltar la línea del cursor
vim.opt.cursorlineopt = "number"                -- Resaltar solo el número de línea
vim.opt.iskeyword:append("-")                   -- Tratar palabras con guion como una sola
vim.opt.whichwrap:append("<,>,h,l")            -- Permitir que las flechas izquierda/derecha crucen líneas
vim.opt.wrap = false                            -- Desactivar ajuste de línea (el código largo se oculta tras el borde)

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Al iniciar Neovim y abrir archivos, no plegar ningún bloque de código por defecto
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99

-- vim.opt.foldcolumn = "1"

vim.opt.undofile = true

vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Quitar resaltado de búsqueda" })
