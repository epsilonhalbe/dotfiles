syntax manual
filetype off

" PLUGIN IMPORTS {{{
    let s:editor_root=expand("~/.nvim")

    " plugin bundler
    if &compatible
      set nocompatible
    endif

    call plug#begin('~/.nvim/plugged')

    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    Plug 'Shougo/neosnippet.vim'
    Plug 'Shougo/neosnippet-snippets'
    Plug 'Shougo/echodoc.vim'

    Plug 'scrooloose/nerdtree'
    Plug 'ivalkeen/nerdtree-execute'
    Plug 'Xuyuanp/nerdtree-git-plugin'

    Plug 'airblade/vim-gitgutter'
    Plug 'ap/vim-css-color'
    Plug 'blueyed/vim-diminactive'

    Plug 'direnv/direnv.vim'

    Plug 'chrisbra/unicode.vim'     " provides some unicode utilities
    Plug 'junegunn/vim-easy-align'  " aligns stuff
    Plug 'Lokaltog/vim-easymotion'  " makes moving to letters easy-peasy
    Plug 'mileszs/ack.vim'          " provides interfacing with ack patch this for haskell

    Plug 'jremmen/vim-ripgrep'
    Plug 'Raimondi/delimitMate'     " automatically closes parens and stuff
    Plug 'scrooloose/nerdcommenter' " makes commenting stuff in/out no hustle
    Plug 'tpope/vim-fugitive'
    Plug 'jreybert/vimagit'

    Plug 'kshenoy/vim-signature'
    Plug 'triglav/vim-visual-increment'
    Plug 'sjl/gundo.vim'            " git like undoing
    Plug 'vim-scripts/renamer.vim'  " super easy renaming of files/directories
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'christoomey/vim-tmux-navigator'

    Plug 'junegunn/fzf', { 'dir': '~/utils/fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'

    Plug 'autozimu/LanguageClient-neovim', {'branch': 'next', 'do': 'bash install.sh'}
    Plug 'mhinz/vim-sayonara'
    Plug 'neomake/neomake'
    Plug 'qpkorr/vim-bufkill'
    Plug 'jlanzarotta/bufexplorer'
    Plug 'ryanoasis/vim-devicons'
    Plug 'tmux-plugins/vim-tmux'
    Plug 'tmux-plugins/vim-tmux-focus-events'
    Plug 'tpope/vim-abolish'
    Plug 'tpope/vim-repeat'
    Plug 'tpope/vim-speeddating'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-unimpaired'
    Plug 'vim-scripts/SyntaxRange'
    Plug 'xolox/vim-misc'
    Plug 'xolox/vim-notes'
    Plug 'Yggdroot/indentLine'


    " LANGUAGES {{{
        " LANG: ELM {{{
            Plug 'lambdatoast/elm.vim', {'for' : 'elm'}
        " }}}
        " LANG: GRAPHVIZ {{{
        Plug 'wannesm/wmgraphviz.vim', { 'for' : 'dot'}
        " }}}
        " LANG: HASKELL {{{
            "Plug 'aucsd-progsys/liquid-types.vim', { 'for':'haskell'}
            "Plug 'eagletmt/ghcmod-vim',            { 'for':'haskell'}
            "Plug 'lukerandall/haskellmode-vim',    { 'for':'haskell'}
            Plug 'Twinside/vim-haskellFold',      { 'for':'haskell'}
            Plug 'glittershark/vim-hare',         { 'for':'haskell'}
            " Plug 'bitc/vim-hdevtools',            { 'for':'haskell'}
            Plug 'eagletmt/neco-ghc',             { 'for':'haskell'}
            Plug 'hspec/hspec.vim',               { 'for':'haskell'}
            Plug 'mpickering/hlint-refactor-vim', { 'for':'haskell'}
            Plug 'neovimhaskell/haskell-vim',     { 'for':'haskell'}
            Plug 'Twinside/vim-hoogle',           { 'for':'haskell'}
        " }}}
        " LANG: HTML {{{
            Plug 'othree/html5.vim', {'for' : 'html'}
        " }}}
        " LANG: MARKDOWN {{{
             Plug 'plasticboy/vim-markdown'
        " }}}
        " LANG: NGINX {{{
            Plug 'chr4/nginx.vim', {'for' : 'nginx'}
        " }}}
        " LANG: NIX {{{
            Plug 'LnL7/vim-nix', {'for' : 'nix'}
        " }}}
        " LANG: PLANTUML {{{
            Plug 'aklt/plantuml-syntax'
        " }}}
        " LANG: POSTGRES {{{
            Plug 'lifepillar/pgsql.vim', {'for' : 'pgsql'}
        " }}}
        " LANG: PURESCRIPT {{{
            Plug 'raichoo/purescript-vim', {'for' : 'purs'}
            " Plug 'FrigoEU/psc-ide-vim', {'for' : 'purs'}
        " }}}
        " LANG: RUST {{{
            Plug 'rust-lang/rust.vim'
        " }}}
    " }}}

    " THEMES {{{
        Plug 'tomasr/molokai'
        Plug 'altercation/vim-colors-solarized'
    " }}}

call plug#end()
" }}}

" PLUGIN SETTINGS {{{

    " Ack {{{
        " use last search word as expression
        nnoremap <silent> <leader>* :AckFromSearch<cr>
    " }}}

    " Airline {{{
    let g:airline#extensions#tabline#enabled = 1
    let g:airline#extensions#tabline#fnamemod = ':t'
    let g:airline#extensions#tabline#show_tab_nr = 1
    let g:airline#extensions#branch#format = 2
    let g:airline_powerline_fonts = 1
    let g:airline_theme = 'seagull'
    let g:airline#extensions#branch#enabled = 0
    " }}}

    " Ctrl-P {{{
    "Plug 'ctrlpvim/ctrlp.vim'           " fuzzy file finding
    "let g:ctrlp_map = '<C-p>'
    "let g:ctrlp_working_path_mode = 0
    "let g:ctrlp_match_window_reversed = 1
    "let g:ctrlp_split_window = 0
    "let g:ctrlp_max_height = 20
    "let g:ctrlp_prompt_mappings = {
    "\ 'PrtSelectMove("j")':   ['<c-j>', '<down>', '<s-tab>'],
    "\ 'PrtSelectMove("k")':   ['<c-k>', '<up>', '<tab>'],
    "\ 'PrtHistory(-1)':       ['<c-n>'],
    "\ 'PrtHistory(1)':        ['<c-p>'],
    "\ 'ToggleFocus()':        ['<c-tab>'],
    "\ }
    "let g:ctrlp_extensions = ['tag']

    "nnoremap <leader>. :CtrlPTag<cr>

    " }}}

    " Deoplete {{{
    let g:deoplete#enable_at_startup = 1
    call deoplete#custom#source('LanguageClient', 'min_pattern_length', 2)
    " }}}

    " diminactive {{{
      let g:diminactive_buftype_blacklist = ['nofile', 'nowrite', 'acwrite', 'quickfix', 'help']
      let g:diminactive_enable_focus = 1
      let g:diminactive_use_syntax = 0
    " }}}

    " devicons {{{
    let g:webdevicons_enable_nerdtree = 1
    " }}}

    " Easy-Align {{{
    xmap <Enter> <Plug>(EasyAlign)
    let g:easy_align_ignore_groups = ['String']
    " }}}

    " Easymotion {{{
    nmap f ;;f
    nmap F ;;F
    vmap f ;;f
    vmap F ;;F
    omap φ ;;f
    " }}}

    " Easytags {{{
    let g:easytags_async = 1
    let g:easytags_languages            = {}
    let g:easytags_languages.haskell    = {'cmd': 'hasktags', 'args': ["-R -S '[\".hs\"]'"]}
    let g:easytags_languages.purescript = {'cmd': 'hasktags', 'args': ["-R -S '[\".purs\"]'"]}
    " }}}

    " FZF {{{
        nnoremap <C-P> :FZF<CR>
        nnoremap <C-B> :Buffers<CR>
        "nnoremap <C-]> :Tags <c-r>=expand("<cword>")<cr><cr>
        nnoremap <C-]> g<C-]>
        let $FZF_DEFAULT_OPTS .= ' --inline-info'
    " }}}

    " Gundo {{{
    nnoremap <F5> :GundoToggle<CR>
    let g:gundo_debug = 1
    let g:gundo_preview_bottom = 1
    " }}}

    " Indent Lines {{{
      let g:indentLine_char = '▏'
      " let g:indentLine_color_tty_light = 7 " (default: 4)
      " let g:indentLine_color_dark = 1 " (default: 2)
      " let g:indentLine_bgcolor_term = 202
      " let g:indentLine_bgcolor_gui = '#1E0010'
      " let g:indentLine_color_gui = '#FF0000'
    " }}}

    " Language Client {{{
    let g:LanguageClient_serverCommands = {}
    let g:LanguageClient_serverCommands.rust = ['rustup', 'run', 'nightly', 'rls']
    let g:LanguageClient_serverCommands.haskell = ['hie', '--lsp']


     nnoremap <F1> :call LanguageClient_contextMenu()<CR>
     map <Leader>lk :call LanguageClient#textDocument_hover()<CR>
     map <Leader>lg :call LanguageClient#textDocument_definition()<CR>
     map <Leader>lr :call LanguageClient#textDocument_rename()<CR>
     map <Leader>lf :call LanguageClient#textDocument_formatting()<CR>
     map <Leader>lrf :call LanguageClient#textDocument_formatting()<CR>
     map <Leader>lb :call LanguageClient#textDocument_references()<CR>
     map <Leader>la :call LanguageClient#textDocument_codeAction()<CR>
     map <Leader>ls :call LanguageClient#textDocument_documentSymbol()<CR>
     " let g:LanguageClient_rootMarkers = ['stack.yaml']
    " }}}

    " Neomake {{{
        autocmd! BufWritePost *.hs Neomake
        autocmd! VimLeave * let g:neomake_verbose = 0
        let g:neomake_haskell_ghc_mod_args = '-g-Wall'
        let g:neomake_open_list = 2
        autocmd! BufWritePost *.purs Neomake
    " }}}

    " Neosnippets {{{
        let g:neosnippet#snippets_directory='~/.nvim/NeoSnippets'
        " Map expression when a tab is hit:
        "           checks if the completion popup is visible
        "           if yes
        "               then it cycles to next item
        "           else
        "               if expandable_or_jumpable
        "                   then expands_or_jumps
        "                   else returns a normal TAB
        imap <expr><TAB>   pumvisible() ? "\<C-n>" : (neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>")
        imap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"
        imap <expr><silent><CR> pumvisible() ? deoplete#mappings#close_popup() . "\<Plug>(neosnippet_jump_or_expand)" : "\<CR>"
        smap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
        " Expands or completes the selected snippet/item in the popup menu
        smap <silent><CR> <Plug>(neosnippet_jump_or_expand)
    " }}}

    " NERDCommenter {{{
        let NERDSpaceDelims=1
        let NERDTrimTRailingWhitespace=1
        let NERDComDefaultDelims=1
        let NERDCompactSexyComs=1
        nnoremap <Leader>cc <Plug>NerdCommenterSexy
        nnoremap <Leader>cs <Plug>NerdCommenterComment
    " }}}

    " NERDTree {{{
    noremap  <F2> :NERDTreeToggle<cr>
    inoremap <F2> <esc>:NERDTreeToggle<cr>
    noremap  <F3> :NERDTreeFind<cr>
    inoremap <F3> <esc>:NERDTreeFind<cr>

    autocmd StdinReadPre * let s:std_in=1
    autocmd Filetype nerdtree setlocal nolist

    let g:NERDTreeWinSize=50
    let g:NERDTreeAutoDeleteBuffer=1
    let NERDTreeHighlightCursorline=1
    let NERDTreeIgnore =['\~$','\.pyc$', 'pip-log\.txt$', 'whoosh_index$']
    let NERDTreeIgnore+=['xapian_index$','\.*\.pid$', 'monitor.py$', '.*-fixtures-.*\.json$']
    let NERDTreeIgnore+=['\.o$', 'db.db$','\.hi$']
    let NERDTreeIgnore+=['\.aux$' , '\.bbl$' , '\.blg$'  , '\.dvi$'   , '\.nls$' ]
    let NERDTreeIgnore+=['\.glg$' , '\.glo$' , '\.gls$'  , '\.idx$'   , '\.fls$' ]
    let NERDTreeIgnore+=['\.ilg$' , '\.ind$' , '\.ist$'  , '\.log$'   , '\.nlo$' ]
    let NERDTreeIgnore+=['\.out$' , '\.toc$' , '\.dpth$' , '\._aux$'  , '\._log$']
    let NERDTreeIgnore+=['\.tdo$' , '\.synctex\.gz$' ,'\.fdb_latexmk$' ,'\.auxlock$']
    let NERDTreeIgnore+=['\.class$']
    let NERDTreeMinimalUI = 1
    let NERDTreeDirArrows = 1

    function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
    exec 'autocmd FileType nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
    exec 'autocmd FileType nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
    endfunction

    call NERDTreeHighlightFile('jade','green','none','green','#141e23')
    call NERDTreeHighlightFile('ini','yellow','none','yellow','#141e23')
    call NERDTreeHighlightFile('md','blue','none','#3366FF','#141e23')
    call NERDTreeHighlightFile('yml','yellow','none','yellow','#141e23')
    call NERDTreeHighlightFile('config','yellow','none','yellow','#141e23')
    call NERDTreeHighlightFile('conf','yellow','none','yellow','#141e23')
    call NERDTreeHighlightFile('json','yellow','none','yellow','#141e23')
    call NERDTreeHighlightFile('html','yellow','none','yellow','#141e23')
    call NERDTreeHighlightFile('styl','cyan','none','cyan','#141e23')
    call NERDTreeHighlightFile('css','cyan','none','cyan','#141e23')
    call NERDTreeHighlightFile('coffee','Red','none','red','#141e23')
    call NERDTreeHighlightFile('js','Red','none','#ffa500','#141e23')
    call NERDTreeHighlightFile('ts','Blue','none','#6699cc','#141e23')
    call NERDTreeHighlightFile('php','Magenta','none','#ff00ff','#141e23')
    call NERDTreeHighlightFile('ds_store','Gray','none','#686868','#141e23')
    call NERDTreeHighlightFile('gitconfig','Gray','none','#686868','#141e23')
    call NERDTreeHighlightFile('gitignore','Gray','none','#686868','#141e23')
    call NERDTreeHighlightFile('bashrc','Gray','none','#686868','#141e23')
    call NERDTreeHighlightFile('bashprofile','Gray','none','#686868','#141e23')
    " }}}

    " Notes {{{
        let g:notes_directories = ['~/Documents/Notes']
    " }}}

    " Sayonara {{{
    cnoreabbrev <expr> x getcmdtype() == ":" && getcmdline() == 'x' ? 'Sayonara' : 'x'
    " }}}

    " SuperTab {{{
    "let g:SuperTabDefaultCompletionType = '<C-n>'
    " }}}

    " SyntaxRange {{{
        "au Syntax markdown call SyntaxRange#Include('\`\`\`cypher', '\`\`\`', 'cypher', 'NonText')
        autocmd Syntax markdown call SyntaxRange#Include('\(\`\`\`\|\~\~\~\).*haskell.*'   , '\(\`\`\`\|\~\~\~\)', 'haskell'   , 'NonText')
        autocmd Syntax markdown call SyntaxRange#Include('\(\`\`\`\|\~\~\~\).*haskell.*'   , '\(\`\`\`\|\~\~\~\)', 'haskell'   , 'NonText')
        autocmd Syntax markdown call SyntaxRange#Include('\(\`\`\`\|\~\~\~\).*spec.*'      , '\(\`\`\`\|\~\~\~\)', 'liquid'    , 'NonText')
        autocmd Syntax markdown call SyntaxRange#Include('\\begin{code}'   , '\\end{code}', 'haskell'   , 'NonText')
        autocmd Syntax markdown call SyntaxRange#Include('\(\`\`\`\|\~\~\~\).*zsh.*'       , '\(\`\`\`\|\~\~\~\)', 'zsh'       , 'NonText')
        autocmd Syntax markdown call SyntaxRange#Include('\(\`\`\`\|\~\~\~\).*javascript.*', '\(\`\`\`\|\~\~\~\)', 'javascript', 'NonText')
        autocmd Syntax markdown call SyntaxRange#Include('\(\`\`\`\|\~\~\~\).*purescript.*', '\(\`\`\`\|\~\~\~\)', 'purescript', 'NonText')
        autocmd Syntax haskell  call SyntaxRange#Include('\[PG.isql|', '|]', 'postgresql', 'NonText')
    " }}}

    " tmux {{{
    let g:tmux_navigator_no_mappings = 1
    "nnoremap <silent> <C-h> <C-w>h
    "nnoremap <silent> <C-j> <C-w>j
    "nnoremap <silent> <C-k> <C-w>k
    "nnoremap <silent> <C-l> <C-w>l
    nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
    nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
    nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
    nnoremap <silent> <C-l> :TmuxNavigateRight<cr>
    nnoremap gb :bn<cr>
    nnoremap gB :bp<cr>
    " }}}

    " UltiSnips {{{
    " better key bindings for UltiSnipsExpandTrigger
        let g:UltiSnipsExpandTrigger = "<tab>"
        let g:UltiSnipsJumpForwardTrigger = "<tab>"
        let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
        let g:UltiSnipsListSnippets="<F11>"
        let g:UltiSnipsEditSplit="vertical"
        let g:UltiSnipsSnippetDirectories=[$HOME.'/.nvim/UltiSnips']
        let g:UltiSnipsSnippetsDir=$HOME.'/.nvim/UltiSnips'
    " }}}
" }}}

" LANGUAGE PLUGIN SETTINGS {{{
    " LANG: JSON {{{
        com! FormatJSON :%!python -c "import json, sys, collections; print json.dumps(json.load(sys.stdin, object_pairs_hook=collections.OrderedDict), indent=4)"
    " }}}
    " LANG: RUST {{{
    augroup rust
        autocmd FileType rust let g:autofmt_autosave = 1
    augroup end
    " }}}
    " LANG: HASKELL {{{
    augroup haskell
      autocmd BufRead,BufNewFile *.hs,*.lhs setlocal filetype=haskell
      autocmd BufRead,BufNewFile *.lhs      setlocal syntax=markdown
      setlocal completefunc=LanguageClient#complete
      setlocal formatexpr=LanguageClient#textDocument_rangeFormatting_sync()
    " hlint refactor {{{
        let g:hlintRefactor#disableDefaultKeybindings = 1
        map <silent> <localleader>r :call ApplyOneSuggestion()<CR>
        map <silent> <localleader>R :call ApplyAllSuggestions()<CR>
    " }}}
    " Hdevtools {{{
    "   function! FindCabalSandboxRoot()
    "       return finddir('.cabal-sandbox', './;')
    "   endfunction
    "
    "   function! FindCabalSandboxRootPackageConf()
    "       return glob(FindCabalSandboxRoot().'/*-packages.conf.d')
    "   endfunction
    "   let g:hdevtools_options = '-g-itst -g-ilib -g-isrc -g-i. -g-idist/build/autogen -g-Wall -g-package-conf='.FindCabalSandboxRootPackageConf()
    "   autocmd BufEnter *.hs let b:ghc_staticoptions = '-itst -ilib -isrc -no-user-package-db -package-db '.FindCabalSandboxRootPackageConf()
    "   autocmd BufEnter *.hs let b:ghcmod_ghc_options= ['-itst','-ilib','-isrc','-no-user-package-db', '-package-db '.FindCabalSandboxRootPackageConf() ]
    " }}}
    " GhcMod {{{
    "   autocmd FileType haskell map <silent> <leader><cr> :noh<cr>:GhcModTypeClear<cr>
    "   autocmd FileType haskell nmap <silent> <localleader>t :GhcModType<CR>
    "   autocmd FileType haskell nmap <silent> <localleader>c :GhcModTypeClear<CR>
    "   " Insert type of expression under cursor
    "   autocmd FileType haskell nmap <silent> <localleader>T :GhcModTypeInsert<CR>
    " }}}
    " Neco-GHC {{{
       autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc
       let g:necoghc_enable_detailed_browse = 1
    " }}}
    " Haskellmode {{{
    "   " Open the definition in a new vsplit
    "   "nnoremap <LocalLeader>? :sp<CR>:exec("tag ".expand("<cword>"))<cr>
    "
    "   if (!empty(glob("/usr/bin/chromium")))
    "       let g:haddock_browser = "/usr/bin/chromium"
    "   endif
    "   if (!empty(glob("/usr/bin/chrome")))
    "       let g:haddock_browser = "/usr/bin/chrome"
    "   endif
    "   if (!empty(glob("/usr/bin/chromium-browser")))
    "       let g:haddock_browser = "/usr/bin/chromium-browser"
    "   endif
    "
    "   let g:ghc_symbolcache=1
    "   let g:haddock_browser_callformat = "%s %s"
    "   let g:haddock_indexfiledir= "~/.vim/"
    "
    " }}}
    " Haskell-vim {{{
        let g:haskell_enable_arrowsyntax      = 1 " to enable highlighting of `proc`
        let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
        let g:haskell_enable_quantification   = 1 " to enable highlighting of `forall`
        let g:haskell_enable_recursivedo      = 1 " to enable highlighting of `mdo` and `rec`
        let g:haskell_enable_static_pointers  = 1 " to enable highlighting of `static`
        let g:haskell_enable_typeroles        = 1 " to enable highlighting of type roles
        let g:haskell_backpack                = 1 " to enable highlighting of backpack keywords
        let hs_highlight_types                = 1
        let hs_highlight_delimiters           = 1
        let NERD_haskell_alt_style            = 1
    " }}}
    " Hoogle {{{
        autocmd FileType haskell nmap <localleader>? yiw:Hoogle <C-R>"<cr>
    " }}}
    augroup end
    " }}}
    " LANG: PURESCRIPT {{{
    augroup purescript
        let g:psc_ide_syntastic_mode=0
        nm <buffer> <silent> <leader>L :Plist<CR>
        nm <buffer> <silent> <leader>l :Pload!<CR>
        nm <buffer> <silent> <leader>r :Prebuild!<CR>
        nm <buffer> <silent> <leader>f :PaddClause<CR>
        nm <buffer> <silent> <leader>t :PaddType<CR>
        nm <buffer> <silent> <leader>a :Papply<CR>
        nm <buffer> <silent> <leader>A :Papply!<CR>
        nm <buffer> <silent> <leader>C :Pcase!<CR>
        nm <buffer> <silent> <leader>i :Pimport<CR>
        nm <buffer> <silent> <leader>qa :PaddImportQualifications<CR>
        nm <buffer> <silent> <leader>g :Pgoto<CR>
        nm <buffer> <silent> <leader>p :Pursuit<CR>
        nm <buffer> <silent> <leader>T :Ptype<CR>
    augroup end
    " }}}
    " LANG: MARKDOWN {{{
    augroup markdown
        autocmd FileType markdown setlocal conceallevel=2
    augroup end
    " }}}
" }}}

" THEME PLUGIN SETTINGS {{{
    " THEME: molokai {{{
    syntax on
    colorscheme molokai
    highlight Folded ctermbg=234 ctermfg=67
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
    " }}}
" }}}

" GENERAL VIM SETTINGS {{{
    " Preamble {{{
    filetype on
    filetype indent on
    filetype plugin on

    let g:python_host_prog  = '/usr/bin/python2'
    let g:python3_host_prog = '/usr/bin/python3'

    "set breakindent
    "set dictionary=/usr/share/dict/words
    "set listchars+=eol:¬
    "set notimeout
    "set nottimeout
    "set shortmess=atI                                   " shorten command-line text and other info tokens (see :help shortmess)
    "set splitbelow
    "set splitright
    "set ttimeout
    set autoread
    set autowrite
    set backspace=indent,eol,start
    set cf                                               " enable error files and error jumping
    set clipboard+=unnamed,unnamedplus
    set cmdheight=1
    set completeopt=longest,menuone,preview
    set confirm
    set cpoptions+=J
    set cursorline
    set encoding=utf-8
    set errorbells
    set ffs=unix,dos,mac
    set fillchars=diff:⣿
    set hidden
    set history=2000
    set hlsearch
    set ignorecase
    set iskeyword=@,48-57,_,192-255,$,@,%,#,-,ä,ü,ö,ß,é,è,ê,â,á,à,û                 " none of these should be word dividers, so make them not be
    set laststatus=2
    set lazyredraw
    set linebreak
    set list
    set listchars =tab:▸\ ,extends:❯
    set listchars+=nbsp:␣
    set listchars+=precedes:❮
    set listchars+=trail:␣
    set matchtime=3
    set modelines=0
    set nojoinspaces
    set number
    set relativenumber
    set ruler
    set scrolloff=5                                      " vertical scrolloff
    " set scrolloff=999                                    " vertical scrolloff if set to 999 cursor is always in the middle of the screen
    set shell=/bin/zsh
    set shiftround
    set showbreak=\ \ \ ↪
    set showcmd
    set showmatch
    set showmode " to see which indentation modes are set type in command mode verbose set ai? cin? cink? cino? si? inde? indk?
    set sidescroll=1
    set sidescrolloff=5                                  " horzontal scrolloff
    set smartcase
    set statusline+=%#warningmsg#
    set statusline+=%*
    set statusline+=%f\ %2*%m\ %1*%h
    set statusline+=%{SyntasticStatuslineFlag()}
    set statusline=
    set tabpagemax=30
    set termencoding=utf-8
    set title
    set title                                            " show title in xterm
    set ttyfast
    set undofile
    set undoreload=2000
    set virtualedit+=block
    set visualbell
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1

    autocmd FileType qf setlocal wrap
    autocmd FocusLost * :wa
    autocmd BufReadPost *
                \ if line("'\"") > 0 && line ("'\"") <= line("$") |
                \   exe "normal! g'\"" |
                \ endif
                " center buffer around cursor when opening files
    autocmd BufRead * normal zz
    " }}}
    " Adjust PATH {{{
    if (index(split($PATH,':'),'/home/epsilonhalbe}/bin') < 0)
        let $PATH = '/home/epsilonhalbe/bin' . ':' . $PATH
    endif
    if (index(split($PATH,':'),'/home/epsilonhalbe/bin/ghc') < 0)
        let $PATH = '/home/epsilonhalbe/bin/ghc' . ':' . $PATH
    endif
    if (index(split($PATH,':'),'/home/epsilonhalbe/bin/elm') < 0)
        let $PATH = '/home/epsilonhalbe/bin/elm' . ':' . $PATH
    endif
    if (index(split($PATH,':'),'/home/epsilonhalbe/bin/util') < 0)
        let $PATH = '/home/epsilonhalbe/bin/util' . ':' . $PATH
    endif
    " }}}
    " Backups {{{

    set undodir=~/.nvim/tmp/undo//     " undo files
    " create undodir directory if possible and does not exist yet
    let targetdir=$HOME . "/.nvim/tmp/undo"
    if isdirectory(targetdir) != 1 && getftype(targetdir) == "" && exists("*mkdir")
     call mkdir(targetdir, "p", 0700)
    endif

    set backupdir=~/.nvim/tmp/backup// " backups
    " create undodir directory if possible and does not exist yet
    let targetdir=$HOME . "/.nvim/tmp/backup"
    if isdirectory(targetdir) != 1 && getftype(targetdir) == "" && exists("*mkdir")
     call mkdir(targetdir, "p", 0700)
    endif
    set directory=~/.nvim/tmp/swap//   " swap files
    " create undodir directory if possible and does not exist yet
    let targetdir=$HOME . "/.nvim/tmp/swap"
    if isdirectory(targetdir) != 1 && getftype(targetdir) == "" && exists("*mkdir")
     call mkdir(targetdir, "p", 0700)
    endif

    set backupskip=/tmp/*,/private/tmp/*"
    set backup                   " enable backups
    set swapfile                 " It's 2012, Vim.
    set makeef=error.err         " When using make, where should it dump the file
    " }}}
    " Colors {{{
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
    " Leader {{{
    let mapleader = ";"
    let maplocalleader ="\\"
    inoremap :w  <esc>:w<cr>
    tnoremap <Esc> <C-\><C-n>
    " }}}
    " Tabs, spaces, wrapping {{{
    set autoindent    " always set autoindenting on
    set smartindent   " use smart indent if there is no indent file
    set tabstop=4     " <tab> inserts 4 spaces
    set softtabstop=2 " <BS> over an autoindent deletes 4 spaces.
    set shiftwidth=2  " an indent level is 2 spaces wide.
    set smarttab      " Handle tabs more intelligently
    set expandtab     " Use spaces, not tabs, for autoindent/tab key.
    set shiftround    " rounds indent to a multiple of shiftwidth
    set whichwrap+=<,>,h,l,[,]
    set nowrap
    set textwidth=80
    "set formatoptions=qrn1
    set formatoptions=tcrqnjv
    set colorcolumn=+1
    " }}}
    " Utility Mappings {{{
    " insert newline and stay normal (inserting is not that hard)
    nnoremap o o<esc>
    nnoremap O O<esc>

    "sane searching
    nnoremap / /\v
    vnoremap / /\v

    " default to block selection rather than normal visual mode
    nnoremap v <C-v>
    nnoremap <C-v> v
    vnoremap * y/\V<C-r>=escape(@",'/\')<CR><CR>
    nnoremap gp `[v`]

    noremap <leader><space> :noh<cr>
    noremap <leader><S-space> :call clearmatches()<cr>

    " Made D behave
    nnoremap Y y$
    nnoremap D d$

    " Keep search matches in the middle of the window and pulse the line when moving
    " to them.
    nnoremap n nzzzv
    nnoremap N Nzzzv

    set foldenable
    set foldmethod=marker
    set foldlevelstart=1
    set foldlevel=5

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
    nnoremap <Space> za
    " It's 2012. quasi linewise movement in wraps
    noremap j gj
    noremap k gk

    " Clean trailing whitespace
    nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<cr>


    " Formatting, TextMate-style
    set formatprg=par\ -w80r

    " Split line (sister to [J]oin lines)
    " The normal use of S is covered by cc, so don't worry about shadowing it.
    nnoremap S i<cr><esc><right>
    nnoremap <silent> J :let p=getpos('.')<bar>join<bar>call setpos('.', p)<cr>

    " Source sources current line/selection
    vnoremap <leader>S y:execute @@<cr>
    nnoremap <leader>S ^vg_y:execute @@<cr>

    " Select (charwise) the contents of the current line, excluding indentation.
    " Great for pasting Python lines into REPLs.
    nnoremap vv ^vg_

    cnoremap w!! w !sudo tee % >/dev/null

    nnoremap <leader>tv :tabe $MYVIMRC<cr>


    " }}}
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
    "set wildignore+=lib

    " node modules
    set wildignore+=*/node_modules/**
    " }}}
" }}}
