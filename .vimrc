let mapleader = " "
" An example for a vimrc file.
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file
endif
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching
"==========================================================================
"My Setting-sunshanlu
"==========================================================================
vmap <leader>y :w! /tmp/vitmp<CR>
nmap <leader>p :r! cat /tmp/vitmp<CR>

"语法高亮
syntax enable
syntax on
"显示行号
set nu

"修改默认注释颜色
"hi Comment ctermfg=DarkCyan
"允许退格键删除
"set backspace=2
"启用鼠标
set mouse=a
set selection=exclusive
set selectmode=mouse,key
"按C语言格式缩进
set cindent
set autoindent
set smartindent
set shiftwidth=4

" 允许在有未保存的修改时切换缓冲区
"set hidden

" 设置无备份文件
set writebackup
set nobackup

"显示括号匹配
set showmatch
"括号匹配显示时间为1(单位是十分之一秒)
set matchtime=5
"显示当前的行号列号：
set ruler
"在状态栏显示正在输入的命令
set showcmd

set foldmethod=syntax
"默认情况下不折叠
set foldlevel=100
" 开启状态栏信息
set laststatus=2
" 命令行的高度，默认为1，这里设为2
set cmdheight=2


" 显示Tab符，使用一高亮竖线代替
set list
"set listchars=tab:\|\ ,
set listchars=tab:>-,trail:-


"侦测文件类型
filetype on
"载入文件类型插件
filetype plugin on
"为特定文件类型载入相关缩进文件
filetype indent on
" 启用自动补全
filetype plugin indent on 


"设置编码自动识别, 中文引号显示
filetype on "打开文件类型检测
"set fileencodings=euc-cn,ucs-bom,utf-8,cp936,gb2312,gb18030,gbk,big5,euc-jp,euc-kr,latin1
set fileencodings=utf-8,gb2312,gbk,gb18030
"这个用能很给劲，不管encoding是什么编码，都能将文本显示汉字
"set termencoding=gb2312
set termencoding=utf-8
"新建文件使用的编码
set fileencoding=utf-8
"set fileencoding=gb2312
"用于显示的编码，仅仅是显示
set encoding=utf-8
"set encoding=utf-8
"set encoding=euc-cn
"set encoding=gbk
"set encoding=gb2312
"set ambiwidth=double
set fileformat=unix
set guicursor=n-c-v:ver50-ncvCursor


"设置高亮搜索
set hlsearch
exec "nohlsearch"
"在搜索时，输入的词句的逐字符高亮
set incsearch

" 着色模式
set t_Co=256
"colorscheme wombat256mod
"colorscheme gardener
"colorscheme elflord
colorscheme desert
"colorscheme evening
"colorscheme darkblue
"colorscheme torte
"colorscheme default

" 字体 && 字号
set guifont=Monaco:h10
"set guifont=Consolas:h10

" :LoadTemplate       根据文件后缀自动加载模板
"let g:template_path='/home/ruchee/.vim/template/'

" :AuthorInfoDetect   自动添加作者、时间等信息，本质是NERD_commenter && authorinfo的结合
""let g:vimrc_author='sunshanlu'
""let g:vimrc_email='sunshanlu@baidu.com'
""let g:vimrc_homepage='http://www.sunshanlu.com'
"
"
" Ctrl + E            一步加载语法模板和作者、时间信息
""map <c-e> <ESC>:AuthorInfoDetect<CR><ESC>Gi
""imap <c-e> <ESC>:AuthorInfoDetect<CR><ESC>Gi
""vmap <c-e> <ESC>:AuthorInfoDetect<CR><ESC>Gi


""'" ======= 引号 && 括号自动匹配 ======= "

