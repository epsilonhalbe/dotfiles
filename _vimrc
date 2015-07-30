" .vimrc
" OrigAuthor: Steve Losh <steve@stevelosh.com>
" OrigSource: http://bitbucket.org/sjl/dotfiles/src/tip/vim/
" Author: Martin Heuschober <epsilonhalbe@gmail.com>
" Source: http://http://github.com/epsilonhalbe/dotfiles/vimrc
"
" This file changes a lot.  I'll try to document pieces of it whenever I have
" a few minutes to kill.

" Preamble ---------------------------------------------------------------- {{{

set nocompatible
syntax on
filetype off
set rtp+=~/.vim/bundle/Vundle.vim/

call vundle#rc()

Plugin 'gmarik/Vundle.vim'

"Plugin 'gerw/vim-latex-suite'
Plugin 'altercation/vim-colors-solarized'
""" Haskell related Plugins
Plugin 'bitc/lushtags'
Plugin 'bitc/vim-hdevtools'
Plugin 'eagletmt/ghcmod-vim'
"Plugin 'wlangstroth/vim-haskell'
Plugin 'raichoo/haskell-vim'
Plugin 'lukerandall/haskellmode-vim'
"Plugin 'vim-scripts/haskell.vim'
Plugin 'Twinside/vim-hoogle'
Plugin 'ujihisa/neco-ghc'

""" Language specific plugins
Plugin 'guns/vim-clojure-static'
Plugin 'jceb/vim-orgmode'
Plugin 'lambdatoast/elm.vim'
Plugin 'neo4j-contrib/cypher-vim-syntax'
Plugin 'plasticboy/vim-markdown'
Plugin 'raichoo/purescript-vim'
Plugin 'marijnh/tern_for_vim'

""" making better vim experience
Plugin 'ivalkeen/nerdtree-execute'
Plugin 'junegunn/vim-easy-align'
Plugin 'honza/vim-snippets'
Plugin 'SirVer/ultisnips'
"Plugin 'kien/rainbow_parentheses.vim'
Plugin 'luochen1990/rainbow'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
"
""" misc plugins
Plugin 'chrisbra/NrrwRgn'
Plugin 'coot/cmdalias_vim'
Plugin 'coot/CRDispatcher'
Plugin 'corntrace/bufexplorer'
Plugin 'ervandew/supertab'
Plugin 'godlygeek/tabular'
Plugin 'kurkale6ka/vim-sequence'
Plugin 'majutsushi/tagbar'
Plugin 'mattn/calendar-vim'
Plugin 'mileszs/ack.vim'
Plugin 'pbrisbin/html-template-syntax'
Plugin 'Raimondi/delimitMate'
Plugin 'Shougo/vimproc.vim'
Plugin 'sickill/vim-monokai'
Plugin 'sjl/gundo.vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'thinca/vim-fontzoom'
Plugin 'tomasr/molokai'
Plugin 'tpope/vim-abolish'
Plugin 'tpope/vim-classpath'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-fireplace'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-leiningen'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-speeddating'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-scripts/AutomaticLaTexPlugin'
Plugin 'vim-scripts/cmdalias.vim'
Plugin 'vim-scripts/colorsel.vim'
Plugin 'vim-scripts/renamer.vim'
Plugin 'vim-scripts/scratch.vim'
Plugin 'vim-scripts/SyntaxRange'
Plugin 'vim-scripts/utl.vim'  "universal text linking
Plugin 'vim-scripts/YankRing.vim'
Plugin 'wincent/Command-T'
Plugin 'xolox/vim-easytags'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-shell'
Plugin 'Yggdroot/indentLine'

"Plugin 'file:///home/epsilonhalbe/prgm/fsharpbinding-vim'
"Plugin 'fsharp/fsharpbinding', {'rtp': '/vim'}

filetype on
filetype indent on
filetype plugin on
" }}}
" Basic options ----------------------------------------------------------- {{{
set encoding=utf-8
set modelines=0
set showmode " to see which indentation modes are set type in command mode verbose set ai? cin? cink? cino? si? inde? indk?
set showcmd
set confirm
set hidden
set visualbell
set errorbells
set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set number
set relativenumber
set tabpagemax=30
set statusline=
set statusline+=%f\ %2*%m\ %1*%h
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%{fugitive#statusline()}
set statusline+=%*
set laststatus=2
set history=2000
set undofile
set undoreload=2000
set cpoptions+=J
set list
set listchars =tab:▸\ ,extends:❯
"set listchars+=extends:❯
set listchars+=precedes:❮
set listchars+=trail:␣
set listchars+=nbsp:␣
"set listchars+=eol:¬
set shell=/bin/sh
set lazyredraw
set matchtime=3
"set breakindent
set showbreak=\ \ \ ↪
"set splitbelow
set splitright
set fillchars=diff:⣿
"set   ttimeout
"set  notimeout
"set nottimeout
set clipboard+=unnamed,unnamedplus

set autowrite
set shiftround
set autoread
set title
set linebreak
"set dictionary=/usr/share/dict/words
set viminfo='10,\"100,:20,%,n~/.viminfo
set viminfo+=!                                       " make sure it can save viminfo
set cf                                               " enable error files and error jumping
set ffs=unix,dos,mac
set iskeyword+=$,@,%,#,-
set iskeyword+=ä,ü,ö,ß,é,è,ê,â,á,à,û                 " none of these should be word dividers, so make them not be
set iskeyword+=_,.,39
set title                                            " show title in xterm
"set shortmess=atI                                   " shorten command-line text and other info tokens (see :help shortmess)
set nojoinspaces
set cmdheight=1
"set scrolloff=5                                     " vertical scrolloff
set scrolloff=999                                    " vertical scrolloff if set to 999 cursor is always in the middle of the screen
set sidescroll=1
set sidescrolloff=50                                  " horzontal scrolloff


" Wildmenu completion {{{

set wildmenu
"set wildmode=list
set wildmode=list:longest
"set wildmode=list:full
"set wildmode=full

set wildignore+=.hg,.git,.svn                     " Version control
set wildignore+=*.aux,*.out,*.toc,*.log,*.idx     " LaTeX intermediate files
set wildignore+=*_aux,*.glg,*.glo,*.gls,*.ist     " LaTeX intermediate files
set wildignore+=*.nlo,*.nls,*.bbl,*.dvi,*.tdo     " still LaTeX files
set wildignore+=*.ilg,*.fdb_latexmk,*.synctex.gz  " … LaTeX intermediate files
set wildignore+=*.blg,*.ind,*_log,*.auxlock,*.fls " … … LaTeX intermediate files
set wildignore+=*.pdf                             " Portable Document Files
set wildignore+=*.hi                              " Haskell linker files
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg    " binary images
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest  " compiled object files
set wildignore+=*.class,*.jar                     " compiled java stuff
set wildignore+=*.spl                             " compiled spelling word lists
set wildignore+=*.sw?                             " Vim swap files
set wildignore+=*.DS_Store                        " OSX bullshit

set wildignore+=*.luac                            " Lua byte code

set wildignore+=migrations                        " Django migrations
set wildignore+=*.pyc                             " Python byte code

set wildignore+=*.orig                            " Merge resolution files

" Clojure/Leiningen
set wildignore+=classes
set wildignore+=lib

" }}}

" Make Vim able to edit crontab files again.
set backupskip=/tmp/*,/private/tmp/*"

" Save when losing focus
au FocusLost * :wa
" ToggleThinkMode {{{
com ToggleThinkMode cal ThinkModeToggle()

au VimEnter * silent call ThinkModeOn()

func ThinkModeToggle()
    if !exists('g:ThinkMode')
        call ThinkModeOn()
    else
        call ThinkModeOff()
    endif
endfunc

func ThinkModeOn()
    let g:ThinkMode=1
    " automatically leave insert mode after 'updatetime' milliseconds of inaction
    au CursorHoldI * stopinsert
    " set 'updatetime' to x milliseconds when in insert mode
    au InsertEnter * let updaterestore=&updatetime | set updatetime=15000
    au InsertLeave * let &updatetime=updaterestore
    echo "Thinkmode ▸ On"
endfunc

func ThinkModeOff()
    if exists('g:ThinkMode')
        unlet g:ThinkMode
    endif
    " automatically leave insert mode after 'updatetime' milliseconds of inaction
    au CursorHoldI * stopinsert
    " set 'updatetime' to x milliseconds when in insert mode
    au InsertEnter * let updaterestore=&updatetime | set updatetime=900
    au InsertLeave * let &updatetime=updaterestore
    echo "Thinkmode ▸ Off"
endfunc
" }}}

" Resize splits when the window is resized
au VimResized * exe "normal! \<c-w>="

" Line Return {{{

" Make sure Vim returns to the same line when you reopen a file.
" Thanks, Amit
augroup line_return
    au!
    au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \     execute 'normal! g`"zvzz' |
        \ endif
augroup END

" }}}
" Tabs, spaces, wrapping {{{

set autoindent    " always set autoindenting on
set smartindent   " use smart indent if there is no indent file
set tabstop=4     " <tab> inserts 4 spaces
set softtabstop=4 " <BS> over an autoindent deletes 4 spaces.
set shiftwidth=4  " an indent level is 4 spaces wide.
set smarttab      " Handle tabs more intelligently
set expandtab     " Use spaces, not tabs, for autoindent/tab key.
set shiftround    " rounds indent to a multiple of shiftwidth
set whichwrap+=<,>,h,l,[,]
set nowrap
set textwidth=80
"set formatoptions=qrn1
set formatoptions=tcrqnjv
set colorcolumn=+1

" Backups {{{

set undodir=~/.vim/tmp/undo//     " undo files
" create undodir directory if possible and does not exist yet
let targetdir=$HOME . "/.vim/tmp/undo"
if isdirectory(targetdir) != 1 && getftype(targetdir) == "" && exists("*mkdir")
 call mkdir(targetdir, "p", 0700)
endif

set backupdir=~/.vim/tmp/backup// " backups
" create undodir directory if possible and does not exist yet
let targetdir=$HOME . "/.vim/tmp/backup"
if isdirectory(targetdir) != 1 && getftype(targetdir) == "" && exists("*mkdir")
 call mkdir(targetdir, "p", 0700)
endif
set directory=~/.vim/tmp/swap//   " swap files
" create undodir directory if possible and does not exist yet
let targetdir=$HOME . "/.vim/tmp/swap"
if isdirectory(targetdir) != 1 && getftype(targetdir) == "" && exists("*mkdir")
 call mkdir(targetdir, "p", 0700)
endif
set backup                        " enable backups
set noswapfile                    " It's 2012, Vim.
set makeef=error.err         " When using make, where should it dump the file

" }}}
" Leader {{{

let mapleader = ";"
let maplocalleader ="\\"
inoremap :w  <esc>:w<cr>
inoremap ^w  <esc>:w<cr>
inoremap @@  <esc>
inoremap :{  <esc>:w<cr>
inoremap :}  <esc>:w<cr>


" }}}
" Color scheme {{{

syntax on

set t_Co=256
" set t_ut=
    set background=light         " we are not using a light background
    "set background=dark        " we are not using a light background
colorscheme solarized
    "autocmd InsertEnter * highlight  CursorLine ctermbg=23 ctermfg=None
    " Revert Color to default when leaving Insert Mode
    "autocmd InsertLeave * highlight  CursorLine ctermbg=237 ctermfg=None

if &term =~ "xterm\\|rxvt"
    " use a green cursor in insert mode
    let &t_SI = "\<Esc>]12;green\x7"
    " use an orange cursor otherwise
    let &t_EI = "\<Esc>]12;orange\x7"
    silent !echo -ne "\033]12;orange\007"
    " reset cursor when vim exits
    autocmd VimLeave * silent !echo -ne "\033]12;white\007"
    " use \003]12;gray\007 for gnome-terminal
endif



" Make trailing whitespace visible with ,s
nmap <silent> <leader>s :set nolist!<CR>

highlight Checkmark term=standout ctermfg=Green guifg=Green
call matchadd('Checkmark', '✔')
highlight Ballot term=standout ctermfg=Red guifg=Red
call matchadd('Ballot', '✘')

" Highlight trailing whitespace
highlight WhitespaceEOL term=standout ctermbg=DarkYellow guibg=DarkYellow
match WhitespaceEOL /\s\+$/

call matchadd('WhitespaceEOL', '\(\s\+$\| \+\ze\t\|\t\zs \+\)\(\%#\)\@!')

highlight ColorColumn guibg=Gray15 ctermbg=235
highlight CursorLine guibg=Gray23 ctermbg=235
" }}}

" Language and Spelling {{{
set spelllang=en_gb,de_at,fr
highlight SpellBad    term=reverse   ctermbg=12 gui=undercurl guisp=Red       " badly spelled word
highlight SpellCap    term=reverse   ctermbg=9  gui=undercurl guisp=Blue      " word with wrong caps
highlight SpellRare   term=reverse   ctermbg=13 gui=undercurl guisp=Magenta   " rare word
highlight SpellLocale term=underline ctermbg=11 gui=undercurl guisp=DarkCyan  " word only exists in other region

" Ignore CamelCase words when spell checking
fun! IgnoreSpell()
    syn match CamelCase /\<[A-Z][a-z]\+[A-Z].\{-}\>/ contains=@NoSpell transparent
    syn cluster Spell add=CamelCase
    syntax match InlineURL /https\?:\/\/\(\w\+\(:\w\+\)\?@\)\?\([A-Za-z][-_0-9A-Za-z]*\.\)\{1,}\(\w\{2,}\.\?\)\{1,}\(:[0-9]\{1,5}\)\?\S*/ contains=@NoSpell transparent
    syn cluster Spell add=InlineURL
endfun
"autocmd BufRead,BufNewFile * :call IgnoreSpell()
" }}}

function CheckRo()
    if &readonly
        set colorcolumn=0
    endif
endfunction
au BufReadPost * call CheckRo()

" Highlight VCS conflict markers
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

" }}}


" }}}
" Abbreviations ----------------------------------------------------------- {{{

function! EatChar(pat)
    let c = nr2char(getchar(0))
    return (c =~ a:pat) ? '' : c
endfunction

function! MakeSpacelessIabbrev(from, to)
    execute "iabbrev <silent> ".a:from." ".a:to."<C-R>=EatChar('\\s')<CR>"
endfunction

call MakeSpacelessIabbrev('sl/',  'http://stevelosh.com/')
call MakeSpacelessIabbrev('bb/',  'http://bitbucket.org/')
call MakeSpacelessIabbrev('bbs/', 'http://bitbucket.org/sjl/')
call MakeSpacelessIabbrev('gh/',  'http://github.com/')
call MakeSpacelessIabbrev('ghs/', 'http://github.com/sjl/')

iabbrev ldis ಠ_ಠ
iabbrev lsad ಥ_ಥ
iabbrev lhap ಥ‿ಥ

iabbrev sl@ steve@stevelosh.com
iabbrev vrcf `~/.vimrc` file

" Mistypes {{{
"Abolish! teh the
"Abolish! lenght length
"Abolish! persistant persistent
"Abolish! mannifold manifold
"Abolish! ahve have
"Abolish! taht that


" conveniences
call MakeSpacelessIabbrev('.../', '…')

" }}}

" }}}
" Searching and movement -------------------------------------------------- {{{

" Use sane regexes.
nnoremap / /\v
vnoremap / /\v

set ignorecase
set smartcase
set incsearch
set showmatch
set hlsearch
"set nowrapscan
"set gdefault -- global replace by default

set virtualedit+=block

noremap <leader><space> :noh<cr>
noremap <leader><S-space> :call clearmatches()<cr>

"runtime macros/matchit.vim
"map <tab> %  "i don't want it totally messes up vim snippets and % is not too
              "hard a button to press

" Made D behave
nnoremap D d$

" Keep search matches in the middle of the window and pulse the line when moving
" to them.
nnoremap n nzzzv
nnoremap N Nzzzv

" Don't move on *
nnoremap * *<c-o>

" Same when jumping around
nnoremap g; g;zz
nnoremap g, g,zz

" moving in text
noremap <S-Up> 10k
noremap <S-Down> 10j
inoremap <S-Up> <Esc><Up>
inoremap <S-Down> <Esc><Up>

" Window moving around
nnoremap <c-space> <C-w>
" Window resizing
nnoremap <c-left> 3<c-w>>
nnoremap <c-right> 3<c-w><
nnoremap <c-up> <c-w>+
nnoremap <c-down> <c-w>-

nmap <C-}> <C-w><C-]>
" Easier to type, and I never use the default behavior.
"noremap H ^
"noremap L g_

