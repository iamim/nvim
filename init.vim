function! Cond(Cond, ...)
    let opts = get(a:000, 0, {})
    return a:Cond ? opts : extend(opts, { 'on': [], 'for': [] })
endfunction

call plug#begin("~/.vim/plugged")

Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'inkarkat/vim-ReplaceWithRegister'

Plug 'easymotion/vim-easymotion', Cond(!exists('g:vscode'))
Plug 'asvetliakov/vim-easymotion', Cond(exists('g:vscode'), { 'as': 'vsc-easymotion' })

Plug 'pangloss/vim-javascript', Cond(!exists('g:vscode'))
Plug 'peitalin/vim-jsx-typescript', Cond(!exists('g:vscode'))
Plug 'leafgarland/typescript-vim', Cond(!exists('g:vscode'))
Plug 'psliwka/vim-smoothie', Cond(!exists('g:vscode'))
Plug 'scrooloose/nerdtree', Cond(!exists('g:vscode'))
Plug 'ryanoasis/vim-devicons', Cond(!exists('g:vscode'))
Plug 'nvim-treesitter/nvim-treesitter',  Cond(!exists('g:vscode'), {'do': ':TSUpdate'})

Plug 'deoplete-plugins/deoplete-lsp', Cond(!exists('g:vscode'))
Plug 'ionide/Ionide-vim', Cond(!exists('g:vscode'))

if has('nvim')
    Plug 'Shougo/deoplete.nvim', Cond(!exists('g:vscode'), { 'do': ':UpdateRemotePlugins' })
else
    Plug 'Shougo/deoplete.nvim', Cond(!exists('g:vscode'))
    Plug 'roxma/nvim-yarp', Cond(!exists('g:vscode'))
    Plug 'roxma/vim-hug-neovim-rpc', Cond(!exists('g:vscode'))
endif

Plug 'leafOfTree/vim-svelte-plugin', Cond(!exists('g:vscode'))
let g:vim_svelte_plugin_load_full_syntax = 1

" Plug 'neoclide/coc.nvim', Cond(!exists('g:vscode'), {'branch':'release'})
" let g:coc_global_extensions = ['coc-tsserver',
" \ 'coc-json',
" \ 'coc-html-css-support',
" \ 'coc-svelte',
" \ 'coc-css',
" \ 'coc-sql',
" \ 'coc-yaml']
Plug 'vim-airline/vim-airline', Cond(!exists('g:vscode'))
Plug 'vim-airline/vim-airline-themes', Cond(!exists('g:vscode'))
Plug 'prettier/vim-prettier', Cond(!exists('g:vscode'), {
\ 'do': 'yarn install',
\ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] })

" Color schemes
Plug 'morhetz/gruvbox', Cond(!exists('g:vscode'))
" Plug 'joshdick/onedark.vim', Cond(!exists('g:vscode'))
" Plug 'ful1e5/onedark.vim', Cond(!exists('g:vscode'))
Plug 'navarasu/onedark.nvim', Cond(!exists('g:vscode'))

call plug#end()

set hidden
let mapleader=" "

set scrolloff=8
set number
set relativenumber

syntax enable
colorscheme onedark
let g:airline_theme='onedark'

map <Leader> <Plug>(easymotion-prefix)



inoremap <C-v> <C-r>*
vnoremap <C-c> "*y

" neovim native highlight_yank
augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=500}
augroup END
