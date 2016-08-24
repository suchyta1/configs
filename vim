" runtime is like source
runtime macros/matchit.vim	"enable go to complementary enclosing character by pressing %...maybe other other stuff


" A bunch of stuff with vim's set. Use :set when in vim

set wildmenu 			"tab-completion list, like shell
set wildmode=list:longest

set ignorecase 			"/searchterm is case insensitive, unless there's a capital.
set smartcase			"the *-style searches are still case-sensitive

set scrolloff=3 		"have at least 3 lines above or below cursor when scrolling
set hidden 			"something about hiding file instead of closing it
set hlsearch			"highlight search results
"set number			"Line numbers
set laststatus=2		"Always show status bar
set backspace=indent,eol,start 	"Usual backspacing
set foldlevelstart=99		"Don't fold by default

set backupdir=~/.vim/tmp,~/.tmp,~/tmp,/var/tmp,/tmp 	"where to save backup files"
set directory=~/.vim/tmp,~/.tmp,~/tmp,/var/tmp,/tmp	"where to save swap files"


" Pathogen is a framework for installing filetype syntaxes
filetype off
call pathogen#infect()
call pathogen#helptags()
filetype plugin indent on
syntax on
let g:pymode_rope_complete_on_dot = 0
let g:pymode_options_colorcolumn = 0
let g:pymode_options_max_line_length = 1000
let g:pymode_lint_ignore = "E231,E201,E202"


" Other random stuff I wanted
autocmd BufNewFile,BufRead *.tex set spell							"turn on spelling when using tex file
:inoremap kj <ESC>										"kj typed quicklyexits insert mode
cnoreabbrev <expr> Noh ((getcmdtype() is# ':' && getcmdline() is# 'Noh')?('noh'):('Noh'))	"Noh means same thing as noh

:command V r !xclip -o
:command -nargs=+ C !echo -e <q-args> | sed 's//\n/g' | xclip
":map <C-c> :C 
":map <C-v> :V
:map! <C-v> <C-r>"


" Remember position in file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
