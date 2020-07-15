"Autoinstall Vim Plug if not installed
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

" Declare the list of plugins.
Plug 'tpope/vim-sensible'
Plug 'junegunn/seoul256.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'edkolev/tmuxline.vim'
Plug 'bling/vim-bufferline'
Plug 'dylanaraps/fff.vim'
Plug 'mbbill/undotree'
Plug 'tpope/vim-fugitive'
Plug 'Shougo/denite.nvim'
Plug 'airblade/vim-gitgutter'
Plug 'mileszs/ack.vim'
Plug 'kien/ctrlp.vim'
Plug 'arcticicestudio/nord-vim'
Plug 'dylanaraps/wal.vim'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

"Color scheme Nord
"let g:nord_italic = 1
"let g:nord_underline = 1
"let g:nord_italic_comments = 1
"colorscheme nord

" Use wal colourcheme
colorscheme wal

"Remap escape to jk
inoremap jk <ESC>

" Open fff on press of 'f'
nnoremap f :F<CR>

"fff Vertical split (NERDtree style).
let g:fff#split = "30vnew"

"Open fff split on the left side (NERDtree style).
let g:fff#split_direction = "nosplitbelow nosplitright"

"Persistent undo stored in one directory
if has("persistent_undo")
    set undodir=~/.undodir/
    set undofile
endif

" Use Ag with ack.vim
let g:ackprg = 'ag --nogroup --nocolor --column'

" Define denite mappings
autocmd FileType denite call s:denite_my_settings()
function! s:denite_my_settings() abort
  nnoremap <silent><buffer><expr> <CR>
  \ denite#do_map('do_action')
  nnoremap <silent><buffer><expr> d
  \ denite#do_map('do_action', 'delete')
  nnoremap <silent><buffer><expr> p
  \ denite#do_map('do_action', 'preview')
  nnoremap <silent><buffer><expr> q
  \ denite#do_map('quit')
  nnoremap <silent><buffer><expr> i
  \ denite#do_map('open_filter_buffer')
  nnoremap <silent><buffer><expr> <Space>
  \ denite#do_map('toggle_select').'j'
endfunction

" Undotree toggle keybind
nnoremap <F5> :UndotreeToggle<cr>

" Persistent undo
if has("persistent_undo")
    set undodir=$HOME."/.undodir"
    set undofile
endif

" Map the leader key to SPACE
let mapleader="\<SPACE>"

set showmatch           " Show matching brackets.
    set number              " Show the line numbers on the left side.
    set formatoptions+=o    " Continue comment marker in new lines.
    set expandtab           " Insert spaces when TAB is pressed.
    set tabstop=4           " Render TABs using this many spaces.
    set shiftwidth=4        " Indentation amount for < and > commands.

    set nojoinspaces        " Prevents inserting two spaces after punctuation on a join (J)

" More natural splits
    set splitbelow          " Horizontal split below current.
    set splitright          " Vertical split to right of current.

    if !&scrolloff
        set scrolloff=3       " Show next 3 lines while scrolling.
    endif
    if !&sidescrolloff
        set sidescrolloff=5   " Show next 5 columns while side-scrolling.
    endif
    set nostartofline       " Do not jump to first character with page commands.

" Use ; for commands.
nnoremap ; :
" Use Q to execute default register.
nnoremap Q @q

" Tell Vim which characters to show for expanded TABs,
" trailing whitespace, and end-of-lines. VERY useful!
if &listchars ==# 'eol:$'
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
endif

" Open file menu
nnoremap <Leader>o :CtrlP<CR>
" Open buffer menu
nnoremap <Leader>b :CtrlPBuffer<CR>
" Open most recently used files
nnoremap <Leader>f :CtrlPMRUFiles<CR>
set list                " Show problematic characters.

" Also highlight all tabs and trailing whitespace characters.
highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
match ExtraWhitespace /\s\+$\|\t/

set ignorecase          " Make searching case insensitive
set smartcase           " ... unless the query has capital letters.
set gdefault            " Use 'g' flag by default with :s/foo/bar/.

" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
endif

" Search and Replace
nmap <Leader>s :%s//g<Left><Left>

" Relative numbering
function! NumberToggle()
  if(&relativenumber == 1)
    set nornu
    set number
  else
    set rnu
  endif
endfunc

" Toggle between normal and relative numbering.
nnoremap <leader>r :call NumberToggle()<cr>
