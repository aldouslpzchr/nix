return {
  {
    "Davidyz/inlayhint-filler.nvim",
    keys = {
      {
        "<Leader>ci", -- Use whatever keymap you want.
        function()
          require("inlayhint-filler").fill()
        end,
        desc = "Insert the inlay-hint under cursor into the buffer.",
        mode = { "n", "v" }, -- include 'v' if you want to use it in visual selection mode
      },
    },
  },
  {
    "folke/snacks.nvim",
    opts = {
      picker = {
        enabled = true,
        actions = {
          confirm_and_close = function(picker)
            picker:action("confirm")
            picker:action("close")
          end,
          confirm_nofocus = function(picker)
            picker:action("confirm")
            picker:focus()
          end,
        },
        sources = {
          explorer = {
            auto_close = true,
            win = {
              list = {
                keys = {
                  ["L"] = "confirm_and_close",
                  ["l"] = "confirm_nofocus",
                },
              },
            },
            layout = {
              cycle = true,
              layout = {
                box = "horizontal",
                position = "float",
                height = 0.7,
                width = 0.7,
                border = "rounded",
                {
                  box = "vertical",
                  width = 40,
                  min_width = 40,
                  { win = "input", height = 1, title = "{title} {live} {flags}", border = "single" },
                  { win = "list" },
                },
                { win = "preview", width = 0, border = "left" },
              },
            },
          },
        },
      },
      terminal = {
        win = {
          position = "float",
        },
      },
    },
  },
}
