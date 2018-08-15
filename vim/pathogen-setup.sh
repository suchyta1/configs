#!/bin/bash

wget https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash ~/git-completion.bash


function pget 
{
	if [[ ! -d  $2 ]]; then
		git clone $1 $2
	fi
}


# Make directories if we need to
vdir="$HOME/.vim/"
adir="$vdir/autoload"
pdir="$vdir/bundle"
mkdir -p $adir $pdir $vdir/tmp 


# Get pathogen if we don't have it
if [[ ! -d $adir/pathogen.vim ]]; then
	curl -LSso $adir/pathogen.vim https://tpo.pe/pathogen.vim
fi


# Get some pathogen plugins
pget https://github.com/honza/dockerfile.vim.git	$pdir/dockerfile.vim
pget https://github.com/klen/python-mode.git 		$pdir/python-mode
pget https://github.com/vim-airline/vim-airline.git $pdir/vim-airline
pget https://github.com/vim-latex/vim-latex.git		$pdir/vim-latex
pget https://github.com/reedes/vim-lexical.git		$pdir/vim-lexical
pget https://github.com/JamshedVesuna/vim-markdown-preview.git $pdir/vim-markdown-preview

if [[ ! -d $pdir/c.vim ]]; then
	pget https://github.com/vim-scripts/c.vim.git 	$pdir/c.vim	
	echo "set foldmethod=syntax" >> $pdir/c.vim/plugin/c.vim
	cp c.idioms.template $pdir/c.vim/c-support/templates/c.idioms.template
fi
