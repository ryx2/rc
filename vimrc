set runtimepath+=~/.vim_runtime

source ~/.vim_runtime/vimrcs/basic.vim
source ~/.vim_runtime/vimrcs/filetypes.vim
source ~/.vim_runtime/vimrcs/plugins_config.vim
source ~/.vim_runtime/vimrcs/extended.vim

call plug#begin('~/.vim/plugged')
" install vim awesome before copying vimrc
" ctrl + / to comment on all code file types
Plug 'tomtom/tcomment_vim'

Plug 'valloric/youcompleteme'

Plug 'honza/vim-snippets'

Plug 'ervandew/supertab'

Plug 'airblade/vim-gitgutter'

Plug 'vim-airline/vim-airline'

Plug 'scrooloose/syntastic'

" :languageToolCheck to highlight grammer 
Plug 'dpelle/vim-LanguageTool'

" use :FZF to search
Plug 'junegunn/fzf' 

Plug 'dense-analysis/ale'

call plug#end()

set formatoptions-=tc

set spell spelllang=en_us

hi clear SpellBad
hi SpellBad ctermfg=red

let g:languagetool_jar='/home/raymond/languagetool/languagetool-standalone/target/LanguageTool-4.9-SNAPSHOT/LanguageTool-4.9-SNAPSHOT/languagetool-commandline.jar'

set number relativenumber
set nu rnu

"this allows u to select text via shift V, ctrl C to put it in the system clipboard. remember to install vim-gtk3 beforehand
vnoremap <C-c> "+yy 

try
source ~/.vim_runtime/my_configs.vim
catch
endtry
