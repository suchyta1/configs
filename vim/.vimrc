" runtime is like the bash source command.
" I don't fully know what this is doing, I got it from Ann Elliott.
" It is at least enabling 'go to complementary enclosing character by pressing %' ...maybe other other stuff
runtime macros/matchit.vim		


set wildmenu 					" tab-completion list, like shell
set wildmode=list:longest
set ignorecase 					" need this for smartcase
set smartcase					" /searchterm is case insensitive, unless there's a capital.
set scrolloff=3 				" have at least 3 lines above or below cursor when scrolling
set hidden 						" something about hiding file instead of closing it
set hlsearch					" highlight search results
set laststatus=2				" Always show status bar
set backspace=indent,eol,start 	" Usual backspacing
set foldlevelstart=99			" Don't fold by default
"set number						" Line numbers. I go back and forth if I want this one

set backupdir=~/.vim/tmp,~/.tmp,~/tmp,/var/tmp,/tmp 	" where to save backup files
set directory=~/.vim/tmp,~/.tmp,~/tmp,/var/tmp,/tmp		" where to save swap files

set tabstop=4  		" How many spaces tab should be rendered as
set shiftwidth=4 	" When indenting with >>, how many spaces to use
					" (Somehow tabstop=shiftwidth knows to make >> a tab. I don't use expandtab.)


" Pathogen is a framework for installing filetype syntaxes
filetype off
call pathogen#infect()
call pathogen#helptags()
filetype plugin indent on
syntax on


" Python tweaks
let g:pymode_rope = 0										" I don't really  understand what rope is, but it didn't work for me
let g:pymode_rope_complete_on_dot = 0
let g:pymode_rope_lookup_project = 0
let g:pymode_options_colorcolumn = 0
let g:pymode_options_max_line_length = 1000					" I don't want a line max
let g:pymode_lint_ignore = "E231,E201,E202,E265,E303,W391"	" Ignore irrelevant errors/warnings


" Fortran tweaks
let fortran_free_source=1
let fortran_have_tabs=1
let fortran_more_precise=1
let fortran_do_enddo=1


" Spelling
augroup lexical
  autocmd!
  autocmd FileType markdown,mkd,text,tex call lexical#init({'spelllang': ['en_us'], 'spellfile': ['~/.vim/spell/en.utf-8.add']})
augroup END
let g:tex_comment_nospell=1


" The rest of the file is a bit more advanced of Vim customizations


" kj typed quickly exits insert mode
:inoremap kj <ESC>

" Noh means same thing as noh
cnoreabbrev <expr> Noh ((getcmdtype() is# ':' && getcmdline() is# 'Noh')?('noh'):('Noh'))	


" Use xclip to copy into vim from command line
" First copy something from command line, then paste it into vim
" pwd | xclip
" :V
:command V r !xclip -o 	

" Use xclip to copy from vim into command line
" First yank some text from vim, put into vim command line, then paste into external command line
" yy
" :C <ctrl-R-">
" xclip -o
:command -nargs=+ C !echo -e <q-args> | sed 's//\n/g' | xclip 	


" When in insert mode, paste whatever is in your desktop environment's clipboard, i.e. from ctrl-v (not xclip), with ctrl-v
:map! <C-v> <C-r>"


" Remember position in file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

