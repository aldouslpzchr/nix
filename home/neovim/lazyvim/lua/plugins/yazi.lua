if true then
  return {}
end
return {
  {
    "folke/snacks.nvim",
    keys = {
      { "<leader>e", false },
      { "<leader>E", false },
    },
  },
  {
    "mikavilpas/yazi.nvim",
    keys = {
      {
        "<leader>e",
        function()
          require("yazi").yazi()
        end,
        desc = "Toggle Yazi (root dir)",
      },
      {
        "<leader>E",
        function()
          require("yazi").yazi(nil, vim.fn.getcwd())
        end,
        desc = "Toggle Yazi (cwd)",
      },
    },
  },
}
