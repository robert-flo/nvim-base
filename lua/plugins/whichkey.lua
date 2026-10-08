return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    preset = "modern",
    -- 为前缀键分组命名，按下 空格 后菜单更清晰
    spec = {
      { "<leader>f", group = "搜索 (Find)" },
      { "<leader>s", group = "分屏 (Split)" },
      { "<leader>n", group = "通知 (Noice)" },
    },
  },
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "当前缓冲区快捷键 (which-key)",
    },
  },
}
