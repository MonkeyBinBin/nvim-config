if has('nvim')
 let g:plug_home = stdpath('data') . '/plugged'
endif

call plug#begin()

" for git
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'

" Auto close parentheses
Plug 'cohama/lexima.vim'

" change/add such surroundings in pairs
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'

if has('nvim')
  " statusline
  Plug 'hoob3rt/lualine.nvim'
  Plug 'kyazdani42/nvim-web-devicons'

  " browse files (side menu tree)
  Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'kristijanhusak/defx-git'
  Plug 'kristijanhusak/defx-icons'

  " integrate language server features for auto-completion and snippet
  Plug 'neovim/nvim-lspconfig'
  Plug 'williamboman/nvim-lsp-installer'
  Plug 'glepnir/lspsaga.nvim'
  Plug 'folke/lsp-colors.nvim'
  Plug 'nvim-lua/completion-nvim'

  " nvim-telescope
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'

  " nvim-treesitter
  Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }

  " nvim-comment
  Plug 'terrortylor/nvim-comment'
endif

call plug#end()
