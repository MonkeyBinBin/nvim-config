if !exists('g:loaded_lspsaga') | finish | endif

lua << EOF
local saga = require 'lspsaga'

-- custom option here
saga.init_lsp_saga {
  border_style = "round",
}

-- default config
-- saga.init_lsp_saga()

EOF

" async lsp finder
nnoremap <silent> gh :Lspsaga lsp_finder<CR>

" code action
nnoremap <silent> <leader>ca :Lspsaga code_action<CR>
vnoremap <silent> <leader>ca :<C-U>Lspsaga range_code_action<CR>

" hover doc
nnoremap <silent> K :Lspsaga hover_doc<CR>
" show signature help
nnoremap <silent> <C-k> :Lspsaga signature_help<CR>
" hover doc/signature help scroll down
nnoremap <silent> <C-d> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>
" hover doc/signature help scroll up
nnoremap <silent> <C-u> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>

" rename
nnoremap <silent> gr :Lspsaga rename<CR>

" show diagnostics
nnoremap <silent> <leader>cd :Lspsaga show_line_diagnostics<CR>
" jump diagnostic
nnoremap <silent> [e :Lspsaga diagnostic_jump_next<CR>
nnoremap <silent> ]e :Lspsaga diagnostic_jump_prev<CR>