" Heresy
"inoremap <c-a> <esc>I
"inoremap <c-e> <esc>A

"cnoremap <c-a> <Home>
"cnoremap <c-e> <End>

" Open a Quickfix window for the last search.
nnoremap <silent> <leader>/ :execute 'vimgrep /'.@/.'/g %'<CR>:copen<CR>

" Ack for the last search.
nnoremap <silent> <leader>* :AckFromSearch<cr>

" Fix linewise visual selection of various text objects
nnoremap v <C-v>
nnoremap <C-v> v
nnoremap VV V
nnoremap Vit vitVkoj
nnoremap Vat vatV
nnoremap Vab vabV
nnoremap VaB vaBV

"nnoremap v} v}ho{l
"nnoremap vi} v}ho{l
"nnoremap vi{ v}ho{l
"nnoremap v{ v}o{
"nnoremap va} v}o{
"nnoremap va{ v}o{

" visual block mode is used much more often by me - hence reversed <C-v> v " behavior
"nnoremap v <C-v>
"nnoremap <C-v> <nop>


" Error navigation {{{
"
"             Location List     QuickFix Window
"            (e.g. Syntastic)     (e.g. Ag)
"            ----------------------------------
" Next      |     M-j               M-Down     |
" Previous  |     M-k                M-Up      |
"            ----------------------------------
"
nnoremap ∆ :lnext<cr>zvzz
nnoremap ˚ :lprevious<cr>zvzz
inoremap ∆ <esc>:lnext<cr>zvzz
inoremap ˚ <esc>:lprevious<cr>zvzz
nnoremap <m-Down> :cnext<cr>zvzz
nnoremap <m-Up> :cprevious<cr>zvzz

" }}}
" Directional Keys {{{

" It's 2012. quasi linewise movement in wraps
noremap j gj
noremap k gk

" Easy buffer navigation
noremap <C-h>  <C-w>h
noremap <C-j>  <C-w>j
noremap <C-k>  <C-w>k
noremap <C-l>  <C-w>l
noremap <leader>v <C-w>v
" }}}
" Highlight word {{{
hi InterestingWord1 guibg=red4         guifg=black ctermbg=124 ctermfg=black
hi InterestingWord2 guibg=DarkOrange   guifg=black ctermbg=202 ctermfg=black
hi InterestingWord3 guibg=DeepSkyBlue1 guifg=black ctermbg=027 ctermfg=black

nnoremap <silent> <leader>h1 :execute 'match InterestingWord1 /\<<c-r><c-w>\>/'<cr>
nnoremap <silent> <leader>h2 :execute '2match InterestingWord2 /\<<c-r><c-w>\>/'<cr>
nnoremap <silent> <leader>h3 :execute '3match InterestingWord3 /\<<c-r><c-w>\>/'<cr>
vnoremap <silent> <leader>h1 "ay:execute  'match InterestingWord1 /<c-r>a/'<cr>
vnoremap <silent> <leader>h2 "by:execute '2match InterestingWord2 /<c-r>b/'<cr>
vnoremap <silent> <leader>h3 "cy:execute '3match InterestingWord3 /<c-r>c/'<cr>
vnoremap <silent> y y:execute '2match InterestingWord2 /<c-r>"/'<cr>

" }}}
" Visual Mode */# from Scrooloose {{{

