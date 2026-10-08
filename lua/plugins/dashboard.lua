return {
  "nvimdev/dashboard-nvim",
  lazy = false,
  dependencies = { { "nvim-tree/nvim-web-devicons" } },
  opts = function()
    -- 1. Obtener el día de la semana actual del sistema
    local today = os.date("%A")

    -- 2. Logos dinámicos de lunes a domingo (estilo ANSI Shadow de bloques sólidos)
    local logos = {
      Monday = [[
        ███╗   ███╗ ██████╗ ███╗   ██╗██████╗  █████╗ ██╗   ██╗
        ████╗ ████║██╔═══██╗████╗  ██║██╔══██╗██╔══██╗╚██╗ ██╔╝
        ██╔████╔██║██║   ██║██╔██╗ ██║██║  ██║███████║ ╚████╔╝ 
        ██║╚██╔╝██║██║   ██║██║╚██╗██║██║  ██║██╔══██║  ╚██╔╝  
        ██║ ╚═╝ ██║╚██████╔╝██║ ╚████║██████╔╝██║  ██║   ██║   
        ╚═╝     ╚═╝ ╚═════╝ ╚═╝  ╚═══╝╚═════╝ ╚═╝  ╚═╝   ╚═╝   
      ]],
      Tuesday = [[
        ████████╗██╗   ██╗███████╗███████╗██████╗  █████╗ ██╗   ██╗
        ╚══██╔══╝██║   ██║██╔════╝██╔════╝██╔══██╗██╔══██╗╚██╗ ██╔╝
           ██║   ██║   ██║█████╗  ███████╗██║  ██║███████║ ╚████╔╝ 
           ██║   ██║   ██║██╔══╝  ╚════██║██║  ██║██╔══██║  ╚██╔╝  
           ██║   ╚██████╔╝███████╗███████║██████╔╝██║  ██║   ██║   
           ╚═╝    ╚═════╝ ╚══════╝╚══════╝╚═════╝ ╚═╝  ╚═╝   ╚═╝   
      ]],
      Wednesday = [[
        ██╗    ██╗███████╗██████╗ ███╗   ██╗███████╗███████╗██████╗  █████╗ ██╗   ██╗
        ██║    ██║██╔════╝██╔══██╗████╗  ██║██╔════╝██╔════╝██╔══██╗██╔══██╗╚██╗ ██╔╝
        ██║ █╗ ██║█████╗  ██║  ██║██╔██╗ ██║█████╗  ███████╗██║  ██║███████║ ╚████╔╝ 
        ██║███╗██║██╔══╝  ██║  ██║██║╚██╗██║██╔══╝  ╚════██║██║  ██║██╔══██║  ╚██╔╝  
        ╚███╔███╔╝███████╗██████╔╝██║ ╚████║███████╗███████║██████╔╝██║  ██║   ██║   
         ╚══╝╚══╝ ╚══════╝╚═════╝ ╚═╝  ╚═══╝╚══════╝╚══════╝╚═════╝ ╚═╝  ╚═╝   ╚═╝   
      ]],
      Thursday = [[
        ████████╗██╗  ██╗██╗   ██╗██████╗ ███████╗██████╗  █████╗ ██╗   ██╗
        ╚══██╔══╝██║  ██║██║   ██║██╔══██╗██╔════╝██╔══██╗██╔══██╗╚██╗ ██╔╝
           ██║   ███████║██║   ██║██████╔╝███████╗██║  ██║███████║ ╚████╔╝ 
           ██║   ██╔══██║██║   ██║██╔══██╗╚════██║██║  ██║██╔══██║  ╚██╔╝  
           ██║   ██║  ██║╚██████╔╝██║  ██║███████║██████╔╝██║  ██║   ██║   
           ╚═╝   ╚═╝  ╚═╝ ╚═════╝ ╚═╝  ╚═╝╚══════╝╚═════╝ ╚═╝  ╚═╝   ╚═╝   
      ]],
      Friday = [[
        ███████╗██████╗ ██╗██████╗  █████╗ ██╗   ██╗
        ██╔════╝██╔══██╗██║██╔══██╗██╔══██╗╚██╗ ██╔╝
        █████╗  ██████╔╝██║██║  ██║███████║ ╚████╔╝ 
        ██╔══╝  ██╔══██╗██║██║  ██║██╔══██║  ╚██╔╝  
        ██║     ██║  ██║██║██████╔╝██║  ██║   ██║   
        ╚═╝     ╚═╝  ╚═╝╚═╝╚═════╝ ╚═╝  ╚═╝   ╚═╝   
      ]],
      Saturday = [[
         ███████╗██████╗ ████████╗██╗   ██╗██████╗ ██████╗  █████╗ ██╗   ██╗
         ██╔════╝██╔══██╗╚══██╔══╝██║   ██║██╔══██╗██╔══██╗██╔══██╗╚██╗ ██╔╝
         ███████╗███████║   ██║   ██║   ██║██████╔╝██║  ██║███████║ ╚████╔╝ 
         ╚════██║██╔══██║   ██║   ██║   ██║██╔══██╗██║  ██║██╔══██║  ╚██╔╝  
         ███████║██║  ██║   ██║   ╚██████╔╝██║  ██║██████╔╝██║  ██║   ██║   
         ╚══════╝╚═╝  ╚═╝   ╚═╝    ╚═════╝ ╚═╝  ╚═╝╚═════╝ ╚═╝  ╚═╝   ╚═╝   
      ]],
      Sunday = [[
         ███████╗██╗   ██╗███╗   ██╗██████╗  █████╗ ██╗   ██╗
         ██╔════╝██║   ██║████╗  ██║██╔══██╗██╔══██╗╚██╗ ██╔╝
         ███████╗██║   ██║██╔██╗ ██║██║  ██║███████║ ╚████╔╝ 
         ╚════██║██║   ██║██║╚██╗██║██║  ██║██╔══██║  ╚██╔╝  
         ███████║╚██████╔╝██║ ╚████║██████╔╝██║  ██║   ██║   
         ╚══════╝ ╚═════╝ ╚═╝  ╚═══╝╚═════╝ ╚═╝  ╚═╝   ╚═╝   
      ]]
    }

    -- 3. Tomar el logo de hoy y añadir márgenes arriba y abajo
    local logo = logos[today] or logos["Sunday"]
    logo = string.rep("\n", 7) .. logo .. "\n\n"

    local opts = {
      theme = "doom",
      hide = { statusline = false },
      config = {
        header = vim.split(logo, "\n"),
        center = {
          { action = "Telescope find_files",                           desc = " Buscar archivo",       icon = " ", key = "f" },
          { action = "ene | startinsert",                              desc = " Nuevo archivo",        icon = " ", key = "n" },
          { action = "Telescope oldfiles",                             desc = " Archivos recientes",       icon = " ", key = "r" },
          { action = "Telescope live_grep",                            desc = " Búsqueda global",       icon = " ", key = "g" },
          { action = "e ~/.config/nvim/init.lua",                      desc = " Configuración",        icon = " ", key = "c" },
          { action = "Lazy",                                           desc = " Plugins",        icon = "󰒲 ", key = "l" },
          { action = function() vim.api.nvim_input("<cmd>qa<cr>") end, desc = " Salir",        icon = " ", key = "q" },
        },
        footer = function()
          local stats = require("lazy").stats()
          local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
          return { "⚡ Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms" }
        end,
      },
    }

    -- 4. Pegar la tecla al final de la descripción y desplazar el bloque para centrarlo
    for _, button in ipairs(opts.config.center) do
      local desc_width = vim.api.nvim_strwidth(button.desc)
      
      -- 🕹️ Ajuste 1: distancia entre el texto y la tecla
      local target_width = 50 
      local padding = target_width - desc_width
      if padding < 0 then padding = 0 end

      -- 🕹️ Ajuste 2: desplazamiento del menú hacia la derecha (para equilibrar el lado izquierdo)
      local shift_right = 12 
      -- Añade espacios fijos a la izquierda del icono para empujar el menú a la derecha
      button.icon = string.rep(" ", shift_right) .. button.icon

      button.desc = button.desc .. string.rep(" ", padding) .. button.key
      button.key_format = ""
    end

    if vim.o.filetype == "lazy" then
      vim.api.nvim_create_autocmd("WinClosed", {
        pattern = tostring(vim.api.nvim_get_current_win()),
        once = true,
        callback = function()
          vim.schedule(function()
            vim.api.nvim_exec_autocmds("UIEnter", { group = "dashboard" })
          end)
        end,
      })
    end

    return opts
  end,
}
