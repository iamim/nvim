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

	Plug 'scrooloose/nerdtree', Cond(!exists('g:vscode'))
	Plug 'ryanoasis/vim-devicons', Cond(!exists('g:vscode'))

	Plug 'psliwka/vim-smoothie', Cond(!exists('g:vscode'))

	Plug 'vim-airline/vim-airline', Cond(!exists('g:vscode'))
	Plug 'vim-airline/vim-airline-themes', Cond(!exists('g:vscode'))
	
	" IDE
	Plug 'neovim/nvim-lspconfig', Cond(!exists('g:vscode'))
	Plug 'williamboman/nvim-lsp-installer', Cond(!exists('g:vscode'))
	Plug 'nvim-treesitter/nvim-treesitter',  Cond(!exists('g:vscode'), {'do': ':TSUpdate'})

	" Svelte
	Plug 'leafOfTree/vim-svelte-plugin', Cond(!exists('g:vscode'))
	let g:vim_svelte_plugin_load_full_syntax = 1

	" F#
	Plug 'ionide/Ionide-vim', Cond(!exists('g:vscode'))
	Plug 'Shougo/deoplete.nvim', Cond(!exists('g:vscode'), { 'do': ':UpdateRemotePlugins' })
	Plug 'deoplete-plugins/deoplete-lsp', Cond(!exists('g:vscode'))

	Plug 'pangloss/vim-javascript', Cond(!exists('g:vscode'))
	Plug 'peitalin/vim-jsx-typescript', Cond(!exists('g:vscode'))
	Plug 'leafgarland/typescript-vim', Cond(!exists('g:vscode'))

	" Color schemes
	Plug 'morhetz/gruvbox', Cond(!exists('g:vscode'))
	Plug 'navarasu/onedark.nvim', Cond(!exists('g:vscode'))

call plug#end()

set hidden
let mapleader=" "

set scrolloff=8
set number
set relativenumber
set cursorline              " highlight current cursorline

set tabstop=4
set softtabstop=4
set shiftwidth=4
set nowrap

set autoindent
set nocompatible            " disable compatibility to old-time vi
set showmatch               " show matching 
set ignorecase              " case insensitive 
set hlsearch                " highlight search 
set incsearch               " incremental search
set autoindent              " indent a new line the same amount as the line just typed
set cc=80                   " set an 80 column border for good coding style
set mouse=a                 " enable mouse click
filetype plugin on
filetype plugin indent on   " allow auto-indenting depending on file type

syntax enable
colorscheme onedark
let g:airline_theme='onedark'

:tnoremap <Esc> <C-\><C-n>

" SPLIT MANAGEMENT
set splitbelow splitright

nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <C-k> <C-w>k
nnoremap <C-j> <C-w>j

noremap <silent> <C-Right> :vertical resize +5<CR>
noremap <silent> <C-Left> :vertical resize -5<CR>
noremap <silent> <C-Up> :resize +5<CR>
noremap <silent> <C-Down> :resize -5<CR>

map <Leader> <Plug>(easymotion-prefix)

inoremap <C-v> <C-r>*
vnoremap <C-c> "*y

nnoremap <leader>n :NERDTreeFocus<CR>
" nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" neovim native highlight_yank
augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=500}
augroup END
