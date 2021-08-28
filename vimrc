set number
set nowrap
set mouse-=a
set nobackup
set hlsearch
set wildmenu
set incsearch
set ignorecase
set noswapfile
set tabstop=4
set expandtab
set shiftwidth=4
set softtabstop=4
set matchtime=2
set nofoldenable
set encoding=UTF-8
set relativenumber
set foldmethod=syntax
set clipboard=unnamed

let &t_SI.="\e[4 q" "SI = INSERT mode
let &t_SR.="\e[4 q" "SR = REPLACE mode
let &t_EI.="\e[4 q" "EI = NORMAL mode (ELSE)

syntax on
let mapleader=','

nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l

nnoremap <leader>h :tab previous<cr>

map <leader>r :NERDTreeFind<cr>
map <leader>nn :NERDTreeToggle<cr>

nmap <leader>q :qa<cr>
nmap <leader>h :bp<cr>
nmap <leader>l :bn<cr>

let g:mapleader = ','
let g:airline_theme="ravenpower"
let g:webdevicons_enable_ctrlp = 1
let g:webdevicons_conceal_nerdtree_brackets = 1
let g:ycm_autoclose_preview_window_after_completion = 1

" Nerdtree settings
let g:NERDTreeWinPos = 'right'
let g:NERDTreeShowBookmarks = 1
let g:NERDTreeShowLineNumbers = 1
let g:NERDTreeHighlightCursorline = 0
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let g:NERDTreeIgnore=['\.pyc','\.swp']

let g:tagbar_left=1
let g:tagbar_ctags_bin='/opt/brew/bin/ctags'

let g:git_messenger_floating_win_opts = { 'border': 'single' }
let g:git_messenger_popup_content_margins = v:false

autocmd VimEnter * silent NERDTree | wincmd p
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

autocmd BufWritePost *.vimrc silent! source %

" Build system
autocmd filetype python nnoremap <leader>x :w <bar> exec '!clear && python3 '.shellescape('%')<CR>
autocmd filetype c nnoremap <leader>x :w <bar> exec '!clear && gcc '.shellescape('%').' -o /tmp/'.shellescape('%:r').' && /tmp/'.shellescape('%:r')<CR>
autocmd filetype cpp nnoremap <leader>x :w <bar> exec '!g++ '.shellescape('%').' -o /tmp/'.shellescape('%:r').' && /tmp/'.shellescape('%:r')<CR>

nnoremap <c-c> :CtrlPMRU<cr>

nnoremap <c-n> :nohl<cr>
autocmd BufEnter * call halo#run()

nnoremap <Leader>b :<C-u>call gitblame#echo()<CR>

" Cscope settings
set csprg=/usr/local/bin/cscope
cs add /Volumes/Diags/Tools/cscope/cscope.out

nmap <Leader>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <Leader>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <Leader>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <Leader>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <Leader>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <Leader>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <Leader>i :cs find i <C-R>=expand("<cfile>")<CR><CR>
nmap <Leader>d :cs find d <C-R>=expand("<cword>")<CR><CR>

nmap <leader>a :TagbarToggle<cr>

nmap s <Plug>(easymotion-fn)
nmap f <Plug>(easymotion-overwin-f2)
nmap t <Plug>(easymotion-overwin-line)

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
Plug 'vim-voom/VOoM'
Plug 'mhinz/vim-halo'
Plug 'vimwiki/vimwiki'
Plug 'preservim/tagbar'
Plug 'ap/vim-buftabline'
Plug 'preservim/nerdtree'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-fugitive'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'mhinz/vim-startify'
Plug 'Yggdroot/indentLine'
Plug 'jiangmiao/auto-pairs'
Plug 'charz/multi-cscope-db'
Plug 'rbgrouleff/bclose.vim'
Plug 'google/vim-searchindex'
Plug 'flazz/vim-colorschemes'
Plug 'zivyangll/git-blame.vim'
Plug 'rhysd/git-messenger.vim'
Plug 'easymotion/vim-easymotion'
Plug 'dhruvasagar/vim-table-mode'
Plug 'iamcco/markdown-preview.vim'
Plug 'instant-markdown/vim-instant-markdown', {'for': 'markdown'}
call plug#end()

colorscheme evening
hi Normal ctermfg=249 ctermbg=234 guifg=#bbbbbb guibg=#252525

function SwitchBackground()
	if stridx(execute("hi Normal"), "guibg") != -1
		hi Normal ctermfg=249 ctermbg=NONE guifg=#bbbbbb guibg=NONE
	else
		hi Normal ctermfg=249 ctermbg=234 guifg=#bbbbbb guibg=#252525
	endif
	echom("4")
endfunction

let &t_ut=''
:command NewBg call SwitchBackground()
nnoremap <leader><space> :NewBg<CR>