""inoremap ( ()<ESC>i
""
""inoremap ) <c-r>=ClosePair(')')<CR>
""
""inoremap { {}<ESC>i
""
""inoremap } <c-r>=ClosePair('}')<CR>
""
""inoremap [ []<ESC>i
""
""inoremap ] <c-r>=ClosePair(']')<CR>
""
"""inoremap < <><ESC>i
""
"""inoremap > <c-r>=ClosePair('>')<CR>
""
""inoremap " ""<ESC>i
""
""inoremap ' ''<ESC>i
""
"""inoremap ` ``<ESC>i
""
""":inoremap * **<ESC>i
""function ClosePair(char)
"" 	if getline('.')[col('.') - 1] == a:char
"" 		return "\<Right>"
"" 	else
"" 		return a:char
"" 	endif
""endf
"" 
""function CloseBracket()
"" 	if match(getline(line('.') + 1), '\s*}') < 0
"" 		return "\<CR>}"
"" 	else
"" 		return "\<Esc>j0f}a"
"" 	endif
""endf
"" 
""function QuoteDelim(char)
""	let line = getline('.')
"" 	let col = col('.')
"" 	if line[col - 2] == "\\"
"" 	"Inserting a quoted quotation mark into the string
""		return a:char
""	elseif line[col - 1] == a:char
"" "Escaping out of the string
"" 		return "\<Right>"
"" 	else
"" "Starting a string
"" 		return a:char.a:char."\<Esc>i"
""	endif
""endf
""
" 每行超过80个的字符用下划线标示
""au BufRead,BufNewFile *.s,*.asm,*.h,*.c,*.cpp,*.java,*.cs,*.lisp,*.el,*.erl,*.tex,*.sh,*.lua,*.pl,*.php,*.tpl,*.py,*.rb,*.erb,*.vim,*.js,*.jade,*.coffee,*.css,*.xml,*.html,*.shtml,*.xhtml Underlined /.\%81v/
"
"
" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")
" This is an alternative that also works in block mode, but the deleted

" text is lost and it only works for putting the current register.
"vnoremap p "_dp

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 80 characters.
  autocmd FileType text setlocal textwidth=80

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" 增加鼠标行高亮
"set cursorline
"hi CursorLine  cterm=NONE   ctermbg=darkred ctermfg=white

" 设置tab是四个空格
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2

set backspace=indent,eol,start
set foldmethod=indent
set autochdir
set laststatus=2
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal!g'\"" | endif

" 主要给Tlist使用
let Tlist_Exit_OnlyWindow = 1
let Tlist_Auto_Open = 1

"自动缩进
set autoindent
"设置复制时的缩进
set copyindent
"在命令模式下 tab自动补全
set wildmenu
set wildmode=longest,list,full
if &term =~ "xterm\\|rxvt"
  " use an orange cursor in insert mode
  let &t_SI = "\<Esc>]12;black\x7"
  " use a red cursor otherwise
  let &t_EI = "\<Esc>]12;red\x7"
  silent !echo -ne "\033]12;black\007"
  "" Reset Cursor when vim exits
  autocmd VimLeave * silent !echo -ne "\033]112\007"
  " use \003]12;gray\007 for gnome-terminal and rxvt up to version 9.21
endif

" tmux will only forward escape sequences to the terminal if surrounded by a DCS sequence
if exists('$TMUX')
   " set insert mode to a cyan vertical line   
   let &t_SI .= "\<esc>Ptmux;\<esc>\<esc>[2 q\<esc>\\"
   let &t_SI .= "\<esc>Ptmux;\<esc>\<esc>]12;green\x7\<esc>\\"
   " set normal mode to a green block
   let &t_EI .= "\<esc>Ptmux;\<esc>\<esc>[2 q\<esc>\\"
   let &t_EI .= "\<esc>Ptmux;\<esc>\<esc>]12;red\x7\<esc>\\"
   " set replace mode to an orange underscore
   let &t_SR .= "\<esc>Ptmux;\<esc>\<esc>[4 q\<esc>\\"
   let &t_SR .= "\<esc>Ptmux;\<esc>\<esc>]12;orange\x7\<esc>\\"

   " initialize cursor shape/color on startup (silent !echo approach doesn't seem to work for tmux)
   augroup ResetCursorShape
      au!
      "autocmd VimEnter * startinsert | stopinsert
      autocmd VimEnter * normal! :startinsert :stopinsert
      "autocmd VimEnter * :normal :startinsert :stopinsert
   augroup END

   " reset cursor when leaving tmux
   autocmd VimLeave * silent !echo -ne "\033Ptmux;\033\033[2 q\033\\"
   autocmd VimLeave * silent !echo -ne "\033Ptmux;\033\033]12;gray\007\033\\"
