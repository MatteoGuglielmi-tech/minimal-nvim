-- lua/config/plugins/treesitter-textobjects.lua
return {
  "nvim-treesitter/nvim-treesitter-textobjects",
  branch = "main",
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  config = function()
    require("nvim-treesitter-textobjects").setup({
      select = {
        enable = true,
        lookahead = true,
      },
      swap = {
        enable = true,
      },
      move = {
        enable = true,
        set_jumps = true,
      },
    })

    -- Select keymaps
    local select = require("nvim-treesitter-textobjects.select")
    -- assignment
    vim.keymap.set({ "x", "o" }, "a=", function() select.select_textobject("@assignment.outer") end, { desc = "Select outer assignment" })
    vim.keymap.set({ "x", "o" }, "i=", function() select.select_textobject("@assignment.inner") end, { desc = "Select inner assignment" })
    vim.keymap.set({ "x", "o" }, "l=", function() select.select_textobject("@assignment.lhs") end, { desc = "Select assignment lhs" })
    vim.keymap.set({ "x", "o" }, "r=", function() select.select_textobject("@assignment.rhs") end, { desc = "Select assignment rhs" })

    -- parameter
    vim.keymap.set({ "x", "o" }, "aa", function() select.select_textobject("@parameter.outer") end, { desc = "Select outer parameter" })
    vim.keymap.set({ "x", "o" }, "ia", function() select.select_textobject("@parameter.inner") end, { desc = "Select inner parameter" })

    -- condition
    vim.keymap.set({ "x", "o" }, "ai", function() select.select_textobject("@conditional.outer") end, { desc = "Select outer conditional" })
    vim.keymap.set({ "x", "o" }, "ii", function() select.select_textobject("@conditional.inner") end, { desc = "Select inner conditional" })

    -- loop
    vim.keymap.set({ "x", "o" }, "al", function() select.select_textobject("@loop.outer") end, { desc = "Select outer loop" })
    vim.keymap.set({ "x", "o" }, "il", function() select.select_textobject("@loop.inner") end, { desc = "Select inner loop" })

    -- call
    vim.keymap.set({ "x", "o" }, "af", function() select.select_textobject("@call.outer") end, { desc = "Select outer call" })
    vim.keymap.set({ "x", "o" }, "if", function() select.select_textobject("@call.inner") end, { desc = "Select inner call" })

    -- function/method defs
    vim.keymap.set({ "x", "o" }, "am", function() select.select_textobject("@function.outer") end, { desc = "Select outer function" })
    vim.keymap.set({ "x", "o" }, "im", function() select.select_textobject("@function.inner") end, { desc = "Select inner function" })

    -- class
    vim.keymap.set({ "x", "o" }, "ac", function() select.select_textobject("@class.outer") end, { desc = "Select outer class" })
    vim.keymap.set({ "x", "o" }, "ic", function() select.select_textobject("@class.inner") end, { desc = "Select inner class" })

    -- Swap keymaps
    local swap = require("nvim-treesitter-textobjects.swap")
    vim.keymap.set("n", "]a", function() swap.swap_next("@parameter.inner") end, { desc = "Swap with next parameter" })
    -- vim.keymap.set("n", "<leader>so", function() swap.swap_next("@function.outer") end, { desc = "Swap with next function" })
    vim.keymap.set("n", "[a", function() swap.swap_previous("@parameter.inner") end, { desc = "Swap with prev parameter" })
    -- vim.keymap.set("n", "<leader>po", function() swap.swap_previous("@function.outer") end, { desc = "Swap with prev function" })

    -- Move keymaps
    local move = require("nvim-treesitter-textobjects.move")

    -- funcs
    vim.keymap.set({ "n", "x", "o" }, "]m", function() move.goto_next_start("@function.outer") end, { desc = "Next function start" })
    vim.keymap.set({ "n", "x", "o" }, "]M", function() move.goto_next_end("@function.outer") end, { desc = "Next function end" })
    vim.keymap.set({ "n", "x", "o" }, "[m", function() move.goto_previous_start("@function.outer") end, { desc = "Prev function start" })
    vim.keymap.set({ "n", "x", "o" }, "[M", function() move.goto_previous_end("@function.outer") end, { desc = "Prev function end" })

    -- conditions
    vim.keymap.set({ "n", "x", "o" }, "]i", function() move.goto_next_start("@conditional.outer") end, { desc = "Next conditional start" })
    vim.keymap.set({ "n", "x", "o" }, "]I", function() move.goto_next_end("@conditional.outer") end, { desc = "Next conditional end" })
    vim.keymap.set({ "n", "x", "o" }, "[i", function() move.goto_previous_start("@conditional.outer") end, { desc = "Prev conditional start" })
    vim.keymap.set({ "n", "x", "o" }, "[I", function() move.goto_previous_end("@conditional.outer") end, { desc = "Prev conditional end" })

    -- loops
    vim.keymap.set({ "n", "x", "o" }, "]o", function() move.goto_next_start("@loop.outer") end, { desc = "Next loop start" })
    vim.keymap.set({ "n", "x", "o" }, "]O", function() move.goto_next_end("@loop.outer") end, { desc = "Next loop end" })
    vim.keymap.set({ "n", "x", "o" }, "[o", function() move.goto_previous_start("@loop.outer") end, { desc = "Prev loop start" })
    vim.keymap.set({ "n", "x", "o" }, "[O", function() move.goto_previous_end("@loop.outer") end, { desc = "Prev loop end" })
  end,
}
