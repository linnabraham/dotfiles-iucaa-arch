call plug#begin(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/plugged"'))
Plug 'jreybert/vimagit'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'lervag/vimtex'
Plug 'preservim/nerdcommenter' " For code commenting powers
Plug 'SirVer/ultisnips' "| Plug 'honza/vim-snippets'
Plug 'preservim/nerdtree'
Plug 'dense-analysis/ale' " Latex linting
call plug#end()

" for copy to system clipboard; requires +clipboard
set clipboard=unnamedplus
set relativenumber
" Configure listchars
set listchars=tab:\|\ ,trail:·
" use my custom snippets in place of the default
let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/plugged/my-snippets/']
let g:UltiSnipsExpandTrigger       = '<Tab>'    " use Tab to expand snippets
let g:UltiSnipsJumpForwardTrigger  = '<Tab>'    " use Tab to move forward through tabstops
let g:UltiSnipsJumpBackwardTrigger = '<S-Tab>'  " use Shift-Tab to move backward through tabstops
" change default keybinding to accept coc dropdown from Ctrl+y
inoremap <expr> <CR> pumvisible() ? coc#_select_confirm() : "<CR>"
let g:vimtex_quickfix_open_on_warning = 0
nnoremap <C-n> :NERDTreeToggle %<CR>
colorscheme sorbet
" jump to the last position when reopening a file
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
let g:python3_host_prog = '/usr/bin/python3'
let g:ale_linters = {
\   'tex': ['chktex'],
\}
set tabstop=4       " Number of spaces that a <Tab> in the file counts for
set shiftwidth=4    " Number of spaces to use for each step of (auto)indent