endif
inoremap jk <ESC>
noremap = nzz
noremap - Nzz
noremap <LEADER><CR> :nohlsearch<CR> 
set wrap
set ignorecase
set smartcase
set scrolloff=5
let &t_ut=''

" === NERDTree
map tt :NERDTreeToggle<CR>
let NERDTreeMapOpenExpl = ""
let NERDTreeMapUpdir = ""
let NERDTreeMapUpdirKeepOpen = ""
let NERDTreeMapOpenSplit = ""
let NERDTreeOpenVSplit = ""
let NERDTreeMapActivateNode = "i"
let NERDTreeMapOpenInTab = "o"
let NERDTreeMapPreview = ""
let NERDTreeMapCloseDir = "n"
let NERDTreeMapChangeRoot = "y"



"s ==
" == NERDTree-git
" ==
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }


" ===
" === You Complete ME
" ===
nnoremap gd :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap g/ :YcmCompleter GetDoc<CR>
nnoremap gt :YcmCompleter GetType<CR>
nnoremap gr :YcmCompleter GoToReferences<CR>
let g:ycm_autoclose_preview_window_after_completion=0
let g:ycm_autoclose_preview_window_after_insertion=1
let g:ycm_use_clangd = 0
let g:ycm_python_interpreter_path = "/bin/python3"
let g:ycm_python_binary_path = "/bin/python3"


" ===
" === ale
" ===
let b:ale_linters = ['pylint']
let b:ale_fixers = ['autopep8', 'yapf']


" ===
" === Taglist
" ===
map <silent> T :TagbarOpenAutoClose<CR>


" ===
" === MarkdownPreview
" ===
let g:mkdp_auto_start = 0
let g:mkdp_auto_close = 1
let g:mkdp_refresh_slow = 0
let g:mkdp_command_for_global = 0
let g:mkdp_open_to_the_world = 0
let g:mkdp_open_ip = ''
let g:mkdp_browser = 'chromium'
let g:mkdp_echo_preview_url = 0
let g:mkdp_browserfunc = ''
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1
    \ }
let g:mkdp_markdown_css = ''
let g:mkdp_highlight_css = ''
let g:mkdp_port = ''
let g:mkdp_page_title = '「${name}」'


" ===
" === vim-table-mode
" ===
map <LEADER>tm :TableModeToggle<CR>

" ===
" === Python-syntax
" ===
let g:python_highlight_all = 1
" let g:python_slow_sync = 0


" ===
" === vim-indent-guide
" ===
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_color_change_percent = 1
silent! unmap <LEADER>ig
autocmd WinEnter * silent! unmap <LEADER>ig


" ===
" === Goyo
" ===
map <LEADER>gy :Goyo<CR>

" Duplicate words
map <LEADER>fd /\(\<\w\+\?\)\_s*\1


" ===
" === vim-signiture
" ===
let g:SignatureMap = {
        \ 'Leader'             :  "m",
        \ 'PlaceNextMark'      :  "m,",
        \ 'ToggleMarkAtLine'   :  "m.",
        \ 'PurgeMarksAtLine'   :  "dm-",
        \ 'DeleteMark'         :  "dm",
        \ 'PurgeMarks'         :  "dm/",
        \ 'PurgeMarkers'       :  "dm?",
        \ 'GotoNextLineAlpha'  :  "m<LEADER>",
        \ 'GotoPrevLineAlpha'  :  "",
        \ 'GotoNextSpotAlpha'  :  "m<LEADER>",
        \ 'GotoPrevSpotAlpha'  :  "",
        \ 'GotoNextLineByPos'  :  "",
        \ 'GotoPrevLineByPos'  :  "",
        \ 'GotoNextSpotByPos'  :  "mn",
        \ 'GotoPrevSpotByPos'  :  "mp",
        \ 'GotoNextMarker'     :  "",
        \ 'GotoPrevMarker'     :  "",
        \ 'GotoNextMarkerAny'  :  "",
        \ 'GotoPrevMarkerAny'  :  "",
        \ 'ListLocalMarks'     :  "m/",
        \ 'ListLocalMarkers'   :  "m?"
        \ }


