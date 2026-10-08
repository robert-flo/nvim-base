return {
  "NvChad/nvim-colorizer.lua",
  event = { "BufReadPost", "BufNewFile" }, 
  opts = {
    user_default_options = {
      mode = "background",
      names = false,
      -- Incluso puedes activar soporte para variables CSS, como var(--bg-color)
      css_fn = true, 
    },
  },
}
