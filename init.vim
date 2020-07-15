" �����ļ������ʽ
if has("multi_byte")
    set encoding=utf-8
    " English messages only
    "language messages zh_CN.utf-8
  
    if has('win32')
        language english
        let &termencoding=&encoding
    endif
  
    set fencs=ucs-bom,utf-8,gbk,cp936,latin1
    set formatoptions+=mM
    set nobomb " ��ʹ�� Unicode ǩ��
  
    if v:lang =~? '^\(zh\)\|\(ja\)\|\(ko\)'
        set ambiwidth=double
    endif
else
    echoerr "Sorry, this version of (g)vim was not compiled with +multi_byte"
endif

"���consle��ʾ��Ϣ�������
language messages zh_CN.utf-8
" General {{{
set scrolloff=3
set relativenumber
set nocompatible
set nofoldenable
set nobackup
set noswapfile
set history=1024
set autochdir
set whichwrap=b,s,<,>,[,]
set nobomb
set backspace=indent,eol,start whichwrap+=<,>,[,]
" Vim ��Ĭ�ϼĴ�����ϵͳ�����干��
set clipboard+=unnamed
" ���� alt ����ӳ�䵽�˵���
set winaltkeys=no

"support for python3
"let g:python3_host_prog='C:/Users/foo/Envs/neovim3/Scripts/python.exe'
"let g:python_host_prog='C:/Users/foo/Envs/neovim/Scripts/python.exe'

"setting for tags
set tags=./tags;,tags
" set find searching path
set path+=**
" Display all matching files when we tab complete
set wildmenu
" }}}

" GUI {{{
" colorscheme setting
colorscheme molokai "Tomorrow-Night-Bright
let g:rehash256 = 1
"""
set cursorline
set hlsearch
set number
set numberwidth=1
" ���ڴ�С
autocmd GUIEnter * simalt ~x
" �ָ�����Ĵ���λ�ڵ�ǰ�����±�/�ұ�
set splitbelow
set splitright

""}}}

" Format {{{
set autoindent
set smartindent
set tabstop=4
set expandtab
set softtabstop=4
set foldmethod=indent
syntax on

" }}}

" Keymap {{{
let mapleader=","

nmap <leader>s :source c:/Users/weichenxi/AppData/Local/nvim/init.vim<cr>
nmap <leader>e :e c:/Users/weichenxi/AppData/Local/nvim/init.vim<cr>
tnoremap <Esc> <C-\><C-n>
inoremap jj <Esc>

"" window control
nnoremap [Window] <Nop>
nmap s [Window]
" use sv, sg split Window in normal mode
nnoremap <silent> [Window]v :<C-u>split<CR>
nnoremap <silent> [Window]g :<C-u>vsplit<CR>

" �ƶ��ָ��
nmap <C-j> <C-W>j
nmap <C-k> <C-W>k
nmap <C-h> <C-W>h
nmap <C-l> <C-W>l

" setting for scripts language
map <leader>r :call RunScripts()<CR>
func! RunScripts()
        exec "w"
        if &filetype == 'perl'
                exec "!perl %"
        elseif &filetype == 'python'
                exec "!python %"
        elseif &filetype == 'cpp'
                exec "!clang++ % && .\\a.exe"
        elseif &filetype == 'c'
                exec "!clang % && .\\a.exe"
        endif
endfunc
"----------------------------
"" }}}

" plug for nvim {{{
call plug#begin('~/AppData/Local/nvim/plugged')
" setting for language
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'mattn/emmet-vim'
Plug 'vim-perl/vim-perl'
" code complete
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'raimondi/delimitmate'
" code reading
Plug 'scrooloose/nerdtree'
Plug 'w0rp/ale'
Plug 'ludovicchabant/vim-gutentags'
Plug 'Yggdroot/indentLine'
"Run and debug
" code edit
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'Chiel92/vim-autoformat'
Plug 'easymotion/vim-easymotion'
" buffer manager
Plug 'vim-scripts/BufOnly.vim'
Plug 'yggdroot/leaderf', { 'do': '.\install.bat' }
Plug 'mhinz/vim-startify'
" colorscheme
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()

"}}}


" Plug-Setting {{{
" airline-theme
let g:airline_theme= 'molokai'
let delimitMate_expand_cr = 1
" vim-go
let g:go_fmt_command = "goimports"
"
" -----------------------------------------------------------------------------
" nerdtree
map <F2> :NERDTreeToggle<CR>
au VimEnter * NERDTreeFind

" -----------------------------------------------------------------------------
" ale
let g:ale_lint_on_enter = 0
let g:ale_linters_explicit = 1
let g:ale_completion_delay = 500
let g:ale_echo_delay = 20
let g:ale_lint_delay = 500
let g:ale_echo_msg_format = '[%linter%] %code: %%s'
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
let g:airline#extensions#ale#enabled = 1

let g:ale_c_gcc_options = '-Wall -O2 -std=c99'
let g:ale_cpp_gcc_options = '-Wall -O2 -std=c++14'
let g:ale_c_cppcheck_options = ''
let g:ale_cpp_cppcheck_options = ''
highlight ALEWarning ctermbg=DarkBlue
" -----------------------------------------------------------------------------
" vim-commentary
autocmd FileType apache setlocal commentstring=#\ %s
" -----------------------------------------------------------------------------
" vim-autoformat
"F3�Զ���ʽ������
nnoremap <F3> :Autoformat<CR>
let g:autoformat_verbosemode=1
" -----------------------------------------------------------------------------
" easymotion setting
map ss <Plug>(easymotion-prefix)

" -----------------------------------------------------------------------------
" setting for leaderF
noremap <c-n> :LeaderfMru<CR>
noremap <m-p> :LeaderfFunction<CR>
noremap <m-n> :LeaderfBuffer<CR>
noremap <m-m> :LeaderfTag<CR>

let g:Lf_WindowHeight = 0.30

" -----------------------------------------------------------------------------
" setting for gutentags
" gutentags ��������Ŀ¼�ı�־��������Щ�ļ�/Ŀ¼����ֹͣ����һ��Ŀ¼�ݹ�
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']

" �����ɵ������ļ�������
let g:gutentags_ctags_tagfile = 'tags'
" ���Զ����ɵ� tags �ļ�ȫ������ ~/.cache/tags Ŀ¼�У�������Ⱦ����Ŀ¼
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags
" ���� ctags �Ĳ���
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

setlocal tags+=...
" ---------end of  settings-----------------------------------------------------
"  }}}
