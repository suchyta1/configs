runtime macros/matchit.vim			" Enabling extended matching between block elements (like if else) with %

set wildmenu 						" tab-completion list, like shell
set wildmode=list:longest
set ignorecase 						" need this for smartcase
set smartcase						" /searchterm is case insensitive, unless there's a capital.
set scrolloff=3 					" have at least 3 lines above or below cursor when scrolling
set hidden 							" something about hiding file instead of closing it
set hlsearch						" highlight search results
set laststatus=2					" Always show status bar
set backspace=indent,eol,start 		" Usual backspacing
set foldlevelstart=99				" Don't fold by default

set backupdir=~/.vim/tmp,~/.tmp,~/tmp,/var/tmp,/tmp 	" where to save backup files
set directory=~/.vim/tmp,~/.tmp,~/tmp,/var/tmp,/tmp		" where to save swap files

set tabstop=4  		" How many spaces tab should be rendered as
set shiftwidth=4 	" When indenting with >>, how many spaces to use
					" (Somehow tabstop=shiftwidth knows to make >> a tab. I don't use expandtab.)

" Pathogen is a framework for installing vim plugins
filetype off
call pathogen#infect()
call pathogen#helptags()
filetype plugin indent on
syntax on

" Python tweaks
autocmd FileType python setlocal nonumber			" line numbers on by default
autocmd FileType python setlocal wrap				" wrapping off by default

" YAML tweaks
autocmd FileType yaml setlocal tabstop=2
autocmd FileType yaml setlocal shiftwidth=2
autocmd FileType yaml setlocal expandtab

" Fortran tweaks
let fortran_free_source=1
let fortran_have_tabs=1
let fortran_more_precise=0
let fortran_do_enddo=1

" Spell checking for certain file types
augroup lexical
  autocmd!
  autocmd FileType markdown,mkd,tex call lexical#init({'spelllang': ['en_us'], 'spellfile': ['~/.vim/spell/en.utf-8.add']})
augroup END
let g:tex_comment_nospell=1
let g:Imap_FreezeImap=1

" Remember position in file. (Go back to where you were after at least a soft close)
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Disable ex mode
nnoremap Q <nop>

" Noh means same thing as noh
cnoreabbrev <expr> Noh ((getcmdtype() is# ':' && getcmdline() is# 'Noh')?('noh'):('Noh'))	

" When in insert mode, paste whatever is in your desktop environment's clipboard, i.e. from ctrl-v (not xclip), with ctrl-v
:map! <C-v> <C-r>"

