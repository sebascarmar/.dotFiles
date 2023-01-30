"    __   _(_)_ __ ___  _ __ ___ 
"    \ \ / / | '_ ` _ \| '__/ __|
"  _  \ V /| | | | | | | | | (__ 
" |_|  \_/ |_|_| |_| |_|_|  \___|
"      Sebastian Carreño Marin


"*##################################################################################################*
"*##                                   GENERAL SETTINGS                                           ##*
"*##################################################################################################*
  syntax on
  syntax enable
  "setlocal spell
  set spelllang=es,en_us
  set number
  set hlsearch
  set splitright 
  set clipboard=unnamedplus "debí instalar >sudo apt install vim-gtk

"*##################################################################################################*
"*##                                      CURSOR                                                  ##*
"*##################################################################################################*
  set cursorline
  set cursorcolumn
  highlight CursorLine  term=bold cterm=bold  ctermbg=black
  highlight CursorColumn term=bold cterm=bold ctermbg=black

"*##################################################################################################*
"*##                                  INDENT & TAB                                                ##*
"*##################################################################################################*
  set tabstop=8 
  set shiftwidth=2
  set softtabstop=2
  set expandtab
  set autoindent
  set smartindent
  set smarttab
  filetype indent on

"*##################################################################################################*
"*##                                      FOLDING                                                ##*
"*##################################################################################################*
" Configuration
  set foldmethod=manual 
  set foldnestmax=10
  "set foldenable
  set foldlevel=2                                         
  set foldlevelstart=0

" Save folds on exit and load them on edit
  autocmd BufWinLeave *.py mkview
  autocmd BufWinEnter *.py silent loadview
  autocmd BufWinLeave *.h mkview
  autocmd BufWinEnter *.h silent loadview
  autocmd BufWinLeave *.c mkview
  autocmd BufWinEnter *.c silent loadview
  autocmd BufWinLeave *.cpp mkview
  autocmd BufWinEnter *.cpp silent loadview
  autocmd BufWinLeave *.tex mkview
  autocmd BufWinEnter *.tex silent loadview
  autocmd BufWinLeave .vimrc mkview
  autocmd BufWinEnter .vimrc silent loadview
  autocmd TabLeave *.py mkview
  "autocmd TabEnter *.py silent loadview
  autocmd TabLeave *.h mkview
  "autocmd TabEnter *.h silent loadview
  autocmd TabLeave *.c mkview
  "autocmd TabEnter *.c silent loadview
  autocmd TabLeave *.cpp mkview
  "autocmd TabEnter *.cpp silent loadview
  autocmd TabLeave *.tex mkview
  "autocmd TabEnter *.tex silent loadview

" Shortcuts for folding: za open/close a fold 
"                        zf create a fold 
"                        zR open all folds 
"                        zM close all folds 
"                        zE eliminate all fold in the window 
"                        zd delete one fold at the cursor
  nnoremap º za
  nnoremap <F5> <C-v>j%zf 
  nnoremap <F6> zR
  nnoremap <F7> zM
  nnoremap <F8> zE

" Folding color and text
  highlight Folded ctermfg=LightBlue ctermbg=Black guifg=LightBlue guibg=Black 
  set foldtext=getline(v:foldstart) "sirve para evitar que salgan el num. de lineas en el plegado
  set viewoptions=folds

"*##################################################################################################*
"*##                             PUNCTUATION SIGNS COMPLETE                                       ##*
"*##################################################################################################*
"  inoremap ( ()<Esc>i
"  inoremap { {}<Esc>i
"  inoremap {<CR> {<CR>}<Esc>O
"  inoremap [ []<Esc>i
"  inoremap ' ''<Esc>i
"  inoremap " ""<Esc>i
  
"*##################################################################################################*
"*##                                     TAGS                                                     ##*
"*##################################################################################################*
  iab _com /* */<Esc>2hi
  iab _comf /* ACCION:<CR>PARAMETROS:<CR>RETORNO:<CR>/<Esc>3kA
  iab _coms /****************************************************************************************************/<Esc>94hR
  iab _comsm /*--------------------------------------------------------------------------------------------------*/
  iab _comb /*##################################################################################################*/<CR>/*##################################################################################################*/<Esc>O/*##                                                                                              ##*/<Esc>75hR

"*##################################################################################################*
"*##                                          KEY MAPS                                            ##*
"*##################################################################################################*
let mapleader=" "
noremap <Leader>q :q<Enter>
nnoremap <Leader>nt :NERDTreeToggle<CR>
nmap <Leader>s <Plug>(easymotion-s2)
  
"Keymaps for tabs
  "Abre una nueva tab con el archivo que se le pase como argumento.
    nnoremap <C-t> :tabnew 
  "Acomoda las tabs en la posición deseada (empieza desde 0)
    nnoremap <Leader><C-t> :tabm
  "Navega entre las tabs abiertas
    nnoremap <Leader>1 :tabn 1<CR>
    nnoremap <Leader>2 :tabn 2<CR>
    nnoremap <Leader>3 :tabn 3<CR>
    nnoremap <Leader>4 :tabn 4<CR>
    nnoremap <Leader>5 :tabn 5<CR>
    nnoremap <Leader>6 :tabn 6<CR>
    nnoremap <Leader>7 :tabn 7<CR>
    nnoremap <Leader>8 :tabn 8<CR>
    nnoremap <Leader>9 :tabn 9<CR>
