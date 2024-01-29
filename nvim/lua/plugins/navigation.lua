return {
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.5',
    dependencies = { 'nvim-lua/plenary.nvim' },
    keys = {
      {
        "<leader><space>", 
        function()
            local utils = require('telescope.utils')
            local builtin = require('telescope.builtin')
            local _, ret, _ = utils.get_os_command_output({ 'git', 'rev-parse', '--is-inside-work-tree' }) 
            if ret == 0 then 
                builtin.git_files() 
            else 
                builtin.find_files() 
            end 
        end,
        desc = "Find File",
      },
      {"<leader>/", "<cmd>Telescope live_grep<cr>", desc = "Live Grep"},
      {"<leader>b", "<cmd>Telescope buffers<cr>", desc = "Buffers"},
    },
  },
}
