vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup({
  filters = { 
    custom = { "^.git$" }
  },
  view = {
    adaptive_size = true
  }
})

vim.keymap.set('n', '<leader>e', ':NvimTreeFindFileToggle<CR>')
