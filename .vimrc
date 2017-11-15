" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible
set hidden
filetype off

" vundle changes
set rtp+=$HOME/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'gmarik/vundle'
Plugin 'BufOnly.vim'
Plugin 'mattn/webapi-vim'
Plugin 'mattn/gist-vim'
Plugin 'tpope/vim-rails'
Plugin 'kchmck/vim-coffee-script'
Plugin 'tpope/vim-haml'
Plugin 'tpope/vim-commentary'
Plugin 'benmills/vimux'
Plugin 'blackboard.vim'
Plugin 'pgr0ss/vimux-ruby-test'
Plugin 'while1eq1/vim-monokai-black'
Plugin 'janko-m/vim-test'
Plugin 'szw/vim-tags'
Plugin 'majutsushi/tagbar'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'wincent/command-t'
Plugin 'tpope/vim-fugitive'
Plugin 'mileszs/ack.vim'
Plugin 'ervandew/supertab'
Plugin 'tpope/vim-surround'
Plugin 'ctrlpvim/ctrlp.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required

filetype plugin indent on    " required

" Wrap gitcommit file types at the appropriate length
" filetype indent plugin on

" Add all directories under $DOTFILES/vim/vendor as runtime paths, so plugins,
" docs, colors, and other runtime files are loaded.
let vendorpaths = globpath("$HOME", ".vim", "vendor/*")
let vendorruntimepaths = substitute(vendorpaths, "\n", ",", "g")
let vendorpathslist = split(vendorpaths, "\n")

let mapleader = ","

" Change cursor shape to reflect mode
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" press F5 to get a menu of buffers. Choose the number to select
:nnoremap <F5> :buffers<CR>:buffer<Space>

nnoremap <Leader>rg :!bundle list --paths=true \| xargs ctags --extra=+f --exclude=.git --exclude=log -R *<CR><CR>
" resize current buffer by +/- 5
nnoremap <D-left> :vertical resize -5<cr>
nnoremap <C-down> :res +5<cr>
nnoremap <C-up> :res -5<cr>
nnoremap <D-right> :vertical resize +5<cr>
nmap <F8> :TagbarToggle<CR>
map <Leader>d obinding.pry<esc>:w<cr>
map <Leader>e :vnew <C-R>=escape(expand("%:p:h"), ' ') . '/'<CR>

" mapping for vimux
map <Leader>rb :call VimuxRunCommand("clear; rspec " . bufname("%"))<CR>
map <Leader>rt :call VimuxRunCommand("clear; rspec " . bufname("%") . ":" . line("."))<CR>


let the_paths = "set runtimepath^=$HOME/.vim,".vendorruntimepaths
execute the_paths

for vendorpath in vendorpathslist
  let the_path = vendorpath."/doc"
  if isdirectory(the_path)
    execute "helptags ".vendorpath."/doc"
  endif
endfor

" Ignore temp files
set wildignore=*~
set wildignore=*.*~
set wildignore=*.swp

set cpoptions+=$

if bufwinnr(1)
  map + <C-W>+
  map - <C-W>-
endif

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" performance suggestions
" https://stackoverflow.com/questions/4775605/vim-syntax-highlight-improve-performance
set nocursorcolumn
set nocursorline
set norelativenumber
set clipboard=unnamedplus
syntax sync minlines=256
" from https://github.com/vim/vim/issues/282
set lazyredraw
set re=1

" items from destroyallsoftware
set winwidth=120
" We have to have a winheight bigger than we want to set winminheight. But if
" we set winheight to be huge before winminheight, the winminheight set will
" fail.
set winheight=9
set winminheight=9
set winheight=999

set shell=/bin/zsh

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PROMOTE VARIABLE TO RSPEC LET
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! PromoteToLet()
  :normal! dd
  :exec '?^\s*it\>'
  :normal! P
  :.s/\(\w\+\) = \(.*\)$/let(:\1) { \2 }/
  :normal ==
