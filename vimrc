set runtimepath+=~/.vim_runtime

source ~/.vim_runtime/vimrcs/basic.vim
source ~/.vim_runtime/vimrcs/filetypes.vim
source ~/.vim_runtime/vimrcs/plugins_config.vim
source ~/.vim_runtime/vimrcs/extended.vim

call plug#begin('~/.vim/plugged')

Plug 'tomtom/tcomment_vim'

Plug 'valloric/youcompleteme'

Plug 'honza/vim-snippets'

Plug 'ervandew/supertab'

Plug 'airblade/vim-gitgutter'

Plug 'vim-airline/vim-airline'

Plug 'scrooloose/syntastic'

call plug#end()

set formatoptions-=tc

set spell spelllang=en_us

hi clear SpellBad
hi SpellBad ctermfg=red

try
source ~/.vim_runtime/my_configs.vim
catch
endtry
