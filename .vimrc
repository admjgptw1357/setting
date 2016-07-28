set title
set encoding=utf-8
set list
set listchars=tab:▸\ ,trail:_,eol:$,extends:>,precedes:<,nbsp:%
set ignorecase
set fileencodings=iso-2022-jp,euc-jp,sjis,utf-8
set showcmd
set number
let &titleold=getcwd()
set ambiwidth=double
set tabstop=4
" set expandtab
set shiftwidth=4
set smartindent
set directory=~/.vim/tmp
set list
set nrformats-=octal
set hidden
set history=50
set whichwrap=b,s,[,],<,>
set virtualedit=block
set backspace=indent,eol,start
nnoremap j gj
nnoremap k gk
nnoremap <Down> gj
nnoremap <Up>   gk
inoremap { {}<LEFT>
inoremap [ []<LEFT>
inoremap ( ()<LEFT>
inoremap " ""<LEFT>
inoremap ' ''<LEFT>
set vb t_vb=

if has("syntax")
          syntax on 
endif
set hlsearch
nnoremap s <Nop>
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sh <C-w>h
nnoremap ss :<C-u>sp<CR>
nnoremap sv :<C-u>vs<CR>
nnoremap st :<C-u>tabnew<CR>
nnoremap sT :<C-u>Unite tab<CR>
if has('vim_starting')
       " 初回起動時のみruntimepathにneobundleのパスを指定する
          set runtimepath+=~/.vim/bundle/neobundle.vim/
          endif

          " NeoBundleを初期化↲
          call neobundle#begin(expand('~/.vim/bundle/'))

          " インストールするプラグインをここに記述↲
          NeoBundle 'Shougo/unite.vim'
          NeoBundle 'Shougo/vimfiler'
          NeoBundle 'davidhalter/jedi-vim'
          NeoBundle 'ujihisa/unite-colorscheme'
          NeoBundle 'tomasr/molokai'
		  NeoBundle 'notpratheek/vim-luna'
		  NeoBundle 'sickill/vim-monokai'
		  NeoBundle 'jaxbot/semantic-highlight.vim'
		  NeoBundle 'nathanaelkane/vim-indent-guides'
		  NeoBundle 'hdima/python-syntax'
          call neobundle#end()

          " ファイルタイプ別のプラグイン/インデントを有効にする↲
          filetype plugin indent on
autocmd FileType python setlocal completeopt-=preview

" autocmd ColorScheme * highlight Comment ctermfg=22 guifg=#008800
colorscheme monokai
hi Comment ctermfg=244
hi Visual  ctermbg=238
let python_highlight_all = 1

let g:indent_guides_enable_on_vim_startup=1
" ガイドをスタートするインデントの量
let g:indent_guides_start_level=2
" 自動カラー無効
let g:indent_guides_auto_colors=0
" 奇数番目のインデントの色
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#444433 ctermbg=black
" 偶数番目のインデントの色
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#333344 ctermbg=darkgray
" ガイドの幅
let g:indent_guides_guide_size = 1


