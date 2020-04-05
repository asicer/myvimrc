set nowrap
set number
set mouse-=a
set nobackup
set hlsearch
set wildmenu
set incsearch
set ignorecase
set matchtime=2
set nofoldenable
set encoding=UTF-8
set foldmethod=syntax
set clipboard=unnamed

set tabstop=4
set noexpandtab
set shiftwidth=4
set softtabstop=4

syntax on
let mapleader=','

nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l

nnoremap <leader>h :tab previous<cr>

set rtp+=~/.fzf

map <leader>r :NERDTreeFind<cr>
map <leader>nn :NERDTreeToggle<cr>

nmap <leader>h :bp<cr>
nmap <leader>l :bn<cr>

let g:mapleader = ','
let g:airline_theme="ravenpower"
let g:webdevicons_enable_ctrlp = 1
let g:webdevicons_conceal_nerdtree_brackets = 1
let g:ycm_autoclose_preview_window_after_completion = 1

" after a re-source, fix syntax matching issues (concealing brackets):
if exists('g:loaded_webdevicons')
    call webdevicons#refresh()
endif

let g:ackprg = "ag --vimgrep"
nnoremap <leader><leader> :silent GrepperAg <C-R>=expand("<cword>")<CR> %<CR>

" Nerdtree settings
let g:NERDTreeWinPos = 'right'
let g:NERDTreeShowBookmarks = 1
let g:NERDTreeShowLineNumbers = 1
let g:NERDTreeHighlightCursorline = 0
let g:NERDTreeDirArrowExpandable = ' '
let g:NERDTreeDirArrowCollapsible = ' '
let g:NERDTreeIgnore=['\.pyc','\.swp']

autocmd VimEnter * silent colorscheme evening
autocmd VimEnter * silent NERDTree | wincmd p
" autocmd BufWinEnter * silent NERDTreeMirror
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

autocmd BufWritePost *.vimrc silent! source %

" PEP8 check
" autocmd BufWritePost *.py call Flake8()

" Build system
autocmd filetype python nnoremap <leader>x :w <bar> exec '!clear && python '.shellescape('%')<CR>
autocmd filetype c nnoremap <leader>x :w <bar> exec '!clear && gcc '.shellescape('%').' -o /tmp/'.shellescape('%:r').' && /tmp/'.shellescape('%:r')<CR>
autocmd filetype cpp nnoremap <leader>x :w <bar> exec '!g++ '.shellescape('%').' -o /tmp/'.shellescape('%:r').' && /tmp/'.shellescape('%:r')<CR>

colorscheme evening

nnoremap <c-c> :CtrlPMRU<cr>

nnoremap <c-n> :nohl<cr>
nnoremap <c-m> :call halo#run({'shape': 'line'})<cr>
" nnoremap <leader>p :<C-u>Denite colorscheme -auto-action=preview<cr>

vmap " S"
vmap ' S'
vmap ` S`
vmap [ S[
vmap ( S(
vmap { S{
vmap } S}
vmap ] S]
vmap ) S)
vmap > S>

let g:EasyMotion_do_mapping = 0 " Disable default mappings

" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
nmap s <Plug>(easymotion-fn)
nmap f <Plug>(easymotion-overwin-f2)
nmap t <Plug>(easymotion-overwin-line)

" Turn on case-insensitive feature
let g:EasyMotion_smartcase = 1

nnoremap <Leader>b :<C-u>call gitblame#echo()<CR>

" Airline settings

" Cscope settings
cs add /Volumes/Diags/Tools/cscope/cscope.out

nmap <Leader>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <Leader>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <Leader>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <Leader>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <Leader>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <Leader>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <Leader>i :cs find i <C-R>=expand("<cfile>")<CR><CR>
nmap <Leader>d :cs find d <C-R>=expand("<cword>")<CR><CR>

let g:Tlist_Ctags_Cmd = '/usr/local/Cellar/ctags/5.8_1/bin/ctags'
nmap <leader>a :TlistToggle<cr>

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')

Plugin 'mhinz/vim-halo'
Plugin 'mhinz/vim-grepper'
Plugin 'ap/vim-buftabline'
Plugin 'mhinz/vim-startify'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'preservim/nerdtree'
Plugin 'Yggdroot/indentLine'
Plugin 'jiangmiao/auto-pairs'
Plugin 'VundleVim/Vundle.vim'
Plugin 'charz/multi-cscope-db'
Plugin 'rbgrouleff/bclose.vim'
Plugin 'google/vim-searchindex'
Plugin 'flazz/vim-colorschemes'
Plugin 'Valloric/YouCompleteMe'
Plugin 'zivyangll/git-blame.vim'
Plugin 'easymotion/vim-easymotion'

Plugin 'ryanoasis/vim-devicons'

"Plugin 'scrooloose/nerdcommenter'
"Plugin 'Xuyuanp/nerdtree-git-plugin'
"Plugin 'vim-scripts/taglist.vim'
"Plugin 'mileszs/ack.vim'
"Plugin 'ervandew/supertab'
"Plugin 'tpope/vim-surround'
"Plugin 'airblade/vim-gitgutter'
"Plugin 'roxma/nvim-yarp'
"Plugin 'Shougo/denite.nvim'
"Plugin 'roxma/vim-hug-neovim-rpc'
"Plugin 'rhysd/git-messenger.vim'
"Plugin 'vim-airline/vim-airline'
"Plugin 'vim-airline/vim-airline-themes'
"Plugin 'suan/vim-instant-markdown', {'rtp': 'after'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" call denite#custom#option('default', 'auto_action', 'preview')

" Random colorscheme
function RandomColorScheme()
  let mycolors = split(globpath(&rtp,"**/colors/*.vim"),"\n")
  exe 'so ' . mycolors[localtime() % len(mycolors)]
  unlet mycolors
endfunction

" call RandomColorScheme()

:command NewColor call RandomColorScheme()
nmap <leader>n :NewColor<cr>

function SwitchBackground()
	if stridx(execute("hi Normal"), "guibg") != -1
		hi Normal ctermfg=249 ctermbg=NONE guifg=#bbbbbb guibg=NONE
	else
		hi Normal ctermfg=249 ctermbg=234 guifg=#bbbbbb guibg=#252525
	endif
	echom("4")
endfunction

:command NewBg call SwitchBackground()
nnoremap <leader><space> :NewBg<CR>
