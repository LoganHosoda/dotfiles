vim.o.undofile = true
vim.o.clipboard = "unnamedplus"
vim.o.laststatus = 0
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.softtabstop = -1
vim.o.wrap = false                   -- No line wrapping
vim.o.scrolloff = 8                  -- Keep 8 lines visible when scrolling
vim.o.sidescrolloff = 8              -- Keep 8 columns visible when scrolling
vim.o.number = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.cmd.colorscheme("green")
vim.keymap.set('i', 'jj', '<Esc>')
vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-l>', '<C-w>l')
vim.keymap.set('n', 'H', ':bp<cr>')
vim.keymap.set('n', 'L', ':bn<cr>')
vim.keymap.set('n', '<C-n>', ':cn<cr>')
vim.keymap.set('n', '<C-p>', ':cp<cr>')
vim.keymap.set('n', '<space>y', function() vim.fn.setreg('+', vim.fn.expand('%:p')) end)
vim.keymap.set("n", "<space>c", function() vim.ui.input({}, function(c) if c and c~="" then
vim.cmd("noswapfile vnew") vim.bo.buftype = "nofile" vim.bo.bufhidden = "wipe"
vim.api.nvim_buf_set_lines(0, 0, -1, false, vim.fn.systemlist(c)) end end) end)
vim.cmd('autocmd BufNewFile,BufRead *.ejs set filetype=html')
