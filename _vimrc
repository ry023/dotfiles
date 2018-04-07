" 　　 /＼／＼/＼∧
" 　 ＜　 vimrc!　＞
" 　　 Ｖ＼/＼／＼/
" ＼　　　　｜　　　 ／
" 　＼　　 ＿＿_　 ／
" 　　　　/　　 ヽ
" ＼　ｍ {0}/"ヽ{0}ｍ ／
" 　 ｜っ| ヽ_ノ　と｜
" 　／ ム　 `ｰ′　ム ＼
" （＿＿　　　　　_＿＿)
" ＿＿ ｜　　　　｜＿＿＿
" 　　／　　　　 /
" 　 /　　　　 ／
" 　｜　/＼＿ノ￣￣ヽ
" ／｜ ｜　　￣￣/　ﾉ
" 　/　ﾉ　　　　｜ /　＼
" `/ ／　　　　 ﾉ /
" / ｜ 　　　　(_ ＼
" ＼_) 　　　　　＼_)
"

" 基本設定
set number
set tabstop=2
set shiftwidth=2
set expandtab
set ruler

" 起動時のメッセージ消す
set shortmess+=I

" ファイル形式別にプラグインとインデントをロードする
filetype plugin indent on

" クリップボードをOSと共有
set clipboard=unnamed

" 挿入モード時, Ctrl + j でモード抜け
inoremap <c-j> <esc>

" 挿入モードでも Ctrl + h, Ctrl + lで簡易的に左右移動できるようにする
inoremap <c-h> <left>
inoremap <c-l> <right>

" c-jで下に、c-kで上に空行
nnoremap <c-k> <s-o><esc>j
nnoremap <c-j> o<esc>k

" 分割画面左右移動
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" ===== ファイル形式毎に設定 =======================================

if expand("%:e") == "cs"
  echo "C# file!"
endif

" ===== ここから dien.vim の設定 =======================================

" dein.vimのインストールパス
set runtimepath^=~/.vim/repos/github.com/Shougo/dein.vim

call dein#begin(expand('~/.vim'))

" ----- 利用するプラグインとその設定を書いてく -----------------------------
"
"   call dein#add('user/repo') 
"
" でuser/repoのGithubリポジトリからプラグインを落としてインストール
" ----------------

" dein.vimくん
call dein#add('Shougo/dein.vim')

" 同ファイル内で過去に入力した単語を補完
call dein#add('Shougo/neocomplete.vim')
:NeoCompleteEnable

if !exists('g:neocomplete#force_omni_input_patterns')
  let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_omni_input_patterns.cs = '[^. *\t]\.\w*\|\h\w*::'

" スニペットファイル
call dein#add('Shougo/neosnippet-snippets')

" ファイルシステム
call dein#add('scrooloose/nerdtree')
" c-nでNERDTree開く
nnoremap <silent><c-n> :NERDTreeToggle<CR>

" doとか打ったらendを自動挿入するプラグイン
call dein#add('tpope/vim-endwise')

" railsのファイルを便利に開くプラグイン
call dein#add('tpope/vim-rails')

"" インデントを可視化
"call dein#add('nathanaelkane/vim-indent-guides')
"let g:indent_guides_enable_on_vim_startup = 1

" 構文チェック
call dein#add('scrooloose/syntastic')

" C#のOmni補完
" serverのbuildもする
call dein#add('nosami/Omnisharp', {'build': 'xbuild server/OmniSharp.sln'})

call dein#add('kchmck/vim-coffee-script')

" vim-dispatch
" カラースキームが変になるのでコメントアウト
call dein#add('tpope/vim-dispatch')

" --------------------------------------------------------------------------

call dein#end()

" 起動時にインストールされていないプラグインをチェックしてインストール
if dein#check_install()
  call dein#install()
endif

" syntax
syntax on