if !exists('g:lazygit_use_neovim_remote') | finish | endif

" setup mapping to call :LazyGit
nnoremap <silent> <leader>gg :LazyGit<CR>