"Keymaps for buffers
  "Lista los buffers actuales (b para la nativa, B para la de fzf).
    nnoremap <Leader>º :Buffers<CR>
  "Navega entre los buffers abiertos
    nnoremap <Leader>! :b1<CR>
    nnoremap <Leader>" :b2<CR>
    nnoremap <Leader>· :b3<CR>
    nnoremap <Leader>$ :b4<CR>
    nnoremap <Leader>% :b5<CR>
    nnoremap <Leader>& :b6<CR>
    nnoremap <Leader>/ :b7<CR>
    nnoremap <Leader>( :b8<CR>
    nnoremap <Leader>) :b9<CR>

"Window resize 
  nnoremap + <C-w>+
  nnoremap - <C-w>-
  nnoremap > <C-w>>
  nnoremap < <C-w><
  
"Substitute: search and replace
  nnoremap <Leader>f :%s///gc<Left><Left><Left><Left>
  
"Toggle spell on and off
  nnoremap <Leader>l :set spell!<CR>

"C/C++ compiler 
  autocmd FileType c nnoremap <Leader>g :!clear && gcc -Wall % -o
  autocmd FileType c nnoremap <Leader>G :!clear && gcc -Wall % && ./a.out
  autocmd FileType c nnoremap <Leader>x :!clear && ./
  autocmd FileType cpp nnoremap <Leader>g :!clear && g++ -Wall % -o
  autocmd FileType cpp nnoremap <Leader>G :!clear && g++ -Wall % && ./a.out
  autocmd FileType cpp nnoremap <Leader>x :!clear && ./

"Comments for C/C++
  nnoremap <Leader>m I//<Esc>
  vnoremap <Leader>m I//<Esc>
 
"  "Inicio/Fin
"    inoremap <C-e> <C-o>0
"    inoremap <C-r> <C-o>$
"Reload archivo sin cambios
  noremap <F4> :e!<CR>:source %<CR>
  noremap <F3> :e!<CR>
"Desactivar temporalmente el resalto
  nnoremap <F2> :nohls<CR>
"Ignore ZZ
  nnoremap Z <Nop>
  nnoremap ZZ <Nop>
  nnoremap Q <Nop>
"  "Unable arrow keys
"    map <Up> <nop>
"    map <Down> <nop>
"    map <Left> <nop>
"    map <Right> <nop>

"*##################################################################################################*
"*##                                           PLUGINS                                            ##*
"*##################################################################################################*
" Plug-in installation: after put the repository name, you need to reload the .vimrc file and then,
"execute :PlugInstall  
call plug#begin('~/.vim/plugged')

  " Search files/paths
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'scrooloose/nerdtree'
  Plug 'christoomey/vim-tmux-navigator'

  " When editing
  Plug 'ervandew/supertab'
  Plug 'easymotion/vim-easymotion'
  Plug 'tpope/vim-surround'
  Plug 'lervag/vimtex'
  Plug 'SirVer/ultisnips'   , {'for': ['tex', 'c', 'c++']} 
  Plug 'honza/vim-snippets' , {'for': ['tex', 'c', 'c++']}
  "Plug  'ycm-core/YouCompleteMe' 
  Plug 'Yggdroot/indentLine'

  " Syntax
  Plug 'dense-analysis/ale', {'for': ['tex', 'c', 'cpp']} 

  " Themes
  Plug 'shinchu/lightline-gruvbox.vim'
  Plug 'chriskempson/base16-vim'
  Plug 'NLKNguyen/papercolor-theme'
  Plug 'bluz71/vim-moonfly-colors'
  Plug 'dracula/vim', { 'as': 'dracula' }

  " Status line themes
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'

  " Git integration
  Plug 'airblade/vim-gitgutter'
  Plug 'tpope/vim-fugitive'

call plug#end()

"*##################################################################################################*
"*##                                            LATEX                                             ##*
"*##################################################################################################*
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_view_general_options = '-reuse-instance -forward-search @tex @line @pdf'
let g:vimtex_quickfix_mode=1
let g:vimtex_syntax_conceal_disable=1

"let g:vimtex_view_use_temp_files = 1 "abre el visor luego de una compilación
"exitosa. Deshabilita la apertura y actualización automática.

"let g:vimtex_view_forward_search_on_start "Default=1"

"let g:vimtex_view_reverse_search_edit_cmd = tabedit "default=edit

" Key maps
  autocmd FileType tex nnoremap <Leader>g :!latexmk -pdf %<CR>
  autocmd FileType tex nnoremap <Leader>G :VimtexCompile <CR> 
"Forward search
  autocmd FileType tex nnoremap <Leader>v :VimtexView <CR> 
  noremap <Leader><C-i>:!pdflatex %<CR><CR>
  noremap <Leader><C-s>:' mupdf-x11 $(echo % \| sed 's/tex$/pdf/') & disown<CR><CR>

