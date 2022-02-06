# Neovim config

## Basic installation

```bash
brew install neovim
brew install ripgrep
brew install fd

npm install -g neovim
```

## Install junegunn/vim-plug

Unix, Linux

```bash
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```

Windows (PowerShell)

```bash
iwr -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim |`
    ni "$(@($env:XDG_DATA_HOME, $env:LOCALAPPDATA)[$null -eq $env:XDG_DATA_HOME])/nvim-data/site/autoload/plug.vim" -Force
```

## Install for LSP(Use nvim-lsp-installer no need install)

```bash
npm install -g pyright typescript typescript-language-server diagnostic-languageserver vscode-langservers-extracted @angular/language-server stylelint-lsp vim-language-server vls
```

## Clone neovim config to ~/.config/nvim/

## Start up neovim, use :PlugInstall command install plug

## Known issues

1. When start up neovim, appear "curl: option --no-progress-meter: is unknown" message.
Reference: https://github.com/cuducos/nvim-treesitter/commit/d1cc077de68a37fb48210aae6dba7d0b22dd71cd

