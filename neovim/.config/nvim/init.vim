set titlestring=%t
set title
set termguicolors
set number           "Display line numbers
set expandtab        "Inserts appropriate amount of SPACES in insert mode
set tabstop=2        "Determines how many columns tabs get rendered on screen
set shiftwidth=2     "How many columns will be indented using indent operations in normal/visual mode
"set showmatch
set clipboard=unnamed "Allows copying to system clipboard"
set visualbell       "No Sounds
"set autoread         "Reload files changed outside vim
set hidden           "Buffers can exist in background without needing to save them first
set noshowmode       "Remove -- INSERT -- text in status line
set mouse=a
set ignorecase       "Ignore case while searching
set smartcase        "If search pattern contains uppercase then search is now case-sensitive
set nowrap           "Don't wrap lines
set linebreak        "Wrap lines at convenient points
" set t_Co=256
"set cursorline
syntax enable
filetype plugin indent on

"Finding files
set path+=**

"Displays matching files when you tab complete
set wildmenu
set wildignore=*.o,*.obj,*~
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*vendor/**
set wildignore+=*node_modules/**
set wildignore+=*DS_Store*
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif

"Use tab to :find by partial match. Use * to make it fuzzy"

"------- COC Config START --------
"set cmdheight=2
set shortmess+=c
set signcolumn=yes

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

"------- COC Config END --------

"Allows you to view syntax file type by pressing F10 when cursor is over word
map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

"Disables split menu preview during autocompletion for jedi-vim
"autocmd FileType python setlocal completeopt-=preview

" ------- Plugins START --------
call plug#begin('~/.config/nvim/plugged')

"Themes
Plug 'joshdick/onedark.vim'

"Functionality Plugins

"Intellisense engine
Plug 'neoclide/coc.nvim', {'branch': 'release'}

"Deoplete - Need to make sure python is installed first
" if has('nvim')
"   Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" else
"   Plug 'Shougo/deoplete.nvim'
"   Plug 'roxma/nvim-yarp'
"   Plug 'roxma/vim-hug-neovim-rpc'
" endif

" Plug 'fszymanski/deoplete-emoji'
" let g:deoplete#enable_at_startup=1

" Plug 'ervandew/supertab' "Used to enable pressing tab for autocomplete
" let g:SuperTabDefaultCompletionType = "<c-n>" "Makes tab direction from top -> bottom

Plug 'jiangmiao/auto-pairs'
"Plug 'w0rp/ale'

"Filetype & Syntax plugins
" Plug 'zchee/deoplete-jedi'  "For python. Requires pip3 jedi to work
" Plug 'leafgarland/typescript-vim'
" Plug 'HerringtonDarkholme/yats.vim' "Typescript syntax
" Plug 'mhartington/nvim-typescript' "For typescript, need to run :UpdateRemotePlugins
Plug 'pangloss/vim-javascript'
"Plug 'mxw/vim-jsx'
"Plug 'elzr/vim-json'
"Plug 'vim-python/python-syntax'
"let g:python_highlight_all=1
" Plug 'hdima/python-syntax' "For Python syntax
" let python_highlight_all=1
" Plug 'eagletmt/neco-ghc'
"Plug 'neovimhaskell/haskell-vim'
"let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
"let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
"let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
"let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
"let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
"let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
"let g:haskell_backpack = 1                " to enable highlighting of backpack keywords
"let g:haskell_indent_disable = 1          " diables plugin indentation
" Vim 

"Snippets
" Plug 'honza/vim-snippets'
" Plug 'SirVer/ultisnips'

"Fuzzy file finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

"UI Plugins
Plug 'itchyny/lightline.vim'
Plug 'scrooloose/nerdtree'
" Plug 'maximbaz/lightline-ale' "Shows linting errors in lightline
Plug 'airblade/vim-gitgutter'
Plug 'mattn/emmet-vim'
" Plug 'Yggdroot/indentLine'
Plug 'yuttie/comfortable-motion.vim'
Plug 'ap/vim-css-color'

"Tmux plugins
Plug 'christoomey/vim-tmux-navigator'
Plug 'wellle/tmux-complete.vim'

"Tpope
Plug 'tpope/vim-fugitive' "Git plugin
Plug 'tpope/vim-endwise' "Adds end to ruby keywords
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-ragtag'  "Mappings for HTML, XML, PHP, etc.
" Plug 'tpope/vim-sleuth'

call plug#end()

" ------- Plugins END --------

"Sets emmet to work with jsx
let g:user_emmet_settings = {
\  'javascript.jsx' : {
\      'extends' : 'jsx',
\  },
\}

autocmd FileType html,css,javascript.jsx EmmetInstall

"fzf config
nmap <C-p> :Files<cr>

let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit' }
let g:fzf_layout = { 'down': '~20%' }
command! -bang -nargs=* Find
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --fixed-strings --color=always '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:20%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)


map <F8> mzgg=G`z

" call deoplete#custom#set('emoji', 'filetypes', ['javascript', 'gitcommit', 'markdown', 'ruby', 'python'])
"let g:deoplete#auto_complete_delay=125
let g:netrw_liststyle=3

" ================================================
" Functions
" ================================================
function! NERDTreeToggleInCurDir()
    " If NERDTree is open in the current buffer
    if (exists("t:NERDTreeBufName") && bufwinnr(t:NERDTreeBufName) != -1)
        exe ":NERDTreeClose"
    else
        if (expand("%:t") != '')
            exe ":NERDTreeFind"
        else
            exe ":NERDTreeToggle"
        endif
    endif
endfunction

" NERDTree
nnoremap - :call NERDTreeToggleInCurDir()<CR>
let g:NERDTreeWinSize=23 "Sets nerdtree window size to _ columns
let NERDTreeShowHidden=1

let mapleader ="\<Space>"

" Switch between buffers quickly
map <Leader><Tab> <C-^>

" Save - Leader+s/w
map <Leader>s :w<cr>
map <Leader>w :w<cr>

" Quit - Leader+q
map <Leader>q :q<cr>

" Fix indents - Leader+f
map <Leader>f =G

" Mouse wheel settings for comfortable_motion plugin
noremap <silent> <ScrollWheelDown> :call comfortable_motion#flick(40)<CR>
noremap <silent> <ScrollWheelUp>   :call comfortable_motion#flick(-40)<CR>

" GitGutter
let g:gitgutter_realtime=0
" let g:gitgutter_override_sign_column_highlight=0
hi GitGutterAdd guibg=NONE ctermbg=NONE
hi GitGutterChange guibg=NONE ctermbg=NONE
hi GitGutterDelete guibg=NONE ctermbg=NONE
hi GitGutterChangeDelete guibg=NONE ctermbg=NONE


hi GitGutterAddLine guibg=NONE ctermbg=NONE
hi GitGutterChangeLine guibg=NONE ctermbg=NONE
hi GitGutterDeleteLine guibg=NONE ctermbg=NONE
hi GitGutterChangeDeleteLine guibg=NONE ctermbg=NONE

let g:onedark_terminal_italics=1

"let base16colorspace=256
set background=dark
colorscheme onedark
"highlight CursorLineNr ctermfg=yellow term=bold
let g:indentLine_char='│'
"⎇
" let g:indentLine_setConceal=0

hi Normal guibg=NONE ctermbg=NONE
hi LineNr guibg=NONE ctermbg=NONE
hi SignColumn guibg=NONE ctermbg=NONE	
hi VertSPlit guibg=NONE ctermbg=NONE
set fillchars+=vert:\ 

let g:ale_linters = {
\   'javascript': ['eslint'],
\}

"let g:ale_fixers = {}
"let g:ale_fixers['javascript'] = ['prettier']
"let g:ale_fixers['jsx'] = ['prettier']
"let g:ale_fixers['css'] = ['prettier']
"let g:ale_fixers['scss'] = ['prettier']
"let g:ale_sign_error = '·'
"let g:ale_sign_warning = '·'
"let g:ale_set_highlights = 0 
"let g:ale_lint_delay = 1000
" hi link ALEWarningSign Warning
" hi link ALEErrorSign Error
" hi clear ALEErrorSign
" hi clear ALEWarningSign

let g:lightline = {
	\		'colorscheme': 'deus',
	\		'active': {
	\			'left': [ [ 'mode', 'paste' ],
	\								[ 'gitbranch', 'readonly', 'filename']
	\			],
	\		},
	\		'inactive': {
	\			'left': [ [ 'filename' ],
	\			],
	\		},
	\		'component_function': {
  \     'fileformat': 'LightlineFileformat',
  \     'fileencoding': 'LightlineFileEncoding',
  \     'gitbranch': 'LightlineFugitive',
  \     'filename': 'LightlineFilename',
	\		},
	\}

let g:lightline.subseparator = {
  \   'left': '│', 'right': '│',
  \}

function! LightlineFilename()
  let filename = expand('%:t') !=# '' ? expand('%:t') : '[No Filename]'
  let modified = &modified ? ' +' : ''
  return filename . modified
endfunction

function! LightlineFugitive()
    if exists("*fugitive#head")
        let branch = fugitive#head()
        return branch !=# '' ? "\u2387 " .branch : ''
    endif
    return ''
endfunction

"Removes fileformat and filencoding if length of window is < 150 columns
function! LightlineFileformat()
  return winwidth(0) > 150 ? &fileformat : ''
endfunction

function! LightlineFileEncoding()
  return winwidth(0) > 150 ? &fileencoding : ''
endfunction

" let g:lightline.component_expand = {
"       \  'linter_warnings': 'lightline#ale#warnings',
"       \  'linter_errors': 'lightline#ale#errors',
"       \  'linter_ok': 'lightline#ale#ok',
"       \ }
" let g:lightline.component_type = {
"       \     'linter_warnings': 'warning',
"       \     'linter_errors': 'error',
"       \     'linter_ok': 'left',
"       \ }
" let g:lightline.active = { 'right': [[ 'linter_errors', 'linter_warnings', 'linter_ok' ]] }
