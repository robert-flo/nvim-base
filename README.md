# Configuración de Neovim

Configuración personal de Neovim, pequeña, moderna y organizada en módulos (unos 15 plugins). No es una distribución como LazyVim, NvChad o AstroNvim: se puede leer entera en pocos minutos.

Se ve y se siente parecida a VS Code, pero ligera: explorador de archivos a la izquierda, pestañas arriba, esquema de funciones a la derecha, buscador difuso de archivos y texto, autocompletado con Tab, y errores y documentación del lenguaje para C/C++, Python y Lua. Todo se maneja con la tecla `Espacio` como prefijo; al pulsarla, which-key muestra un menú con los atajos disponibles.

## Requisitos

- Neovim 0.11 o superior
- `git`, `make` y un compilador de C (para `telescope-fzf-native` y los parsers de treesitter)
- Una [Nerd Font](https://www.nerdfonts.com/) en la terminal
- `ripgrep` (para la búsqueda global de Telescope)

## Instalación

```bash
git clone https://github.com/StatIndet/nvim.git ~/.config/nvim
nvim
```

Al abrirlo por primera vez, `lazy.nvim` se instala solo y descarga todos los plugins. Mason instala `clangd`, `pyright` y `lua_ls`.

## Estructura

```
init.lua              -- Carga options, keymaps, autocmds y lazy, en ese orden
lua/config/
  options.lua         -- Opciones del editor
  keymaps.lua         -- Atajos de teclado generales
  autocmds.lua        -- Autocomandos (vacío por ahora)
  lazy.lua            -- Arranque de lazy.nvim y tecla líder
lua/plugins/          -- Un archivo por plugin
```

## Plugins

| Área | Plugin |
|---|---|
| Gestor de plugins | lazy.nvim |
| Tema | catppuccin |
| Pantalla de inicio | dashboard-nvim |
| Pestañas de buffers | barbar |
| Barra de estado | lualine |
| Explorador de archivos | neo-tree |
| Buscador | telescope (con fzf nativo) |
| Esquema de símbolos | aerial |
| Autocompletado | blink.cmp (preset `super-tab`) |
| LSP | mason + mason-lspconfig + nvim-lspconfig (clangd, pyright, lua_ls) |
| Sintaxis | nvim-treesitter (rama main; C, C++, Python, Lua, Bash, Markdown, JavaScript, QML) |
| Mensajes/UI | noice + nvim-notify |
| Ayuda de atajos | which-key |
| Extras | nvim-autopairs, nvim-colorizer, indent-blankline |

### Opciones destacadas

- Números de línea absolutos, indentación de 4 espacios
- Portapapeles compartido con el sistema (`unnamedplus`)
- Ratón activado, sin archivos swap, historial de deshacer persistente
- Sin ajuste de línea (`wrap`), código desplegado al abrir
- Barra de estado global única
- Treesitter se desactiva en archivos de más de 100 KB

## Atajos de teclado

La tecla líder es **`Espacio`**.

### Edición general

| Atajo | Modo | Acción |
|---|---|---|
| `Ctrl+s` | Normal, inserción, visual | Guardar archivo |
| `Esc` | Normal | Quitar resaltado de búsqueda |
| `Espacio h` | Normal | Quitar resaltado de búsqueda |
| `J` / `K` | Visual | Mover el bloque seleccionado abajo/arriba (con reindentado) |

### Ventanas

| Atajo | Acción |
|---|---|
| `Espacio sv` | División vertical |
| `Espacio sh` | División horizontal |
| `Espacio se` | Igualar tamaño de ventanas |
| `Espacio sx` | Cerrar ventana actual |
| `Ctrl+h/j/k/l` | Moverse a la ventana izquierda/abajo/arriba/derecha |

### Buffers (pestañas)

| Atajo | Acción |
|---|---|
| `Shift+h` | Buffer anterior |
| `Shift+l` | Buffer siguiente |
| `Espacio c` | Cerrar buffer |

### Búsqueda (Telescope)

| Atajo | Acción |
|---|---|
| `Espacio ff` | Buscar archivos |
| `Espacio fg` | Buscar texto en todo el proyecto (live grep) |
| `Espacio fb` | Buffers abiertos |
| `Espacio fr` | Archivos recientes |
| `Espacio fs` | Símbolos del archivo actual (aerial) |

### Paneles

| Atajo | Acción |
|---|---|
| `Espacio e` | Abrir/cerrar el explorador (neo-tree) |
| `Espacio o` | Abrir/cerrar el esquema de símbolos (aerial) |
| `Espacio nh` | Historial de notificaciones |
| `Espacio nd` | Cerrar todas las notificaciones |
| `Espacio ?` | Atajos del buffer actual (which-key) |

Dentro de neo-tree:

| Tecla | Acción |
|---|---|
| `l` | Abrir |
| `h` | Colapsar carpeta |
| `Y` | Copiar la ruta al portapapeles |

### Autocompletado (blink.cmp, preset `super-tab`)

| Atajo | Acción |
|---|---|
| `Tab` | Aceptar sugerencia |
| `Ctrl+Espacio` | Abrir menú / documentación |
| `Ctrl+n` / `Ctrl+p` | Siguiente / anterior |
| `Ctrl+e` | Ocultar menú |

### Pantalla de inicio

| Tecla | Acción |
|---|---|
| `f` | Buscar archivo |
| `n` | Nuevo archivo |
| `r` | Archivos recientes |
| `g` | Búsqueda global |
| `c` | Abrir la configuración |
| `l` | Lazy (gestor de plugins) |
| `q` | Salir |

### LSP (atajos por defecto de Neovim 0.11+)

La configuración no define atajos propios de LSP; se usan los que trae Neovim:

| Atajo | Acción |
|---|---|
| `K` | Documentación |
| `grn` | Renombrar |
| `gra` | Acciones de código |
| `grr` | Referencias |
| `gri` | Implementación |
| `[d` / `]d` | Diagnóstico anterior / siguiente |
| `Ctrl+w d` | Ver el diagnóstico en una ventana flotante |

## Lo que le falta

Es una buena base, más un editor de texto bonito con LSP que un entorno de desarrollo completo para C++.

| Falta | Consecuencia |
|---|---|
| Formateador (por ejemplo `conform.nvim`) | No formatea al guardar (clang-format, black...) |
| Atajos de LSP propios | Dependes de los atajos por defecto de Neovim (`grn`, `gra`, `grr`...), que son poco conocidos |
| Depurador (`nvim-dap`) | No se puede depurar C++ desde el editor |
| Integración con Git | `gitsigns` se instala solo como dependencia, sin atajos (no hay blame, ni stage de bloques, ni lazygit) |
| Terminal integrada | No hay forma rápida de compilar y ejecutar |
| Herramientas de diagnóstico | No hay Trouble ni una lista cómoda de errores |

También hay restos sin usar: `autocmds.lua` está vacío, `keymaps.lua` declara una variable `opts` que no se usa, y el tema activa integraciones para plugins que no están instalados (`cmp`, `illuminate`).

Para usarla a diario en C++, lo recomendable sería añadir por este orden: un formateador, atajos de LSP, una herramienta de diagnósticos, integración con Git y una terminal.