"*##################################################################################################*/
"*##                                        ALE                                                   ##*/
"*##################################################################################################*/
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '->'
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_lsp_suggestions = 1

let g:ale_list_window_size = 2
"let g:ale_open_list = 1
"let g:ale_keep_list_window_open = 1

" Set this. Airline will handle the rest.
let g:airline#extensions#ale#enabled = 1
let g:ale_fixers = {'tex': ['alex', 'proselint', 'redpen', 'texlab', 'vale', 'cspell', 'write-good', 'textlint']}
"let g:ale_linters = {'tex': ['cspell', 'write-good', 'textlint',]}
"let g:ale_linters = {'tex': ['chktex', 'lacheck']}

" Permite avanzar o retroceder al warning más próximo
  nnoremap ]w :ALENextWrap<CR>
  nnoremap [w :ALEPreviousWrap<CR>

"*##################################################################################################*/
"*##                                      ULTISNIP                                                ##*/
"*##################################################################################################*/
"En resumen: <C-j> y <C-k> para bajar y subir en la lista 
let g:SuperTabDefaultCompletionType    = '<C-n>'
let g:SuperTabCrMapping                = 0
let g:UltiSnipsExpandTrigger           = '<tab>'
let g:UltiSnipsJumpForwardTrigger      = '<tab>'
let g:UltiSnipsJumpBackwardTrigger     = '<s-tab>'
let g:ycm_key_list_select_completion   = ['<C-j>', '<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<C-p>', '<Up>']
let g:UltiSnipsListSnippets="<c-l>"

let g:UltiSnipsEditSplit="vertical"

"*##################################################################################################*/
"*##                                      THEMES                                                  ##*/
"*##################################################################################################*/
set background=dark
set t_Co=256

"colors atom-dark-256 " Este va bien con molokai (va para latex)


"GRUVBOX REVERSIONADO (va bien con simple, badwolf y term.)
"let g:gruvbox_guisp_fallback = "bg"
"let g:lightline = {}
"let g:lightline.colorscheme = 'gruvbox'
"colorscheme gruvbox


"BASE16 (va bien con 'molokai', 'deus', 'powerlineish')
"colorscheme base16-default-dark
"set termguicolors


colorscheme PaperColor


""Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
""If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
""(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
"if (empty($TMUX))
"  if (has("nvim"))
"    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
"    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
"  endif
"  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
"  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
"  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
"  if (has("termguicolors"))
"    set termguicolors
"  endif
"endif
"colorscheme moonfly


"colorscheme dracula

"*##################################################################################################*/
"*##                                      VIM-AIRLINE                                             ##*/
"*##################################################################################################*/
" Settings
  let g:airline#extensions#tabline#enabled = 1
  let g:airline_powerline_fonts = 1
  let g:airline#extensions#tabline#formatter = 'unique_tail'
  let g:airline#extensions#fugitiveline#enabled = 1
  let g:airline#extensions#whitespace#enabled = 0

" Themes for the status line 
  "let g:airline_theme = 'ayu_mirage'
  "let g:airline_theme = 'ayu_dark'
  "let g:airline_theme = 'base16_3024'
  "let g:airline_theme = 'base16_ashes'
  "let g:airline_theme = 'base16_bright'
  "let g:airline_theme = 'base16_monokai'
  "let g:airline_theme = 'fairyfloss' "es igual a jellybeans
  "let g:airline_theme = 'google_dark'
  "let g:airline_theme = 'hybrid'
  let g:airline_theme = 'jellybeans'
  "let g:airline_theme = 'night_owl'
  "let g:airline_theme = 'moonfly'

"*##################################################################################################*/
"*##                                    INDENTLINE                                                ##*/
"*##################################################################################################*/
let g:indentLine_char_list = ['┊','┊' ]  "'¦', '┆', '']

"#####################################################################################################
"###                               FUZZY FINDER - VIM                                             ####
"#####################################################################################################
let g:fzf_layout = { 'down': '30%' }

" Enable per-command history
" - History files will be stored in the specified directory
" - When set, CTRL-N and CTRL-P will be bound to 'next-history' and
"   'previous-history' instead of 'down' and 'up'.
let g:fzf_history_dir = '~/.local/share/fzf-history'


" Key maps
  nnoremap <C-p> :Files<Cr>
  nnoremap <c-f> :BLines<Cr>
  nnoremap <Leader>h :History/<Cr>
" Insert mode completion
  imap <c-x><c-k> <plug>(fzf-complete-word)
  imap <c-x><c-d> <plug>(fzf-complete-path)
" Es lo mismo que :BLines pero en modo insertar
  imap <c-x><c-f> <plug>(fzf-complete-line) 
  imap <c-x><c-p> <plug>(fzf-complete-file)

" Ripgrep se ejcuta con :Rg

"#####################################################################################################
"###                                    GITGUTTER                                                 ####
"#####################################################################################################
set updatetime=100
let g:gitgutter_enabled = 1
let g:gitgutter_map_keys = 0
let g:gitgutter_sign_allow_clobber = 1
