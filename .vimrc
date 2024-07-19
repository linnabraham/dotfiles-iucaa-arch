" Set the runtimepath to include the ~/.vim/autoload directory

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


" vim-bootstrap

"*****************************************************************************
"" Vim-PLug core
"*****************************************************************************
"let vimplug_exists=expand('~/.local/share/nvim/site/autoload/plug.vim')
"
"let g:vim_bootstrap_langs = "python"
"let g:vim_bootstrap_editor = "vim"				" nvim or vim
"
"if !filereadable(vimplug_exists)
"  if !executable("curl")
"    echoerr "You have to install curl or first install vim-plug yourself!"
"    execute "q!"
"  endif
"  echo "Installing Vim-Plug..."
"  echo ""
"  silent exec "!\curl -fLo " . vimplug_exists . " --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
"  let g:not_finish_vimplug = "yes"
"
"  autocmd VimEnter * PlugInstall
"endif


" Required:
call plug#begin(expand('~/.vim/plugged'))

"*****************************************************************************
"" Plug install packages
"*****************************************************************************
Plug 'morhetz/gruvbox'
Plug 'altercation/vim-colors-solarized'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'lervag/vimtex'
Plug 'jamessan/vim-gnupg'
Plug 'preservim/nerdtree'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
call plug#end()

" -----------------------------------------------------------------------------
" Color settings
" -----------------------------------------------------------------------------
set background=dark
"let g:solarized_termcolors=256
" This needs to come last, otherwise the colors aren't correct.
syntax on



set clipboard=unnamedplus "requires +clipboard

" Formatting {
    "set autoindent                  " Indent at the same level of the previous line
    set shiftwidth=4                " Use indents of 4 spaces
    "set tabstop=4                   " An indentation every four columns
" Enable list mode
set list

" Configure listchars
set listchars=tab:\|\ ,trail:·
" }
" custom-mods {

" Uncomment the following to have Vim jump to the last position when
" reopening a file
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
" change default keybinding to accept coc dropdown from Ctrl+y
inoremap <expr> <Tab> pumvisible() ? coc#_select_confirm() : "<Tab>"
"let g:vimtex_view_general_viewer = 'mupdf'
let g:vimtex_view_method = 'mupdf'
nnoremap <C-n> :NERDTreeToggle<CR>
