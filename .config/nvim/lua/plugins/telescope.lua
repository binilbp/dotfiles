return {
    'nvim-telescope/telescope.nvim', 
    dependencies = {
        'nvim-lua/plenary.nvim',
        -- optional but recommended
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },
    keys = {
        {'<leader>ff', '<cmd>Telescope find_files<cr>',desc ='Find files' },
        {'<leader>fg', '<cmd>Telescope live_grep<cr>',desc ='Find files with text' },
    },
}