endfunction
:command! PromoteToLet :call PromoteToLet()
:map <leader>p :PromoteToLet<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" STATUS LINE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 :set statusline=%<%f\ (%{&ft})\ %-4(%m%)%=%-19(%3l,%02c%03V%)

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SHORTCUT TO REFERENCE CURRENT FILE'S PATH IN COMMAND LINE MODE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
cnoremap <expr> %% expand('%:h').'/'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Swap panes
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! MarkWindowSwap()
    let g:markedWinNum = winnr()
endfunction

function! DoWindowSwap()
    "Mark destination
    let curNum = winnr()
    let curBuf = bufnr( "%" )
    exe g:markedWinNum . "wincmd w"
    "Switch to source and shuffle dest->source
    let markedBuf = bufnr( "%" )
    "Hide and open so that we aren't prompted and keep history
    exe 'hide buf' curBuf
    "Switch to dest and shuffle source->dest
    exe curNum . "wincmd w"
    "Hide and open so that we aren't prompted and keep history
    exe 'hide buf' markedBuf
endfunction

nmap <silent> <leader>mw :call MarkWindowSwap()<CR>
nmap <silent> <leader>pw :call DoWindowSwap()<CR>

" open previous buffer
nnoremap <leader><leader> <c-^>

" key mappings for command-t
nnoremap <silent> <Leader>f :CommandT<CR>
nnoremap <silent> <Leader>b :CommandTBuffer<CR>

" key mappings for vim-test
nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>

set nobackup    " do not keep a backup file, use versions instead
set noswapfile
set history=150   " keep 50 lines of command line history
set ruler         " show the cursor position all the time
set showcmd       " display incomplete commands
set incsearch     " do incremental searching
set vb            " turn on visual bell
set nu            " show line numbers
set sw=2          " set shiftwidth to 2
set ts=2          " set number of spaces for a tab to 2
set et            " expand tabs to spaces

" Don't use Ex mode, use Q for formatting
map Q gq

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default iletype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  " filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78
  " For all ruby files, set 'shiftwidth' and 'tabspace' to 2 and expand tabs
  " to spaces.
  autocmd FileType ruby,eruby set sw=2 ts=2 et

  autocmd BufNewFile,Bufread *.coffee set filetype=coffee

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  augroup END

else

  set autoindent    " always set autoindenting on

endif " has("autocmd")

" Easily open and reload vimrc
",v brings up my .vimrc
",V reloads it -- making all changes active (have to save first)
map ,v :sp $HOME/.vimrc<CR>
map <silent> ,V :source $HOME/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>

" Key sequence mappings
cmap %/ <C-r>=expand('%:p:h')<CR>/
" execute current line as shell command, and open output in new window
map ,x :silent . w ! sh > ~/.vim_cmd.out<CR>:new ~/.vim_cmd.out<CR>

" Character mapping
cnoremap <C-a> <Home>
cnoremap <C-f> <Right>
cnoremap <C-b> <Left>
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" Sessions ********************************************************************
set sessionoptions=blank,buffers,curdir,folds,help,options,resize,tabpages,winpos,winsize

" Text formatting
function! WordWrap(state)
  if a:state == "on"
    set lbr
  else
    set nolbr
  end
endfunction
com! WW call WordWrap("on")

" White space
let hiExtraWhiteSpace = "hi ExtraWhitespace ctermbg=red guibg=red"
exec hiExtraWhiteSpace
au ColorScheme * exec hiExtraWhiteSpace
au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
au BufRead,InsertLeave * match ExtraWhitespace /\s\+$/

" Filetypes
au BufRead,BufNewFile *.feature setfiletype cucumber

" Folding *********************************************************************
function! EnableFolding()
  set foldcolumn=2
  set foldenable
endfunction
function! DisableFolding()
  set foldcolumn=0
  set nofoldenable
endfunction
set foldmethod=syntax
call DisableFolding()

" Netrw
let g:netrw_liststyle=3
let g:netrw_browse_split=0
let g:netrw_list_hide='^\..*\.swp$'
let g:CommandTHighlightColor='blue'

" Colors *********************************************************************
syntax enable
set background=light
colorscheme blackboard
if has("gui_running")
  colorscheme blackboard
else
  set bg=dark
  colorscheme blackboard
end
set guifont=Source\ Code\ Pro\ 12
