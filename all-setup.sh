#!/bin/bash

p_dir=$(pwd)
source_dir=$(cd $(dirname ${BASH_SOURCE[0]}) && pwd)

if [ ! -e ~/git-completion.bash ]; then
	wget https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -O ~/git-completion.bash
fi

if [ ! -d ~/.ssh ]; then
	mkdir ~/.ssh
fi
if [ ! -e ~/.ssh/config ]; then
	ln -s $source_dir/ssh/config ~/.ssh/config
fi

for name in "bash/.bashrc.common" "git/.gitconfig" "screen/.screenrc" "vim/.vimrc"; do
	fname=$(basename $name)
	if [ ! -e ~/$fname ]; then
		ln -s $source_dir/$name ~/$fname
	fi
done

cd $source_dir/vim && ./pathogen-setup.sh && cd $p_dir
