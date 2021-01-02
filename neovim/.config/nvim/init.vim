set titlestring=%t
set title
set termguicolors
set number           "Display line numbers
set expandtab        "Inserts appropriate amount of SPACES in insert mode, no \t characters
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

"Allows you to view syntax file type by pressing F10 when cursor is over word
map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" ------- Plugins START --------
call plug#begin('~/.config/nvim/plugged')

"Themes
Plug 'joshdick/onedark.vim'

"Autocomplete + Language
Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'pangloss/vim-javascript'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries'  }

Plug 'jiangmiao/auto-pairs'
"Plug 'w0rp/ale'

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

"Fuzzy file finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install()  }  }
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
"Plug 'wellle/tmux-complete.vim'

"Tpope
Plug 'tpope/vim-fugitive' "Git plugin
"Plug 'tpope/vim-endwise' "Adds end to ruby keywords
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-ragtag'  "Mappings for HTML, XML, PHP, etc.
" Plug 'tpope/vim-sleuth'

call plug#end()

" ------- Plugins END --------

"------- Go Config --------
autocmd FileType go setlocal noexpandtab tabstop=2 shiftwidth=2

" Auto-format code and add missing imports
"autocmd BufWritePre *.go :call CocAction('runCommand', 'editor.action.organizeImport')


" ------- Vim-go config --------
let g:go_def_mapping_enabled = 0
let g:go_code_completion_enabled = 0
let g:go_doc_keywordprg_enabled = 0

let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_extra_types = 1

"------- COC Config START --------
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=1

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=no
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
"inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
"                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

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
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

"------- COC Config END --------

"Sets emmet to work with jsx
let g:user_emmet_settings = {
\  'javascript.jsx' : {
\      'extends' : 'jsx',
\  },
\}

autocmd FileType html,css,javascript.jsx EmmetInstall

"fzf config
"Fallback to :Files if not in a git directory
command! Search execute (len(system('git rev-parse'))) ? ':Files' : ':GFiles'
nmap <C-p> :Search<cr>

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

" ----- Theming -----
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

hi CocErrorSign ctermfg=9 guifg=#e06c75

"let g:ale_linters = {
"\   'javascript': ['eslint'],
"\}

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

" ----- Lightline Config -----
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
"
