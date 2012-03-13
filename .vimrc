"appearance
colorscheme molokai
set t_Co=256
set background=dark

"general settings
filetype plugin indent on
filetype plugin on

"wildmenu 
set wildmenu
set wildmode=list:longest,full

"change :command to ;command
nnoremap <space> :

"Transformer mappings
"map <leader>` :NERDTreeToggle<CR>:NERDTreeMirror<CR>
map! `` <ESC>

"NerdTree {
"map <C-e> :NERDTreeToggle<CR>:NERDTreeMirror<CR>
"map <leader>e :NERDTreeFind<CR>
"nmap <leader>nt :NERDTreeFind<CR>
"let NERDTreeShowBookmarks=1
"let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr']
"let NERDTreeChDirMode=0
"let NERDTreeQuitOnOpen=1
"let NERDTreeShowHidden=1
"let NERDTreeKeepTreeInNewTab=1
" }


"Auto Complete
autocmd FileType php set omnifunc=phpcomplete#CompletePHP

"Auto indentation
set cindent
set smartindent
set autoindent

"Folding
set foldenable
set foldmethod=indent
set foldnestmax=2
set foldlevel=20
set foldlevelstart=1

"Turn on line number
set number

"Show status bar
set ruler
set laststatus=2

"Set search options
set hls is
set wrapscan
set ic

"syntax check for php
map <C-B> :w !php -l %<CR>

"compile current project
map <C-G> :!8g models.go && 8g main.go && 8l main.8 && ./8.out<CR>

"tcomment
map <leader>c <c-_><c-_>

" Zen
"let g:user_zen_expandabbr_key = '<C-e>'

"Shortcut for editing vimrc file
nmap ,ev :tabedit $MYVIMRC<cr>

"Window movements
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

"tab movements
map <right> gt
map <left> gT
map <up> :tabnew<cr>
map <down> :tabc<cr>

""""""""""""""""""""""""""""""
" => JavaScript section
"""""""""""""""""""""""""""""""
au FileType javascript call JavaScriptFold()
au FileType javascript setl fen
au FileType javascript setl nocindent
au FileType javascript set softtabstop=2
au FileType javascript set shiftwidth=2

au FileType javascript inoremap <buffer> $r return
au FileType javascript inoremap <buffer> $f //--- PH ----------------------------------------------<esc>FP2xi

function! JavaScriptFold()
	setl foldmethod=syntax
	setl foldlevelstart=1
	syn region foldBraces start=/{/ end=/}/ transparent fold keepend extend

	function! FoldText()
	return substitute(getline(v:foldstart), '{.*', '{...}', '')
	endfunction
	setl foldtext=FoldText()
endfunction

