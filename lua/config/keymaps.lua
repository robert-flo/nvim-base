-- ==========================================
-- Alias corto para definir atajos y mantener el código limpio
-- ==========================================
local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- ==========================================
-- 1. Edición básica (Core)
-- ==========================================
-- Guardado rápido: en modo normal, inserción y visual, Ctrl+s guarda y vuelve a modo normal
map({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Guardar archivo" })

-- Limpiar resaltado de búsqueda: tras buscar, Espacio+h quita el fondo amarillo
map("n", "<leader>h", ":nohl<CR>", { desc = "Limpiar resaltado de búsqueda" })

-- ==========================================
-- 2. Divisiones y navegación entre ventanas (Window Management)
-- ==========================================
-- División vertical/horizontal
map("n", "<leader>sv", "<C-w>v", { desc = "División vertical" })
map("n", "<leader>sh", "<C-w>s", { desc = "División horizontal" })
map("n", "<leader>se", "<C-w>=", { desc = "Igualar tamaño de ventanas" })
map("n", "<leader>sx", "<cmd>close<CR>", { desc = "Cerrar ventana actual" })

-- Moverse entre ventanas: Ctrl + h/j/k/l en lugar de Ctrl+w + dirección
map("n", "<C-h>", "<C-w>h", { desc = "Ir a la ventana izquierda" })
map("n", "<C-j>", "<C-w>j", { desc = "Ir a la ventana inferior" })
map("n", "<C-k>", "<C-w>k", { desc = "Ir a la ventana superior" })
map("n", "<C-l>", "<C-w>l", { desc = "Ir a la ventana derecha" })

-- ==========================================
-- 3. Pestañas con Barbar (Buffer Navigation)
-- ==========================================
-- Cambio de pestaña intuitivo: Shift + h/l para ir a izquierda/derecha
map("n", "<S-h>", "<Cmd>BufferPrevious<CR>", { desc = "Pestaña anterior" })
map("n", "<S-l>", "<Cmd>BufferNext<CR>", { desc = "Pestaña siguiente" })

-- Cerrar la pestaña actual
map("n", "<leader>c", "<Cmd>BufferClose<CR>", { desc = "Cerrar pestaña actual" })

-- ==========================================
-- 4. Mejoras de edición (Visual Mode)
-- ==========================================
-- En modo visual (selecciona con v), J o K mayúsculas mueven el bloque abajo/arriba manteniendo la indentación
map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Mover bloque hacia abajo" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Mover bloque hacia arriba" })