" ===
" === Undotree
" ===
let g:undotree_DiffAutoOpen = 0
map L :UndotreeToggle<CR>

map s <nop>I
map Q :wq<CR>
map S :w<CR>
map R :source $MYVIMRC<CR>
map s<right> :set splitright<CR>:vsplit<CR>
map s<left> :set nosplitright<CR>:vsplit<CR>
map s<up> :set nosplitbelow<CR>:split<CR>
map s<down> :set splitbelow<CR>:split<CR>
map r<up> :res +5<CR>
map r<down> :res -5<CR>
map r<left> :vertical resize-5<CR>
map r<right> :vertical resize+5<CR>
map <LEADER><right> <C-w>l
map <LEADER><left> <C-w>h
map <LEADER><up> <C-w>k
map <LEADER><down> <C-w>j
map sv <C-w>H
map sh <C-w>K
map t<up> :tabe<CR>
map t<left> :-tabenext<CR>
map t<right> :+tabenext<CR>
"spelling check with <space>sc
map <LEADER>sc :set spell!<CR>
noremap <C-x> ea<C-x>s
inoremap <C-x> <Esc>ea<C-x>s


call plug#begin('~/.vim/plugged''')
Plug 'vim-airline/vim-airline'
Plug 'connorholyday/vim-snazzy'
Plug 'VundleVim/Vundle.vim'

" File navigation
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'

" Taglist
Plug 'majutsushi/tagbar', { 'on': 'TagbarOpenAutoClose' }

" Error checking
Plug 'w0rp/ale'

" Auto Complete
Plug 'Valloric/YouCompleteMe'

" Undo Tree
Plug 'mbbill/undotree/'

" Other visual enhancement
Plug 'nathanaelkane/vim-indent-guides'
Plug 'itchyny/vim-cursorword'

" Git
Plug 'rhysd/conflict-marker.vim'
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'
Plug 'gisphm/vim-gitignore', { 'for': ['gitignore', 'vim-plug'] }

" HTML, CSS, JavaScript, PHP, JSON, etc.
Plug 'elzr/vim-json'
Plug 'hail2u/vim-css3-syntax'
Plug 'spf13/PIV', { 'for' :['php', 'vim-plug'] }
Plug 'gko/vim-coloresque', { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] }
Plug 'pangloss/vim-javascript', { 'for' :['javascript', 'vim-plug'] }
Plug 'mattn/emmet-vim'

" Python
Plug 'vim-scripts/indentpython.vim'

" Markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install_sync() }, 'for' :['markdown', 'vim-plug'] }
Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle' }
Plug 'vimwiki/vimwiki'

" Bookmarks
Plug 'kshenoy/vim-signature'

" Other useful utilities
Plug 'terryma/vim-multiple-cursors'
Plug 'junegunn/goyo.vim' " distraction free writing mode
Plug 'tpope/vim-surround' " type ysks' to wrap the word with '' or type cs'` to change 'word' to `word`
Plug 'godlygeek/tabular' " type ;Tabularize /= to align the =
Plug 'gcmt/wildfire.vim' " in Visual mode, type i' to select all text in '', or type i) i] i} ip
Plug 'scrooloose/nerdcommenter' " in <space>cc to comment a line

" Dependencies
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'kana/vim-textobj-user'
Plug 'fadein/vim-FIGlet'

call plug#end()