function! s:VSetSearch()
  let temp = @@
  norm! gvy
  let @/ = '\V' . substitute(escape(@@, '\'), '\n', '\\n', 'g')
  let @@ = temp
endfunction

vnoremap * :<C-u>call <SID>VSetSearch()<CR>//<CR><c-o>
vnoremap # :<C-u>call <SID>VSetSearch()<CR>??<CR><c-o>

" }}}

" }}}
" Folding ----------------------------------------------------------------- {{{

set foldlevelstart=1
set foldlevel=5

" Space to toggle folds.
nnoremap <Space> za
vnoremap <Space> za

" Make zO recursively open whatever top level fold we're in, no matter where the
" cursor happens to be.
"nnoremap zO zCzO

" Use ,z to "focus" the current fold.
nnoremap <leader>z zMzvzz

function! MyFoldText() " {{{
    let line = getline(v:foldstart)

    let nucolwidth = &fdc + &number * &numberwidth
    let windowwidth = winwidth(0) - nucolwidth - 3
    let foldedlinecount = v:foldend - v:foldstart

    " expand tabs into spaces
    let onetab = strpart('          ', 0, &tabstop)
    let line = substitute(line, '\t', onetab, 'g')

    let line = strpart(line, 0, windowwidth - 2 -len(foldedlinecount))
    let fillcharcount = windowwidth - len(line) - len(foldedlinecount)
    return line . '…' . repeat(" ",fillcharcount) . foldedlinecount . '…' . ' '
endfunction " }}}
set foldtext=MyFoldText()

"highlight Folded guibg=Gray8 guifg=Gray ctermbg=235  ctermfg=0
" }}}
" Destroy infuriating keys ------------------------------------------------ {{{

" Fuck you, help key.
"noremap  <F1> :set invfullscreen<CR>
"inoremap <F1> <ESC>:set invfullscreen<CR>a
noremap  <F1> <Nop>
inoremap <F1> <Nop>
noremap <c-s> <Nop>
cabbrev vhelp vert bo help
cabbrev thelp tab help

" Fuck you too, manual key.
nnoremap K <nop>

" Stop it, hash key.
"inoremap # X<BS>#

" }}}
" Various filetype-specific stuff ----------------------------------------- {{{

" Agda {{{
    au BufEnter *.agda source ~/.vim/bundle/imaps/imap.vim
" }}}
" Arduino {{{
augroup ft_arduino
    au!
    autocmd! BufNewFile,BufRead *.pde,*.ino setlocal ft=arduino
    au FileType arduino setlocal foldmethod=syntax
augroup END
" }}}
" C {{{

augroup ft_c
    au!
    au FileType c setlocal foldmethod=syntax
    au FileType c setlocal makeprg=gcc\ %\ \-o\ %:r.bin
augroup END

" }}}
" Css {{{
augroup ft_css
    au!

    au BufNewFile,BufRead *.css set filetype=css
    au Syntax css setlocal foldmarker={,}
    au Syntax css setlocal foldmethod=marker
    au Syntax css setlocal foldlevel=1
augroup END
" }}}
" Diff {{{
augroup ft_diff
    au!
    au FileType diff nnoremap <C-Left> [c
    au FileType diff nnoremap <C-Right> ]c
augroup END
"}}}
" Fsharp{{{

let g:fsharp_only_check_errors_on_write=1
" }}}
" Fish {{{

augroup ft_fish
    au!

    au BufNewFile,BufRead *.fish setlocal filetype=fish
augroup END

" }}}
" Haskell {{{

augroup ft_haskell
    au!
    au BufEnter *.hs compiler ghc
    au BufEnter *.lhs compiler tex
    let g:syntastic_haskell_checkers = ['ghc_mod', 'hlint', 'hdevtools']
    let g:syntastic_haskell_hdevtools_args='-g-isrc -g-Wall'
    let g:ghc="~/bin/ghc/ghc"
    map <silent> <Leader>e :Errors<CR>
    map <silent> tu :call GHC_BrowseAll()<CR>
    map <silent> tw :call GHC_ShowType(1)<CR>
    "au FileType haskell nnoremap <buffer> <F1> :HdevtoolsType<CR>
    "au FileType haskell nnoremap <buffer> <silent> <F2> :HdevtoolsClear<CR>
    "au FileType haskell nnoremap <buffer> <silent> <F3> :HdevtoolsInfo<CR>

    function! FindCabalSandboxRoot()
        return finddir('.cabal-sandbox', './;')
    endfunction

    function! FindCabalSandboxRootPackageConf()
        return glob(FindCabalSandboxRoot().'/*-packages.conf.d')
    endfunction

    let g:hdevtools_options = '-g-ilib -g-isrc -g-i. -g-idist/build/autogen -g-Wall -g-package-conf='.FindCabalSandboxRootPackageConf()


    autocmd BufEnter *.hs set formatprg=pointfree
    let g:indentLine_enabled =0
    let hs_highlight_types = 1
    let hs_highlight_delimiters = 1
    let NERD_haskell_alt_style=1
    "let g:htip_bindkeys=1
    "let b:lhs_markup = "tex"
    "let g:haskell_indent_if = 2
    "let b:tex_flavor = 'xelatex'
    au FileType haskell setlocal omnifunc=necoghc#omnifunc
    let g:necoghc_enable_detailed_browse = 1
    set makeprg=cabal\ build
    setlocal errorformat=%f:%l:\ %m
augroup END

" }}}
" HTML {{{

augroup ft_html
augroup END

" }}}
" Javascript {{{

augroup ft_javascript
    au!

    au FileType javascript setlocal foldmethod=marker
    au FileType javascript setlocal foldmarker={,}
    au FileType javascript setlocal shiftwidth=4
    let g:syntastic_javascript_checkers=['eslint']
    " Make {<cr> insert a pair of brackets in such a way that the cursor is correctly
    " positioned inside of them AND the following code doesn't get unfolded.
    "au Filetype javascript inoremap <buffer> {<cr> {}<left><cr><space><space><space><space>.<cr><esc>kA<bs>
    au Filetype javascript setlocal nofoldenable
augroup END

" }}}
" LaTeX {{{
"augroup ft_log "{{{
    "au FileType log set syntax=log_atp
""}}}
let g:tex_flavor='xelatex'
augroup ft_tex
    "au BufEnter *.tex source ~/.vim/bundle/imaps/imap.vim
    au FileType tex setlocal spell
    "au FileType tex setlocal spelllang=en_gb
    "au FileType tex setlocal matchpairs="(:),[:],{:},“:”,„:“,⟨:⟩,❴:❵"
    "au FileType tex let b:delimitMate_matchpairs = "(:),[:],{:}"
    au FileType tex let b:delimitMate_quotes     = "\" ' $"
    "au FileType tex let b:delimitMate_nesting_quotes  = ['"','$']
    "command Tev ATP_TeXVerbos
    "let b:showmarks_enable = 1
    let g:indent_guides_enable_on_vim_startup = 1
    let g:indent_guides_start_level           = 2
    let g:indent_guides_indent_levels         = 2
    let g:indent_guides_guide_size            = 1

    let g:indent_guides_auto_colors = 0
    "autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=Gray15 ctermbg=235
    "autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=Gray14 ctermbg=236
    let g:showmarks_enable=1

    let g:atp_folding=0
    let g:atp_fold_environments=0
    let g:tex_comment_nospell=1
   "ATP messes with spell checking - great
    au FileType tex nnoremap ]= ]sz=
    au FileType tex nnoremap [= [sz=;
   "au FileType tex setlocal foldmethod=marker foldmarker=\\begin\{,\\end\{
   "ab α $α$                        ab κ $κ$    ab Γ $Γ$| 
   "ab β $β$    ab σ $σ$|           ab 𝓚 $𝓚$    ab Δ $Δ$| 
   "ab γ $γ$    ab ς $ς$|           ab 𝓚 $𝓚$    ab Δ $Δ$| 
   "ab δ $δ$    ab τ $τ$|           ab λ $λ$    ab Θ $Θ$| 
   "ab ∊ $∊$    ab υ $υ$|           ab μ $μ$    ab Λ $Λ$| 
   "ab ε $ε$    ab φ $φ$|           ab ν $ν$    ab Ξ $Ξ$| 
   "ab ζ $ζ$    ab ϕ $ϕ$|           ab ξ $ξ$    ab Π $Π$| 
   "ab η $η$    ab χ $χ$|           ab π $π$    ab Υ $Υ$| 
   "ab θ $θ$    ab ψ $ψ$|           ab ϖ $ϖ$    ab Φ $Φ$| 
   "ab ϑ $ϑ$    ab ω $ω$|           ab ρ $ρ$    ab Ψ $Ψ$| 
   "ab ι $ι$    ab Γ $Γ$|           ab ϱ $ϱ$    ab Ω $Ω$| 

augroup END

"augroup ft_bib
    "set tabstop=8
    ""set nolist
    ""    hi WhitespaceEOL NONE
"augroup END

" }}}
" Markdown {{{

augroup ft_markdown
    au!

    au BufNewFile,BufRead *.md,*.m*down setlocal filetype=markdown
    au BufNewFile,BufRead *.markdown_github setlocal filetype=markdown
    au BufNewFile,BufRead *.md,*.m*down setlocal spell
    au Syntax markdown call SyntaxRange#Include('\`\`\`haskell', '\`\`\`', 'haskell', 'NonText')
    au Syntax markdown call SyntaxRange#Include('\`\`\`cypher', '\`\`\`', 'cypher', 'NonText')


    " Use <localleader>1/2/3 to add headings.
    "au Filetype markdown nnoremap <buffer> <localleader>1 yypVr=
    "au Filetype markdown nnoremap <buffer> <localleader>2 yypVr-
    "au Filetype markdown nnoremap <buffer> <localleader>3 I### <ESC>
augroup END

" }}}
" Mail {{{
au FileType mail call FT_mail()

function FT_mail()
    set nocindent
    set noautoindent
    set textwidth=68
    " reformat for 72 char lines
    " normal gggqGgg
    " settings
    " setlocal fileencoding=iso8859-1,utf-8
    set fileencodings=iso8859-1,utf-8
    " abbreviations
endfunction
" }}}
" }}}
" Quick editing ----------------------------------------------------------- {{{

nnoremap <leader>vv <C-w>s<C-w>j:e $MYVIMRC<cr>
nnoremap <leader>vs <C-w>s<C-w>j:e ~/.vim/bundle/UltiSnips/UltiSnips/<cr>
nnoremap <leader>vu <C-w>s<C-w>j:e ~/.vim/bundle/imaps/imap.vim<cr>
nnoremap <leader>vo <C-w>s<C-w>j:e ~/org<cr>4j
nnoremap <leader>vx <C-w>s<C-w>j:e ~/.xmonad/xmonad.hs<cr>

nnoremap <leader>ev :e $MYVIMRC<cr>
nnoremap <leader>es :e ~/.vim/bundle/UltiSnips/UltiSnips/<cr>
nnoremap <leader>eu :e ~/.vim/bundle/imaps/imap.vim<cr>
nnoremap <leader>eo :e ~/org<cr>4j
nnoremap <leader>ex :e ~/.xmonad/xmonad.hs<cr>

nnoremap <leader>tv :tabe $MYVIMRC<cr>
nnoremap <leader>ts :tabe ~/.vim/bundle/UltiSnips/UltiSnips/<cr>
nnoremap <leader>tu :tabe ~/.vim/bundle/imaps/imap.vim<cr>
nnoremap <leader>to :tabe ~/org<cr>4j
nnoremap <leader>tx :tabe ~/.xmonad/xmonad.hs<cr>

"nnoremap <leader>eh <C-w>s<C-w>j:e ~/.hgrc<cr>
"nnoremap <leader>em <C-w>s<C-w>j:e ~/.mutt/muttrc<cr>
"nnoremap <leader>ez <C-w>s<C-w>j:e ~/lib/dotfiles/zsh<cr>4j
"nnoremap <leader>ek <C-w>s<C-w>j:e ~/lib/dotfiles/keymando/keymandorc.rb<cr>

"map <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>
map <Leader>t :tabe <C-R>=expand("%:p:h") . "/" <CR>

" }}}
" Shell ------------------------------------------------------------------- {{{
function! s:RunShellCommand(cmdline) "{{{
  echo a:cmdline
  let expanded_cmdline = a:cmdline
  for part in split(a:cmdline, ' ')
     if part[0] =~ '\v[%#<]'
        let expanded_part = fnameescape(expand(part))
        let expanded_cmdline = substitute(expanded_cmdline, part, expanded_part, '')
     endif
  endfor
  botright new
  setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile nowrap
  call setline(1, 'You entered:    ' . a:cmdline)
  call setline(2, 'Expanded Form:  ' .expanded_cmdline)
  call setline(3,substitute(getline(2),'.','=','g'))
  execute '$read !'. expanded_cmdline
  setlocal nomodifiable
  1
endfunction "}}}
command! -complete=shellcmd -nargs=+ Shell call s:RunShellCommand(<q-args>)

function! s:ExecuteInShell(command) " {{{
    let command = join(map(split(a:command), 'expand(v:val)'))
    let winnr = bufwinnr('^' . command . '$')
    silent! execute  winnr < 0 ? 'botright vnew ' . fnameescape(command) : winnr . 'wincmd w'
    setlocal buftype=nowrite bufhidden=wipe nobuflisted noswapfile nowrap nonumber
    echo 'Execute ' . command . '...'
    silent! execute 'silent %!'. command
    silent! redraw
    silent! execute 'au BufUnload <buffer> execute bufwinnr(' . bufnr('#') . ') . ''wincmd w'''
    silent! execute 'nnoremap <silent> <buffer> <LocalLeader>r :call <SID>ExecuteInShell(''' . command . ''')<CR>:AnsiEsc<CR>'
    silent! execute 'nnoremap <silent> <buffer> q :q<CR>'
    silent! execute 'AnsiEsc'
    echo 'Shell command ' . command . ' executed.'
endfunction " }}}
command! -complete=shellcmd -nargs=+ Slshell call s:ExecuteInShell(<q-args>)
nnoremap <leader>! :Slshell
"Shell unicode --max=100000 parallel | ag -v \"Category|Bidi|Decomposition|UTF|Numeric value|Digit value|mirrored\"
" }}}
" Convenience mappings ---------------------------------------------------- {{{

" sane <esc> function!
"inoremap <silent> <Esc> <Esc>`^
"inoremap <silent> <Esc> <C-O>:stopinsert<CR>

" Clean trailing whitespace
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<cr>

nmap <S-End> <End>2BE
imap <S-End> <esc><End>2BEa

" Send visual selection to gist.github.com as a private, filetyped Gist
" Requires the gist command line too (brew install gist)
"vnoremap <leader>G :w !gist -p -t %:e \| pbcopy<cr>

" insert newline and stay normal (inserting is not that hard)
nnoremap o o<esc>
nnoremap O O<esc>

" delete word forward
inoremap <C-d> ldiwi

" inserting a single letter
function! RepeatChar(char, count)
  return repeat(a:char, a:count)
endfunction
nnoremap s :<C-U>exeC "normal i".RepeatChar(nr2char(getchar()), v:count1)<CR>
nnoremap σ :<C-U>exec "normal a".RepeatChar(nr2char(getchar()), v:count1)<CR>

" Substitute
nnoremap <leader>s :%s//<left>
" fooo eai u aui eai u
" fooo:eai:u:aui:eai:u
vnoremap <leader>: :s/\%V\ /:/g<cr>

" Diffoff
nnoremap <leader>D :diffoff!<cr>


" Formatting, TextMate-style
set formatprg=par\ -w80r
nnoremap Q gqip
vnoremap QQ JAa<esc>x^$
" FORMATTING labels - in equations
" Fills in 200 <spaces> jumps to column 101 and pulls the \label{…} back and
" jumps to the end of the equation
nnoremap <C-q> mtl200i 101\|dw0`t
inoremap <C-q> <esc>mtl200i 101\|dw0`ta
" Easier linewise reselection: selects the previously pasted (to indent …)
nnoremap <leader>V V`]

" Split line (sister to [J]oin lines)
" The normal use of S is covered by cc, so don't worry about shadowing it.
nnoremap S i<cr><esc><right>
nnoremap <silent> J :let p=getpos('.')<bar>join<bar>call setpos('.', p)<cr>

" HTML tag closing
inoremap <C-_> <Space><BS><Esc>:call InsertCloseTag()<cr>a

" Align text
nnoremap <leader>Al :left<cr>
nnoremap <leader>Ac :center<cr>
nnoremap <leader>Ar :right<cr>
vnoremap <leader>Al :left<cr>
vnoremap <leader>Ac :center<cr>
vnoremap <leader>Ar :right<cr>


" Cmdheight switching/commandheight
nnoremap <leader>1 :set cmdheight=1<cr>
nnoremap <leader>2 :set cmdheight=2<cr>

" Source sources current line/selection
vnoremap <leader>S y:execute @@<cr>
nnoremap <leader>S ^vg_y:execute @@<cr>


" Select (charwise) the contents of the current line, excluding indentation.
" Great for pasting Python lines into REPLs.
nnoremap vv ^vg_

" Calculator
inoremap <C-B> <C-O>yiW<End>=<C-R>=<C-R>0<CR>

" Better Completion
set completeopt=longest,menuone,preview

" Sudo to write
cnoremap w!! w !sudo tee % >/dev/null

" Easy filetype switching {{{
nnoremap _md :set ft=markdown<CR>
nnoremap _hd :set ft=htmldjango<CR>
nnoremap _jt :set ft=htmljinja<CR>
nnoremap _cw :set ft=confluencewiki<CR>
nnoremap _pd :set ft=python.django<CR>
nnoremap _d  :set ft=diff<CR>
" }}}

map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" Quickreturn
"inoremap <c-cr> <esc>A<cr>
"inoremap <s-cr> <esc>A:<cr>

" }}}
" Training mappings ------------------------------------------------------- {{{

" Use L, dammit.
nnoremap Ajk <nop>
"nnoremap A<esc> <nop>
"nnoremap <cr> <nop>

" }}}
" CTags ------------------------------------------------------------------- {{{

" For some reason ctags refuses to ignore Python variables, so I'll just hack
" the tags file with sed and strip them out myself.
"
" Sigh.
" nnoremap <leader><cr> :silent !/usr/local/bin/ctags -R . && sed -i .bak -E -e '/^[^	]+	[^	]+.py	.+v$/d' tags<cr>
"

" }}}
" Plugin settings --------------------------------------------------------- {{{

" Autoclose {{{

nmap <Leader>x <Plug>ToggleAutoCloseMappings

" }}}
" Commentary {{{

nmap <leader>c <Plug>CommentaryLine
xmap <leader>c <Plug>Commentary
au FileType htmldjango setlocal commentstring={#\ %s\ #}

" }}}
" CmdAlias {{{
function! InitPlugins()
  call Cmd_Alias('tc', 'tabclose')
  au! InitPlugins VimEnter
endfunction

aug InitPlugins
  au!
  au VimEnter * :call InitPlugins()
aug END

" }}}
" Ctrl-P {{{

let g:ctrlp_map = '<leader>,'
let g:ctrlp_working_path_mode = 0
let g:ctrlp_match_window_reversed = 1
let g:ctrlp_split_window = 0
let g:ctrlp_max_height = 20
let g:ctrlp_prompt_mappings = {
\ 'PrtSelectMove("j")':   ['<c-j>', '<down>', '<s-tab>'],
\ 'PrtSelectMove("k")':   ['<c-k>', '<up>', '<tab>'],
\ 'PrtHistory(-1)':       ['<c-n>'],
\ 'PrtHistory(1)':        ['<c-p>'],
\ 'ToggleFocus()':        ['<c-tab>'],
\ }
let g:ctrlp_extensions = ['tag']

nnoremap <leader>. :CtrlPTag<cr>

" }}}
" Easymotion {{{
nmap f ;;f
nmap F ;;F
vmap f ;;f
vmap F ;;F
omap φ ;;f

"let g:EasyMotion_do_mapping = 0

"nnoremap <silent> <Leader>f      :call EasyMotionF(0, 0)<CR>
"onoremap <silent> <Leader>f      :call EasyMotionF(0, 0)<CR>
"vnoremap <silent> <Leader>f :<C-U>call EasyMotionF(1, 0)<CR>

"nnoremap <silent> <Leader>F      :call EasyMotionF(0, 1)<CR>
"onoremap <silent> <Leader>F      :call EasyMotionF(0, 1)<CR>
"vnoremap <silent> <Leader>F :<C-U>call EasyMotionF(1, 1)<CR>

"onoremap <silent> <Leader>t      :call EasyMotionT(0, 0)<CR>
"onoremap <silent> <Leader>T      :call EasyMotionT(0, 1)<CR>

" }}}
" Easy-Align {{{
vnoremap <silent> <Enter> :EasyAlign<cr>
" }}}
" Eclim{{{
let g:EclimCompletionMethod = 'omnifunc'
" }}}
" Fugitive {{{

nnoremap <leader>gd :Gdiff<cr>
nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>gw :Gwrite<cr>
nnoremap <leader>ga :Gadd<cr>
nnoremap <leader>gb :Gblame<cr>
nnoremap <leader>gco :Gcheckout<cr>
nnoremap <leader>gci :Gcommit<cr>
nnoremap <leader>gm :Gmove<cr>
nnoremap <leader>gr :Gremove<cr>
nnoremap <leader>gl :Shell git gl -18<cr>:wincmd \|<cr>

augroup ft_fugitive
    au!

    au BufNewFile,BufRead .git/index setlocal nolist
augroup END

" "Hub"
nnoremap <leader>H :Gbrowse<cr>
vnoremap <leader>H :Gbrowse<cr>

" }}}
" Gundo {{{

nnoremap <F5> :GundoToggle<CR>
let g:gundo_debug = 1
let g:gundo_preview_bottom = 1

" }}}
" Haskellmode {{{

" Open the definition in a new vsplit
nnoremap <LocalLeader>? :sp<CR>:exec("tag ".expand("<cword>"))<cr>

let g:haddock_browser = "/usr/bin/chromium"
let g:haddock_browser_callformat = "%s %s"
let g:haddock_docdir= "~/angebotsservice/.cabal-sandbox/share/doc/x86_64-linux-ghc-7.6.3/"
let g:haddock_indexfiledir= "~/.vim/"

" }}}
" Headlights {{{
let g:headlights_use_plugin_menu    = 0 "(Default: Disabled)
let g:headlights_show_files         = 1 "(Default: Disabled)
let g:headlights_show_commands      = 1 "(Default: Enabled)
let g:headlights_show_mappings      = 1 "(Default: Enabled)
let g:headlights_show_abbreviations = 0 "(Default: Disabled)
let g:headlights_show_functions     = 0 "(Default: Disabled)
let g:headlights_show_highlights    = 0 "(Default: Disabled)
let g:headlights_show_load_order    = 0 "(Default: Disabled)
let g:headlights_smart_menus        = 1 "(Default: Enabled)
let g:headlights_run_on_startup     = 0 "(Default: Disabled)
let g:headlights_spillover_menus    = 1 "(Default: Disabled)
let g:headlights_debug_mode         = 0 "(Default: Disabled)
" }}}
" HTML5 {{{

let g:event_handler_attributes_complete = 0
let g:rdfa_attributes_complete = 0
let g:microdata_attributes_complete = 0
let g:atia_attributes_complete = 0

" }}}
" Linediff {{{

vnoremap <leader>l :Linediff<cr>
nnoremap <leader>L :LinediffReset<cr>

" }}}
" Lisp (built-in) {{{

let g:lisp_rainbow = 1

" }}}
" Makegreen {{{

"nnoremap \| :call MakeGreen('')<cr>

" }}}
" NERDTree {{{

noremap  <F2> :NERDTreeToggle<cr>
inoremap <F2> <esc>:NERDTreeToggle<cr>
let g:NERDTreeWinSize=25

au Filetype nerdtree setlocal nolist
"au Filetype nerdtree setlocal sidescrolloff=0

let NERDTreeHighlightCursorline=1
let NERDTreeIgnore =['\~$','.*\.pyc$', 'pip-log\.txt$', 'whoosh_index']
let NERDTreeIgnore+=['xapian_index','.*.pid', 'monitor.py', '.*-fixtures-.*.json']
let NERDTreeIgnore+=['.*\.o$', 'db.db','.hi']
let NERDTreeIgnore+=['\.aux$' , '\.bbl$' , '\.blg$' , '\.dvi$' , '\.nls$' ]
let NERDTreeIgnore+=['\.glg$' , '\.glo$' , '\.gls$' , '\.idx$' , '\.fls$' ]
let NERDTreeIgnore+=['\.ilg$' , '\.ind$' , '\.ist$' , '\.log$' , '\.nlo$' ]
let NERDTreeIgnore+=['\.out$' , '\.toc$' , '\.dpth' , '\._aux$', '\._log$']
let NERDTreeIgnore+=['\.tdo$' , '\.synctex.gz' ,'\.fdb_latexmk$' ,'\.auxlock$']
"let NERDTreeIgnore+=['\.class']
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

" }}}
" Powerline {{{

let g:Powerline_symbols = 'fancy'

" }}}
" Rainbow Parentheses {{{
let g:rainbow_active = 0
"nnoremap <leader>R :SeeParentheses<cr>
"let g:rbpt_colorpairs = [
"    \ ['brown',       'RoyalBlue3'],
"    \ ['Darkblue',    'SeaGreen3'],
"    \ ['darkgray',    'DarkOrchid3'],
"    \ ['darkgreen',   'firebrick3'],
"    \ ['darkcyan',    'RoyalBlue3'],
"    \ ['darkred',     'SeaGreen3'],
"    \ ['darkmagenta', 'DarkOrchid3'],
"    \ ['brown',       'firebrick3'],
"    \ ['gray',        'RoyalBlue3'],
"    \ ['black',       'SeaGreen3'],
"    \ ['darkmagenta', 'DarkOrchid3'],
"    \ ['Darkblue',    'firebrick3'],
"    \ ['darkgreen',   'RoyalBlue3'],
"    \ ['darkcyan',    'SeaGreen3'],
"    \ ['darkred',     'DarkOrchid3'],
"    \ ['red',         'firebrick3'],
"    \ ]
"let g:rbpt_max = 16

"au VimEnter * RainbowParenthesesToggle
"au Syntax * RainbowParenthesesLoadBraces
"au Syntax * RainbowParenthesesLoadRound
"au Syntax * RainbowParenthesesLoadSquare

command! SeeParentheses call SeeParentheses()
function! SeeParentheses() " {{{
  if exists("b:see_parens")
    unlet b:see_parens
    set syntax=on
    highlight SpellBad term=reverse ctermbg=12 gui=undercurl guisp=Red
  else
    set syntax=off
    highlight SpellBad term=none ctermbg=12 gui=none guisp=Red
    let b:see_parens= 1
  endif
endfunction " }}}


" }}}
" Scratch {{{

command! ScratchToggle call ScratchToggle()

function! ScratchToggle() " {{{
  if exists("w:is_scratch_window")
    unlet w:is_scratch_window
    exec "q"
  else
    exec "normal! :Sscratch\<cr>\<C-W>J:resize 13\<cr>"
    let w:is_scratch_window = 1
  endif
endfunction " }}}

"nnoremap <silent> <leader><tab> :ScratchToggle<cr>

" }}}
" ShowMarks {{{
let g:showmarks_enable = 0
let g:showmarks_ignore_type="hmpqr"
" }}}
" Syntastic {{{
nmap <F8> :call SyntasticCheck()<cr>
let g:syntastic_auto_loc_list=1
"let g:syntastic_quiet_warnings=1
let g:syntastic_enable_signs = 1
let g:syntastic_disabled_filetypes = ['tex']
"let g:syntastic_stl_format = '[%E{%e Errors}%B{, }%W{%w Warnings}]'
let g:syntastic_stl_format = '[%E{Err: %fe #%e}%B{, }%W{Warn: %fw #%w}]'
"let g:syntastic_jsl_conf = '$HOME/.vim/jsl.conf'
let g:syntastic_mode_map = {
    \ "mode": "active",
    \ "active_filetypes": [],
    \ "passive_filetypes": ["haskell"] }

" }}}
" Easytag {{{
let g:easytags_languages = {
\   'haskell': {
\        'cmd': 'hasktags',
\        'args': [],
\        'fileoutput_opt': '-f',
\        'stdout_opt': '-f-',
\        'recurse_flag': '-R'
\    }
\ }

" }}}
" TagBar {{{
"autocmd BufWinEnter *.py,*.c nested TagbarOpen "open tagbar on certain filetypes
nnoremap <silent> <leader>= :TagbarToggle<CR>
let g:tagbar_autofocus = 1

"if executable('lushtags')
    "let g:tagbar_type_haskell = {
        "\ 'ctagsbin' : 'lushtags',
        "\ 'ctagsargs' : '--ignore-parse-error --',
        "\ 'kinds' : [
            "\ 'm:module:0',
            "\ 'e:exports:1',
            "\ 'i:imports:1',
            "\ 't:declarations:0',
            "\ 'd:declarations:1',
            "\ 'n:declarations:1',
            "\ 'f:functions:0',
            "\ 'c:constructors:0'
        "\ ],
        "\ 'sro' : '.',
        "\ 'kind2scope' : {
            "\ 'd' : 'data',
            "\ 'n' : 'newtype',
            "\ 'c' : 'constructor',
            "\ 't' : 'type'
        "\ },
        "\ 'scope2kind' : {
            "\ 'data' : 'd',
            "\ 'newtype' : 'n',
            "\ 'constructor' : 'c',
            "\ 'type' : 't'
        "\ }
    "\ }
"endif

let g:tagbar_type_haskell = {
    \ 'ctagsbin'  : 'hasktags',
    \ 'ctagsargs' : '-x -c -o-',
    \ 'kinds'     : [
        \  'm:modules:0:1',
        \  'd:data: 0:1',
        \  'd_gadt: data gadt:0:1',
        \  't:type names:0:1',
        \  'nt:new types:0:1',
        \  'c:classes:0:1',
        \  'cons:constructors:1:1',
        \  'c_gadt:constructor gadt:1:1',
        \  'c_a:constructor accessors:1:1',
        \  'ft:function types:1:1',
        \  'fi:function implementations:0:1',
        \  'o:others:0:1'
    \ ],
    \ 'sro'        : '.',
    \ 'kind2scope' : {
        \ 'm' : 'module',
        \ 'c' : 'class',
        \ 'd' : 'data',
        \ 't' : 'type'
    \ },
    \ 'scope2kind' : {
        \ 'module' : 'm',
        \ 'class'  : 'c',
        \ 'data'   : 'd',
        \ 'type'   : 't'
    \ }
\ }

let g:tagbar_type_tex = {
  \ 'ctagstype' : 'latex',
  \ 'kinds' : [
  \ 'P:part',
  \ 'c:chapters',
  \ 's:sections',
  \ 'u:subsections',
  \ 'b:subsubsections',
  \ 'g:graphics',
  \ 'e:equations',
  \ 't:theorems',
  \ 'l:lemmata',
  \ 'o:propositions',
  \ 'O:corollaries',
  \ 'E:examples',
  \ 'f:figures',
  \ 'r:refs:1',
  \ 'i:citations:1',
  \ 'L:listings',
  \ 'p:pagerefs:1'
  \ ],
  \ 'sort' : 1,
  \ }
" }}}
" Threesome {{{

"let g:threesome_leader = "-"

"let g:threesome_initial_mode = "grid"

"let g:threesome_initial_layout_grid = 1
"let g:threesome_initial_layout_loupe = 0
"let g:threesome_initial_layout_compare = 0
"let g:threesome_initial_layout_path = 0

"let g:threesome_initial_diff_grid = 1
"let g:threesome_initial_diff_loupe = 0
"let g:threesome_initial_diff_compare = 0
"let g:threesome_initial_diff_path = 0

"let g:threesome_initial_scrollbind_grid = 0
"let g:threesome_initial_scrollbind_loupe = 0
"let g:threesome_initial_scrollbind_compare = 0
"let g:threesome_initial_scrollbind_path = 0

"let g:threesome_wrap = "nowrap"

" }}}
" UltiSnip {{{
"" better key bindings for UltiSnipsExpandTrigger
    let g:UltiSnipsExpandTrigger = "<tab>"
    let g:UltiSnipsJumpForwardTrigger = "<tab>"
    let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
    let g:UltiSnipsListSnippets="<F11>"
    let g:UltiSnipsEditSplit="vertical"
" }}}
" YankRing {{{
nnoremap <silent> <F11> :YRShow<cr>
function! YRRunAfterMaps()
    nnoremap Y :<C-U>YRYankCount 'y$'<CR>
    omap <expr> L YRMapsExpression("", "$")
    omap <expr> H YRMapsExpression("", "^")
    let g:yankring_history_dir='~/.vim/tmp/'
endfunction
" }}}
" YouCompleteMe {{{
" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_confirm_extra_conf = 0
let g:ycm_semantic_triggers = {'haskell' : ['.']}
" }}}

" }}}
" Text objects ------------------------------------------------------------ {{{

" Shortcut for [] {{{

onoremap id i[
onoremap ad a[
vnoremap id i[
vnoremap ad a[

" }}}
" Next and Last {{{

" Motion for "next/last object". For example, "din(" would go to the next "()"
" pair and delete its contents.

onoremap an :<c-u>call <SID>NextTextObject('a', 'f')<cr>
xnoremap an :<c-u>call <SID>NextTextObject('a', 'f')<cr>
onoremap in :<c-u>call <SID>NextTextObject('i', 'f')<cr>
xnoremap in :<c-u>call <SID>NextTextObject('i', 'f')<cr>

onoremap al :<c-u>call <SID>NextTextObject('a', 'F')<cr>
xnoremap al :<c-u>call <SID>NextTextObject('a', 'F')<cr>
onoremap il :<c-u>call <SID>NextTextObject('i', 'F')<cr>
xnoremap il :<c-u>call <SID>NextTextObject('i', 'F')<cr>

function! s:NextTextObject(motion, dir)
  let c = nr2char(getchar())

  if c ==# "b"
      let c = "("
  elseif c ==# "B"
      let c = "{"
  elseif c ==# "d"
      let c = "["
  endif

  exe "normal! ".a:dir.c."v".a:motion.c
endfunction

" }}}

" }}}
" Ack motions ------------------------------------------------------------- {{{

" Motions to Ack for things.  Works with pretty much everything, including:
"
"   w, W, e, E, b, B, t*, f*, i*, a*, and custom text objects
"
" Awesome.
"
" Note: If the text covered by a motion contains a newline it won't work.  Ack
" searches line-by-line.
" 
" nnoremap <silent> \a :set opfunc=<SID>AckMotion<CR>g@
" xnoremap <silent> \a :<C-U>call <SID>AckMotion(visualmode())<CR>
" 
" function! s:CopyMotionForType(type)
"     if a:type ==# 'v'
"         silent execute "normal! `<" . a:type . "`>y"
"     elseif a:type ==# 'char'
"         silent execute "normal! `[v`]y"
"     endif
" endfunction
" 
" function! s:AckMotion(type) abort
"     let reg_save = @@
" 
"     call s:CopyMotionForType(a:type)
" 
"     execute "normal! :Ack! --literal " . shellescape(@@) . "\<cr>"
" 
"     let @@ = reg_save
" endfunction
" 
" }}}
" Error toggles ----------------------------------------------------------- {{{

command! ErrorsToggle call ErrorsToggle()
function! ErrorsToggle() " {{{
  if exists("w:is_error_window")
    unlet w:is_error_window
    exec "q"
  else
    exec "Errors"
    lopen
    let w:is_error_window = 1
  endif
endfunction " }}}

command! -bang -nargs=? QFixToggle call QFixToggle(<bang>0)
function! QFixToggle(forced) " {{{
  if exists("g:qfix_win") && a:forced == 0
    cclose
    unlet g:qfix_win
  else
    copen 10
    let g:qfix_win = bufnr("$")
  endif
endfunction " }}}

nmap <silent> <S-F3> :ErrorsToggle<cr>
noremap <silent> <S-F1> :QFixToggle<cr>

" }}}
" Utils ------------------------------------------------------------------- {{{

map <S-F8> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

function! g:Echodammit(msg)
    exec 'echom "----------> ' . a:msg . '"'
endfunction

" Synstack {{{

" Show the stack of syntax highlighting classes affecting whatever is under the
" cursor.
function! SynStack() "{{{
  echo join(map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")'), " > ")
endfunc "}}}

nnoremap ß :call SynStack()<CR>

" }}}
" Toggle whitespace in diffs {{{

set diffopt-=iwhite
let g:diffwhitespaceon = 1
function! ToggleDiffWhitespace() "{{{
    if g:diffwhitespaceon
        set diffopt-=iwhite
        let g:diffwhitespaceon = 0
    else
        set diffopt+=iwhite
        let g:diffwhitespaceon = 1
    endif
    diffupdate
endfunc "}}}

nnoremap <leader>dw :call ToggleDiffWhitespace()<CR>

" }}}

" }}}
" Hg ---------------------------------------------------------------------- {{{

function! s:HgDiff()
    diffthis

    let fn = expand('%:p')
    let ft = &ft

    wincmd v
    edit __hgdiff_orig__

    setlocal buftype=nofile

    normal ggdG
    execute "silent r!hg cat --rev . " . fn
    normal ggdd

    execute "setlocal ft=" . ft

    diffthis
    diffupdate
endf
command! -nargs=0 HgDiff call s:HgDiff()
nnoremap <leader>hd :HgDiff<cr>

function! s:HgBlame()
    let fn = expand('%:p')

    wincmd v
    wincmd h
    edit __hgblame__
    vertical resize 28

    setlocal scrollbind winfixwidth nolist nowrap nonumber buftype=nofile ft=none

    normal ggdG
    execute "silent r!hg blame -undq " . fn
    normal ggdd
    execute ':%s/\v:.*$//'

    wincmd l
    setlocal scrollbind
    syncbind
endf
command! -nargs=0 HgBlame call s:HgBlame()
nnoremap <leader>hb :HgBlame<cr>

" }}}
" Nyan! ------------------------------------------------------------------- {{{

function! NyanMe() " {{{
    hi NyanFur             guifg=#BBBBBB
    hi NyanPoptartEdge     guifg=#ffd0ac
    hi NyanPoptartFrosting guifg=#fd3699 guibg=#fe98ff
    hi NyanRainbow1        guifg=#6831f8
    hi NyanRainbow2        guifg=#0099fc
    hi NyanRainbow3        guifg=#3cfa04
    hi NyanRainbow4        guifg=#fdfe00
    hi NyanRainbow5        guifg=#fc9d00
    hi NyanRainbow6        guifg=#fe0000


    echohl NyanRainbow1
    echon "≈"
    echohl NyanRainbow2
    echon "≋"
    echohl NyanRainbow3
    echon "≈"
    echohl NyanRainbow4
    echon "≋"
    echohl NyanRainbow5
    echon "≈"
    echohl NyanRainbow6
    echon "≋"
    echohl NyanRainbow1
    echon "≈"
    echohl NyanRainbow2
    echon "≋"
    echohl NyanRainbow3
    echon "≈"
    echohl NyanRainbow4
    echon "≋"
    echohl NyanRainbow5
    echon "≈"
    echohl NyanRainbow6
    echon "≋"
    echohl None
    echo ""

    echohl NyanRainbow1
    echon "≈"
    echohl NyanRainbow2
    echon "≋"
    echohl NyanRainbow3
    echon "≈"
    echohl NyanRainbow4
    echon "≋"
    echohl NyanRainbow5
    echon "≈"
    echohl NyanRainbow6
    echon "≋"
    echohl NyanRainbow1
    echon "≈"
    echohl NyanRainbow2
    echon "≋"
    echohl NyanRainbow3
    echon "≈"
    echohl NyanRainbow4
    echon "≋"
    echohl NyanRainbow5
    echon "≈"
    echohl NyanRainbow6
    echon "≋"
    echohl NyanFur
    echon "╰"
    echohl NyanPoptartEdge
    echon "⟨"
    echohl NyanPoptartFrosting
    echon "⣮⣯⡿"
    echohl NyanPoptartEdge
    echon "⟩"
    echohl NyanFur
    echon "⩾^ω^⩽"
    echohl None
    echo ""

    echohl NyanRainbow1
    echon "≈"
    echohl NyanRainbow2
    echon "≋"
    echohl NyanRainbow3
    echon "≈"
    echohl NyanRainbow4
    echon "≋"
    echohl NyanRainbow5
    echon "≈"
    echohl NyanRainbow6
    echon "≋"
    echohl NyanRainbow1
    echon "≈"
    echohl NyanRainbow2
    echon "≋"
    echohl NyanRainbow3
    echon "≈"
    echohl NyanRainbow4
    echon "≋"
    echohl NyanRainbow5
    echon "≈"
    echohl NyanRainbow6
    echon "≋"
    echohl None
    echon " "
    echohl NyanFur
    echon "”   ‟"
    echohl None

    sleep 1
    redraw
    echo " "
    echo " "
    echo "Noms?"
    redraw
endfunction " }}}
command! NyanMe call NyanMe()

" }}}
" COLORS {{{

hi x016_Grey0             ctermfg=16  guifg=#000000 "rgb=0,0,0
hi x017_NavyBlue          ctermfg=17  guifg=#00005f "rgb=0,0,95
hi x018_DarkBlue          ctermfg=18  guifg=#000087 "rgb=0,0,135
hi x019_Blue3             ctermfg=19  guifg=#0000af "rgb=0,0,175
hi x020_Blue3             ctermfg=20  guifg=#0000d7 "rgb=0,0,215
hi x021_Blue1             ctermfg=21  guifg=#0000ff "rgb=0,0,255
hi x022_DarkGreen         ctermfg=22  guifg=#005f00 "rgb=0,95,0
hi x023_DeepSkyBlue4      ctermfg=23  guifg=#005f5f "rgb=0,95,95
hi x024_DeepSkyBlue4      ctermfg=24  guifg=#005f87 "rgb=0,95,135
hi x025_DeepSkyBlue4      ctermfg=25  guifg=#005faf "rgb=0,95,175
hi x026_DodgerBlue3       ctermfg=26  guifg=#005fd7 "rgb=0,95,215
hi x027_DodgerBlue2       ctermfg=27  guifg=#005fff "rgb=0,95,255
hi x028_Green4            ctermfg=28  guifg=#008700 "rgb=0,135,0
hi x029_SpringGreen4      ctermfg=29  guifg=#00875f "rgb=0,135,95
hi x030_Turquoise4        ctermfg=30  guifg=#008787 "rgb=0,135,135
hi x031_DeepSkyBlue3      ctermfg=31  guifg=#0087af "rgb=0,135,175
hi x032_DeepSkyBlue3      ctermfg=32  guifg=#0087d7 "rgb=0,135,215
hi x033_DodgerBlue1       ctermfg=33  guifg=#0087ff "rgb=0,135,255
hi x034_Green3            ctermfg=34  guifg=#00af00 "rgb=0,175,0
hi x035_SpringGreen3      ctermfg=35  guifg=#00af5f "rgb=0,175,95
hi x036_DarkCyan          ctermfg=36  guifg=#00af87 "rgb=0,175,135
hi x037_LightSeaGreen     ctermfg=37  guifg=#00afaf "rgb=0,175,175
hi x038_DeepSkyBlue2      ctermfg=38  guifg=#00afd7 "rgb=0,175,215
hi x039_DeepSkyBlue1      ctermfg=39  guifg=#00afff "rgb=0,175,255
hi x040_Green3            ctermfg=40  guifg=#00d700 "rgb=0,215,0
hi x041_SpringGreen3      ctermfg=41  guifg=#00d75f "rgb=0,215,95
hi x042_SpringGreen2      ctermfg=42  guifg=#00d787 "rgb=0,215,135
hi x043_Cyan3             ctermfg=43  guifg=#00d7af "rgb=0,215,175
hi x044_DarkTurquoise     ctermfg=44  guifg=#00d7d7 "rgb=0,215,215
hi x045_Turquoise2        ctermfg=45  guifg=#00d7ff "rgb=0,215,255
hi x046_Green1            ctermfg=46  guifg=#00ff00 "rgb=0,255,0
hi x047_SpringGreen2      ctermfg=47  guifg=#00ff5f "rgb=0,255,95
hi x048_SpringGreen1      ctermfg=48  guifg=#00ff87 "rgb=0,255,135
hi x049_MediumSpringGreen ctermfg=49  guifg=#00ffaf "rgb=0,255,175
hi x050_Cyan2             ctermfg=50  guifg=#00ffd7 "rgb=0,255,215
hi x051_Cyan1             ctermfg=51  guifg=#00ffff "rgb=0,255,255
hi x052_DarkRed           ctermfg=52  guifg=#5f0000 "rgb=95,0,0
hi x053_DeepPink4         ctermfg=53  guifg=#5f005f "rgb=95,0,95
hi x054_Purple4           ctermfg=54  guifg=#5f0087 "rgb=95,0,135
hi x055_Purple4           ctermfg=55  guifg=#5f00af "rgb=95,0,175
hi x056_Purple3           ctermfg=56  guifg=#5f00d7 "rgb=95,0,215
hi x057_BlueViolet        ctermfg=57  guifg=#5f00ff "rgb=95,0,255
hi x058_Orange4           ctermfg=58  guifg=#5f5f00 "rgb=95,95,0
hi x059_Grey37            ctermfg=59  guifg=#5f5f5f "rgb=95,95,95
hi x060_MediumPurple4     ctermfg=60  guifg=#5f5f87 "rgb=95,95,135
hi x061_SlateBlue3        ctermfg=61  guifg=#5f5faf "rgb=95,95,175
hi x062_SlateBlue3        ctermfg=62  guifg=#5f5fd7 "rgb=95,95,215
hi x063_RoyalBlue1        ctermfg=63  guifg=#5f5fff "rgb=95,95,255
hi x064_Chartreuse4       ctermfg=64  guifg=#5f8700 "rgb=95,135,0
hi x065_DarkSeaGreen4     ctermfg=65  guifg=#5f875f "rgb=95,135,95
hi x066_PaleTurquoise4    ctermfg=66  guifg=#5f8787 "rgb=95,135,135
hi x067_SteelBlue         ctermfg=67  guifg=#5f87af "rgb=95,135,175
hi x068_SteelBlue3        ctermfg=68  guifg=#5f87d7 "rgb=95,135,215
hi x069_CornflowerBlue    ctermfg=69  guifg=#5f87ff "rgb=95,135,255
hi x070_Chartreuse3       ctermfg=70  guifg=#5faf00 "rgb=95,175,0
hi x071_DarkSeaGreen4     ctermfg=71  guifg=#5faf5f "rgb=95,175,95
hi x072_CadetBlue         ctermfg=72  guifg=#5faf87 "rgb=95,175,135
hi x073_CadetBlue         ctermfg=73  guifg=#5fafaf "rgb=95,175,175
hi x074_SkyBlue3          ctermfg=74  guifg=#5fafd7 "rgb=95,175,215
hi x075_SteelBlue1        ctermfg=75  guifg=#5fafff "rgb=95,175,255
hi x076_Chartreuse3       ctermfg=76  guifg=#5fd700 "rgb=95,215,0
hi x077_PaleGreen3        ctermfg=77  guifg=#5fd75f "rgb=95,215,95
hi x078_SeaGreen3         ctermfg=78  guifg=#5fd787 "rgb=95,215,135
hi x079_Aquamarine3       ctermfg=79  guifg=#5fd7af "rgb=95,215,175
hi x080_MediumTurquoise   ctermfg=80  guifg=#5fd7d7 "rgb=95,215,215
hi x081_SteelBlue1        ctermfg=81  guifg=#5fd7ff "rgb=95,215,255
hi x082_Chartreuse2       ctermfg=82  guifg=#5fff00 "rgb=95,255,0
hi x083_SeaGreen2         ctermfg=83  guifg=#5fff5f "rgb=95,255,95
hi x084_SeaGreen1         ctermfg=84  guifg=#5fff87 "rgb=95,255,135
hi x085_SeaGreen1         ctermfg=85  guifg=#5fffaf "rgb=95,255,175
hi x086_Aquamarine1       ctermfg=86  guifg=#5fffd7 "rgb=95,255,215
hi x087_DarkSlateGray2    ctermfg=87  guifg=#5fffff "rgb=95,255,255
hi x088_DarkRed           ctermfg=88  guifg=#870000 "rgb=135,0,0
hi x089_DeepPink4         ctermfg=89  guifg=#87005f "rgb=135,0,95
hi x090_DarkMagenta       ctermfg=90  guifg=#870087 "rgb=135,0,135
hi x091_DarkMagenta       ctermfg=91  guifg=#8700af "rgb=135,0,175
hi x092_DarkViolet        ctermfg=92  guifg=#8700d7 "rgb=135,0,215
hi x093_Purple            ctermfg=93  guifg=#8700ff "rgb=135,0,255
hi x094_Orange4           ctermfg=94  guifg=#875f00 "rgb=135,95,0
hi x095_LightPink4        ctermfg=95  guifg=#875f5f "rgb=135,95,95
hi x096_Plum4             ctermfg=96  guifg=#875f87 "rgb=135,95,135
hi x097_MediumPurple3     ctermfg=97  guifg=#875faf "rgb=135,95,175
hi x098_MediumPurple3     ctermfg=98  guifg=#875fd7 "rgb=135,95,215
hi x099_SlateBlue1        ctermfg=99  guifg=#875fff "rgb=135,95,255
hi x100_Yellow4           ctermfg=100 guifg=#878700 "rgb=135,135,0
hi x101_Wheat4            ctermfg=101 guifg=#87875f "rgb=135,135,95
hi x102_Grey53            ctermfg=102 guifg=#878787 "rgb=135,135,135
hi x103_LightSlateGrey    ctermfg=103 guifg=#8787af "rgb=135,135,175
hi x104_MediumPurple      ctermfg=104 guifg=#8787d7 "rgb=135,135,215
hi x105_LightSlateBlue    ctermfg=105 guifg=#8787ff "rgb=135,135,255
hi x106_Yellow4           ctermfg=106 guifg=#87af00 "rgb=135,175,0
hi x107_DarkOliveGreen3   ctermfg=107 guifg=#87af5f "rgb=135,175,95
hi x108_DarkSeaGreen      ctermfg=108 guifg=#87af87 "rgb=135,175,135
hi x109_LightSkyBlue3     ctermfg=109 guifg=#87afaf "rgb=135,175,175
hi x110_LightSkyBlue3     ctermfg=110 guifg=#87afd7 "rgb=135,175,215
hi x111_SkyBlue2          ctermfg=111 guifg=#87afff "rgb=135,175,255
hi x112_Chartreuse2       ctermfg=112 guifg=#87d700 "rgb=135,215,0
hi x113_DarkOliveGreen3   ctermfg=113 guifg=#87d75f "rgb=135,215,95
hi x114_PaleGreen3        ctermfg=114 guifg=#87d787 "rgb=135,215,135
hi x115_DarkSeaGreen3     ctermfg=115 guifg=#87d7af "rgb=135,215,175
hi x116_DarkSlateGray3    ctermfg=116 guifg=#87d7d7 "rgb=135,215,215
hi x117_SkyBlue1          ctermfg=117 guifg=#87d7ff "rgb=135,215,255
hi x118_Chartreuse1       ctermfg=118 guifg=#87ff00 "rgb=135,255,0
hi x119_LightGreen        ctermfg=119 guifg=#87ff5f "rgb=135,255,95
hi x120_LightGreen        ctermfg=120 guifg=#87ff87 "rgb=135,255,135
hi x121_PaleGreen1        ctermfg=121 guifg=#87ffaf "rgb=135,255,175
hi x122_Aquamarine1       ctermfg=122 guifg=#87ffd7 "rgb=135,255,215
hi x123_DarkSlateGray1    ctermfg=123 guifg=#87ffff "rgb=135,255,255
hi x124_Red3              ctermfg=124 guifg=#af0000 "rgb=175,0,0
hi x125_DeepPink4         ctermfg=125 guifg=#af005f "rgb=175,0,95
hi x126_MediumVioletRed   ctermfg=126 guifg=#af0087 "rgb=175,0,135
hi x127_Magenta3          ctermfg=127 guifg=#af00af "rgb=175,0,175
hi x128_DarkViolet        ctermfg=128 guifg=#af00d7 "rgb=175,0,215
hi x129_Purple            ctermfg=129 guifg=#af00ff "rgb=175,0,255
hi x130_DarkOrange3       ctermfg=130 guifg=#af5f00 "rgb=175,95,0
hi x131_IndianRed         ctermfg=131 guifg=#af5f5f "rgb=175,95,95
hi x132_HotPink3          ctermfg=132 guifg=#af5f87 "rgb=175,95,135
hi x133_MediumOrchid3     ctermfg=133 guifg=#af5faf "rgb=175,95,175
hi x134_MediumOrchid      ctermfg=134 guifg=#af5fd7 "rgb=175,95,215
hi x135_MediumPurple2     ctermfg=135 guifg=#af5fff "rgb=175,95,255
hi x136_DarkGoldenrod     ctermfg=136 guifg=#af8700 "rgb=175,135,0
hi x137_LightSalmon3      ctermfg=137 guifg=#af875f "rgb=175,135,95
hi x138_RosyBrown         ctermfg=138 guifg=#af8787 "rgb=175,135,135
hi x139_Grey63            ctermfg=139 guifg=#af87af "rgb=175,135,175
hi x140_MediumPurple2     ctermfg=140 guifg=#af87d7 "rgb=175,135,215
hi x141_MediumPurple1     ctermfg=141 guifg=#af87ff "rgb=175,135,255
hi x142_Gold3             ctermfg=142 guifg=#afaf00 "rgb=175,175,0
hi x143_DarkKhaki         ctermfg=143 guifg=#afaf5f "rgb=175,175,95
hi x144_NavajoWhite3      ctermfg=144 guifg=#afaf87 "rgb=175,175,135
hi x145_Grey69            ctermfg=145 guifg=#afafaf "rgb=175,175,175
hi x146_LightSteelBlue3   ctermfg=146 guifg=#afafd7 "rgb=175,175,215
hi x147_LightSteelBlue    ctermfg=147 guifg=#afafff "rgb=175,175,255
hi x148_Yellow3           ctermfg=148 guifg=#afd700 "rgb=175,215,0
hi x149_DarkOliveGreen3   ctermfg=149 guifg=#afd75f "rgb=175,215,95
hi x150_DarkSeaGreen3     ctermfg=150 guifg=#afd787 "rgb=175,215,135
hi x151_DarkSeaGreen2     ctermfg=151 guifg=#afd7af "rgb=175,215,175
hi x152_LightCyan3        ctermfg=152 guifg=#afd7d7 "rgb=175,215,215
hi x153_LightSkyBlue1     ctermfg=153 guifg=#afd7ff "rgb=175,215,255
hi x154_GreenYellow       ctermfg=154 guifg=#afff00 "rgb=175,255,0
hi x155_DarkOliveGreen2   ctermfg=155 guifg=#afff5f "rgb=175,255,95
hi x156_PaleGreen1        ctermfg=156 guifg=#afff87 "rgb=175,255,135
hi x157_DarkSeaGreen2     ctermfg=157 guifg=#afffaf "rgb=175,255,175
hi x158_DarkSeaGreen1     ctermfg=158 guifg=#afffd7 "rgb=175,255,215
hi x159_PaleTurquoise1    ctermfg=159 guifg=#afffff "rgb=175,255,255
hi x160_Red3              ctermfg=160 guifg=#d70000 "rgb=215,0,0
hi x161_DeepPink3         ctermfg=161 guifg=#d7005f "rgb=215,0,95
hi x162_DeepPink3         ctermfg=162 guifg=#d70087 "rgb=215,0,135
hi x163_Magenta3          ctermfg=163 guifg=#d700af "rgb=215,0,175
hi x164_Magenta3          ctermfg=164 guifg=#d700d7 "rgb=215,0,215
hi x165_Magenta2          ctermfg=165 guifg=#d700ff "rgb=215,0,255
hi x166_DarkOrange3       ctermfg=166 guifg=#d75f00 "rgb=215,95,0
hi x167_IndianRed         ctermfg=167 guifg=#d75f5f "rgb=215,95,95
hi x168_HotPink3          ctermfg=168 guifg=#d75f87 "rgb=215,95,135
hi x169_HotPink2          ctermfg=169 guifg=#d75faf "rgb=215,95,175
hi x170_Orchid            ctermfg=170 guifg=#d75fd7 "rgb=215,95,215
hi x171_MediumOrchid1     ctermfg=171 guifg=#d75fff "rgb=215,95,255
hi x172_Orange3           ctermfg=172 guifg=#d78700 "rgb=215,135,0
hi x173_LightSalmon3      ctermfg=173 guifg=#d7875f "rgb=215,135,95
hi x174_LightPink3        ctermfg=174 guifg=#d78787 "rgb=215,135,135
hi x175_Pink3             ctermfg=175 guifg=#d787af "rgb=215,135,175
hi x176_Plum3             ctermfg=176 guifg=#d787d7 "rgb=215,135,215
hi x177_Violet            ctermfg=177 guifg=#d787ff "rgb=215,135,255
hi x178_Gold3             ctermfg=178 guifg=#d7af00 "rgb=215,175,0
hi x179_LightGoldenrod3   ctermfg=179 guifg=#d7af5f "rgb=215,175,95
hi x180_Tan               ctermfg=180 guifg=#d7af87 "rgb=215,175,135
hi x181_MistyRose3        ctermfg=181 guifg=#d7afaf "rgb=215,175,175
hi x182_Thistle3          ctermfg=182 guifg=#d7afd7 "rgb=215,175,215
hi x183_Plum2             ctermfg=183 guifg=#d7afff "rgb=215,175,255
hi x184_Yellow3           ctermfg=184 guifg=#d7d700 "rgb=215,215,0
hi x185_Khaki3            ctermfg=185 guifg=#d7d75f "rgb=215,215,95
hi x186_LightGoldenrod2   ctermfg=186 guifg=#d7d787 "rgb=215,215,135
hi x187_LightYellow3      ctermfg=187 guifg=#d7d7af "rgb=215,215,175
hi x188_Grey84            ctermfg=188 guifg=#d7d7d7 "rgb=215,215,215
hi x189_LightSteelBlue1   ctermfg=189 guifg=#d7d7ff "rgb=215,215,255
hi x190_Yellow2           ctermfg=190 guifg=#d7ff00 "rgb=215,255,0
hi x191_DarkOliveGreen1   ctermfg=191 guifg=#d7ff5f "rgb=215,255,95
hi x192_DarkOliveGreen1   ctermfg=192 guifg=#d7ff87 "rgb=215,255,135
hi x193_DarkSeaGreen1     ctermfg=193 guifg=#d7ffaf "rgb=215,255,175
hi x194_Honeydew2         ctermfg=194 guifg=#d7ffd7 "rgb=215,255,215
hi x195_LightCyan1        ctermfg=195 guifg=#d7ffff "rgb=215,255,255
hi x196_Red1              ctermfg=196 guifg=#ff0000 "rgb=255,0,0
hi x197_DeepPink2         ctermfg=197 guifg=#ff005f "rgb=255,0,95
hi x198_DeepPink1         ctermfg=198 guifg=#ff0087 "rgb=255,0,135
hi x199_DeepPink1         ctermfg=199 guifg=#ff00af "rgb=255,0,175
hi x200_Magenta2          ctermfg=200 guifg=#ff00d7 "rgb=255,0,215
hi x201_Magenta1          ctermfg=201 guifg=#ff00ff "rgb=255,0,255
hi x202_OrangeRed1        ctermfg=202 guifg=#ff5f00 "rgb=255,95,0
hi x203_IndianRed1        ctermfg=203 guifg=#ff5f5f "rgb=255,95,95
hi x204_IndianRed1        ctermfg=204 guifg=#ff5f87 "rgb=255,95,135
hi x205_HotPink           ctermfg=205 guifg=#ff5faf "rgb=255,95,175
hi x206_HotPink           ctermfg=206 guifg=#ff5fd7 "rgb=255,95,215
hi x207_MediumOrchid1     ctermfg=207 guifg=#ff5fff "rgb=255,95,255
hi x208_DarkOrange        ctermfg=208 guifg=#ff8700 "rgb=255,135,0
hi x209_Salmon1           ctermfg=209 guifg=#ff875f "rgb=255,135,95
hi x210_LightCoral        ctermfg=210 guifg=#ff8787 "rgb=255,135,135
hi x211_PaleVioletRed1    ctermfg=211 guifg=#ff87af "rgb=255,135,175
hi x212_Orchid2           ctermfg=212 guifg=#ff87d7 "rgb=255,135,215
hi x213_Orchid1           ctermfg=213 guifg=#ff87ff "rgb=255,135,255
hi x214_Orange1           ctermfg=214 guifg=#ffaf00 "rgb=255,175,0
hi x215_SandyBrown        ctermfg=215 guifg=#ffaf5f "rgb=255,175,95
hi x216_LightSalmon1      ctermfg=216 guifg=#ffaf87 "rgb=255,175,135
hi x217_LightPink1        ctermfg=217 guifg=#ffafaf "rgb=255,175,175
hi x218_Pink1             ctermfg=218 guifg=#ffafd7 "rgb=255,175,215
hi x219_Plum1             ctermfg=219 guifg=#ffafff "rgb=255,175,255
hi x220_Gold1             ctermfg=220 guifg=#ffd700 "rgb=255,215,0
hi x221_LightGoldenrod2   ctermfg=221 guifg=#ffd75f "rgb=255,215,95
hi x222_LightGoldenrod2   ctermfg=222 guifg=#ffd787 "rgb=255,215,135
hi x223_NavajoWhite1      ctermfg=223 guifg=#ffd7af "rgb=255,215,175
hi x224_MistyRose1        ctermfg=224 guifg=#ffd7d7 "rgb=255,215,215
hi x225_Thistle1          ctermfg=225 guifg=#ffd7ff "rgb=255,215,255
hi x226_Yellow1           ctermfg=226 guifg=#ffff00 "rgb=255,255,0
hi x227_LightGoldenrod1   ctermfg=227 guifg=#ffff5f "rgb=255,255,95
hi x228_Khaki1            ctermfg=228 guifg=#ffff87 "rgb=255,255,135
hi x229_Wheat1            ctermfg=229 guifg=#ffffaf "rgb=255,255,175
hi x230_Cornsilk1         ctermfg=230 guifg=#ffffd7 "rgb=255,255,215
hi x231_Grey100           ctermfg=231 guifg=#ffffff "rgb=255,255,255
hi x232_Grey3             ctermfg=232 guifg=#080808 "rgb=8,8,8
hi x233_Grey7             ctermfg=233 guifg=#121212 "rgb=18,18,18
hi x234_Grey11            ctermfg=234 guifg=#1c1c1c "rgb=28,28,28
hi x235_Grey15            ctermfg=235 guifg=#262626 "rgb=38,38,38
hi x236_Grey19            ctermfg=236 guifg=#303030 "rgb=48,48,48
hi x237_Grey23            ctermfg=237 guifg=#3a3a3a "rgb=58,58,58
hi x238_Grey27            ctermfg=238 guifg=#444444 "rgb=68,68,68
hi x239_Grey30            ctermfg=239 guifg=#4e4e4e "rgb=78,78,78
hi x240_Grey35            ctermfg=240 guifg=#585858 "rgb=88,88,88
hi x241_Grey39            ctermfg=241 guifg=#626262 "rgb=98,98,98
hi x242_Grey42            ctermfg=242 guifg=#6c6c6c "rgb=108,108,108
hi x243_Grey46            ctermfg=243 guifg=#767676 "rgb=118,118,118
hi x244_Grey50            ctermfg=244 guifg=#808080 "rgb=128,128,128
hi x245_Grey54            ctermfg=245 guifg=#8a8a8a "rgb=138,138,138
hi x246_Grey58            ctermfg=246 guifg=#949494 "rgb=148,148,148
hi x247_Grey62            ctermfg=247 guifg=#9e9e9e "rgb=158,158,158
hi x248_Grey66            ctermfg=248 guifg=#a8a8a8 "rgb=168,168,168
hi x249_Grey70            ctermfg=249 guifg=#b2b2b2 "rgb=178,178,178
hi x250_Grey74            ctermfg=250 guifg=#bcbcbc "rgb=188,188,188
hi x251_Grey78            ctermfg=251 guifg=#c6c6c6 "rgb=198,198,198
hi x252_Grey82            ctermfg=252 guifg=#d0d0d0 "rgb=208,208,208
hi x253_Grey85            ctermfg=253 guifg=#dadada "rgb=218,218,218
hi x254_Grey89            ctermfg=254 guifg=#e4e4e4 "rgb=228,228,228
hi x255_Grey93            ctermfg=255 guifg=#eeeeee "rgb=238,238,238
" }}}
