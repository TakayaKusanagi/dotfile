"NeoBund
set nocompatible
filetype plugin indent off

if has('vim_starting')
      set runtimepath+=~/.vim/bundle/neobundle.vim
      call neobundle#begin(expand('~/.vim/bundle'))
endif
NeoBundleFetch 'Shougo/neobundle.vim' "plugin追加
"非同期処理を走らせるプラグインが早くなる
NeoBundle 'Shougo/vimproc', {
                  \ 'build' : {
                  \     'windows' : 'make -f make_mingw32.mak',
                  \     'cygwin' : 'make -f make_cygwin.mak',
                  \     'mac' : 'make -f make_mac.mak',
                  \     'unix' : 'make -f make_unix.mak',
                  \    },
                  \ }
NeoBundle 'thinca/vim-quickrun'       "スクリプト実行 :run
NeoBundle 'w0rp/ale' "syntax
NeoBundle 'itchyny/lightline.vim'     "フッター的なやつ
NeoBundle "tyru/caw.vim.git"          "複数行のコメントアウト ctrl+k
" NeoBundle 'Townk/vim-autoclose'       "自動とじカッコ
NeoBundle 'valloric/matchtagalways'   "htmlのマッチしている先を教えてくれる
NeoBundle "t9md/vim-quickhl"          "カーソル下のハイライトをトグルする space+mで検索
"NeoBundle 'rust-lang/rust.vim'        "rust
"NeoBundle 'fatih/vim-go'              "go
NeoBundle 'nathanaelkane/vim-indent-guides' "indent
NeoBundle 'junegunn/vim-easy-align'   "テキスト整形 visualモードで ga
NeoBundle 'vim-scripts/paredit.vim' "lisp

"colorscheme >>>>>>>>>>>
NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'cocopon/iceberg.vim'
NeoBundle 'christophermca/meta5'


call neobundle#end()
filetype plugin indent on
NeoBundleCheck

"caw.vim{
nmap <C-K> <Plug>(caw:i:toggle)
vmap <C-K> <Plug>(caw:i:toggle)
"}

"matchtagalways{
let g:mta_use_matchparen_group = 1
let g:mta_filetypes = {
                  \ 'html' : 1,
                  \ 'php' : 1,
                  \}
"}

"vim-quickhl{
map <Space>m <Plug>(quickhl-manual-this)
map <Space>M <Plug>(quickhl-manual-reset)
"}

" vim-quickrun{
nnoremap <silent> :run<CR> :QuickRun<CR>
let g:quickrun_config={'_': {'split': 'vertical'}}
set splitright
" }

"easy-align{
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
"}


"vim -indent-guides{
let g:indent_guides_start_level=2
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_guide_size = 1
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=235
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=235
"}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"インデントは6つ
set expandtab "インデントは半角スペース
set tabstop=6
set shiftwidth=6
set autoindent

"検索結果のハイライト
set hlsearch

"リアルタイム検索
set incsearch

"文字列の折り返しなし
set nowrap

"color
autocmd VimEnter,ColorScheme * highlight Visual cterm=NONE ctermfg=white ctermbg=darkcyan
autocmd VimEnter,ColorScheme * highlight Comment ctermfg=242
autocmd VimEnter,ColorScheme * highlight LineNr ctermfg=103 ctermbg=236
"autocmd VimEnter,ColorScheme * highlight SpecialKey ctermfg=239

set t_Co=256
syntax on
set background=dark
colorscheme meta5 "meta5 iceberg jellybeans hybrid vim-vice

"全角スペースをハイライト
function! ZenkakuSpace()
      highlight ZenkakuSpace cterm=reverse ctermfg=darkblue
endfunction
if has('syntax')
      augroup ZenkakuSpace
            autocmd!
            autocmd ColorScheme       * call ZenkakuSpace()
            autocmd VimEnter,WinEnter * match ZenkakuSpace /　/
      augroup END
      call ZenkakuSpace()
endif

"swpファイル不要
set noswapfile

"Phalcon対応
set filetype=htmldjango

"deleteキー聞かない対応"
set backspace=indent,eol,start

"ステータスライン"
"" ファイル名表示
set statusline=%F

""ステータスラインを常に表示(0:表示しない、1:2つ以上ウィンドウがある時だけ表示)
set laststatus=2

"現在の行の強調なし
set nocursorline

"現在の行表示"
set number

"保存時に行末の空白行を削除
autocmd BufWritePre * :%s/\s\+$//ge

"cusurlineトグル
map <silent> <C-c> :set cursorline! cursorcolumn!<CR>
highlight CursorLine cterm=NONE ctermfg=0 ctermbg=6
highlight CursorColumn cterm=NONE ctermfg=0 ctermbg=6

