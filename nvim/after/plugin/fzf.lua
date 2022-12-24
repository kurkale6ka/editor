vim.keymap.set('n', '<leader>f', ':Files<cr>')
vim.keymap.set('n', '<leader>t', ':Filetypes<cr>') -- Set 'ft
vim.keymap.set('n', '<leader>b', ':Buffers<cr>')
vim.keymap.set('n', '<leader>r', ':History<cr>') -- Recently edited files
vim.keymap.set('n', '<leader>/', ':BLines<cr>') -- Fuzzy /
vim.keymap.set('n', '<leader>G', ':BLines <c-r><c-a>') -- Fuzzy :g/
vim.keymap.set('n', '<leader>g', ':silent! Glcd <bar> exe "Rg ".input("ripgrep> ")<cr>') -- ripgrep

-- Custom help files
vim.keymap.set('n', '<leader>h', ':Files '..vim.env.XDG_CONFIG_HOME..'/repos/help<cr>')

-- " TODO: separate function, to emulate vf()
-- command! -nargs=+ VF call fzf#run(fzf#wrap({
--    \ 'source': 'locate -0 / | grep -zv "/\.\(git\|svn\|hg\)\(/\|$\)\|~$"',
--    \ 'options': '--read0 -0 -1 -m -q"'.<q-args>.'" --prompt "VF> "'
--    \ }))
-- nmap <s-space> :VF<space>

-- " Keymaps
-- command! -nargs=? Lang call fzf#run(fzf#wrap({
--    \ 'source': map(split(globpath(&rtp, 'keymap/*.vim')),
--    \              'fnamemodify(v:val, ":t:r")'),
--    \ 'sink': {keymap -> execute('setlocal keymap='.keymap)},
--    \ 'options': '-1 +m -q "'.<q-args>.'" --prompt "Keymap> "'
--    \ }))
-- nmap <leader>l :Lang<cr>

-- " Scriptnames
-- command! -nargs=? Scriptnames call fzf#run(fzf#wrap({
--    \ 'source': split(execute('scriptnames'), '\n'),
--    \ 'sink': {script -> execute('edit'.substitute(script, '^\s*\d\+:\s\+', '', ''))},
--    \ 'options': '-1 +m -q "'.<q-args>.'" --prompt "Scriptnames> "'
--    \ }))

-- Rg: ripgrep
vim.api.nvim_create_user_command('Rg',
    function(input)
        vim.call('fzf#vim#grep',
            'rg --column --line-number --no-heading --color=always --smart-case --hidden -- ' .. vim.fn.shellescape(input.args),
            1, -- was --column passed?
            vim.call('fzf#vim#with_preview'),
            input.bang -- fullscreen?
        )
    end,
    {bang = true, nargs = '*', desc = 'ripgrep'}
)