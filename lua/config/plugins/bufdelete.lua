return {
  "famiu/bufdelete.nvim",
  event = "VeryLazy",
  config = function()
    vim.keymap.set("n","Q", ":lua require('bufdelete').bufdelete(0, false)<CR>", {})
  end
}
