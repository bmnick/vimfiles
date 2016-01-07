" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

let g:airline#extensions#tagbar#enabled = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:rails_statusline=0

call plug#begin('~/.vim/plugged')

""""""""""""""""""""""
" Navigation Plugins "
""""""""""""""""""""""
Plug 'kien/ctrlp.vim'
Plug 'FelikZ/ctrlp-py-matcher'
Plug 'nacitar/a.vim'
Plug 'majutsushi/tagbar'
Plug 'mileszs/ack.vim'
Plug 'scrooloose/nerdtree'

Plug 'bling/vim-airline'

""""""""""""""""""""
" Language Support "
""""""""""""""""""""
Plug 'leshill/vim-json'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'tpope/vim-haml'
Plug 'tpope/vim-markdown'
Plug 'vim-scripts/VimClojure'
" Better support for more english-focused languages
Plug 'edsono/vim-matchit'
Plug 'tpope/vim-endwise'
" Show colors in that color where possible
Plug 'skammer/vim-css-color'

"""""""""""""""""""
" Editing Helpers "
"""""""""""""""""""
Plug 'Raimondi/delimitMate'
Plug 'ervandew/supertab'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-surround'
Plug 'vim-scripts/Align'
Plug 'vim-scripts/The-NERD-Commenter'

""""""""""""""""""""
" Building Helpers "
""""""""""""""""""""
Plug 'marijnh/tern_for_vim', { 'do': 'npm install' }
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
Plug 'facebook/vim-flow', { 'for': 'javascript' }
Plug 'reinh/vim-makegreen'

"""""""""""""""""""
" VCS Integration "
"""""""""""""""""""
Plug 'tpope/vim-fugitive'

"""""""""""""
" Libraries "
"""""""""""""
Plug 'slack/vim-l9'
Plug 'duff/vim-scratch'

""""""""""""""""
" Color Themes "
""""""""""""""""
Plug 'jpo/vim-railscasts-theme'
Plug 'bmnick/vim-ir_black'
Plug 'rking/vim-detailed'
Plug 'vim-scripts/molokai'
Plug 'vim-scripts/wombat256.vim'

call plug#end()

" Import big grep if it's available
if filereadable("source /home/engshare/admin/scripts/vim/biggrep.vim")
  source /home/engshare/admin/scripts/vim/biggrep.vim
endif

syntax on
filetype plugin indent on

colorscheme wombat256mod

" Make sure we're saving for most actions
set autowrite

" Nifty vim command options
set nrformats="alpha,hex"   " Change letters and hex with ^a and ^x
set tildeop                 " turn tildeop on for tilde as an operator

" Global line numbering options
set number          " Enable line numbering
set hidden

" Smarter case handling in searches
set ignorecase
set smartcase

" Facebook tabbing style
set shiftwidth=2
set tabstop=2
set expandtab

" Activate the statusline globally
set laststatus=2
set statusline=   " clear the statusline for when vimrc is reloaded
set statusline+=%-3.3n::\                      " buffer number
set statusline+=%f\ ::\                          " file name
set statusline+=%h%m%r%w                     " flags
set statusline+=[%{strlen(&ft)?&ft:'none'},  " filetype
set statusline+=%{strlen(&fenc)?&fenc:&enc}, " encoding
set statusline+=%{&fileformat}]              " file format
set statusline+=%=                           " right align
set statusline+=%{fugitive#statusline()}\    " fugitive status
set statusline+=%{synIDattr(synID(line('.'),col('.'),1),'name')}\  " highlight
set statusline+=::\ %b,0x%-8B\ ::\                   " current char
set statusline+=%-14.(%l,%c%V%)\ ::\ %<%P        " offset

" Set search preferences
set incsearch
set hlsearch

" Show some non-printing characters
set listchars=eol:¶,tab:>-,trail:∙,extends:>,precedes:<

" Set up background highlighting
set colorcolumn=80

" Add project-specific vimrcs
set exrc
set secure

set pastetoggle=<leader>v

" Make sure we get JSX highlighting in mixed mode files
let g:jsx_ext_required = 0

" Quicker matching in ctrlp
let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }

" Airline config!
let g:airline_detect_modified=1

" YouCompleteMe
let g:ycm_extra_conf_vim_data = ['&filetype']
let g:ycm_server_log_level = 'debug'
let g:ycm_confirm_extra_conf = 0
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_enable_diagnostic_signs = 0
let g:ycm_error_symbol = 'x'
let g:ycm_warning_symbol = '!'
let g:ycm_server_keep_logfiles = 1
let g:ycm_server_log_level = 'debug'

if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

endif

if has("gui_macvim")
  set guifont=Monaco:h14
  set guioptions-=T
end

" Toggle between relative numbering and absolute numbering
function! NumberToggle()
  if(&relativenumber == 1)
    set norelativenumber
  else
    set relativenumber
  endif
endfunction

function! BufSel(pattern)
  let bufcount = bufnr("$")
  let currbufnr = 1
  let nummatches = 0
  let firstmatchingbufnr = 0
  while currbufnr <= bufcount
  if(bufexists(currbufnr))
    let currbufname = bufname(currbufnr)
    if(match(currbufname, a:pattern) > -1)
      echo currbufnr . ": ". bufname(currbufnr)
      let nummatches += 1
      let firstmatchingbufnr = currbufnr
    endif
  endif
  let currbufnr = currbufnr + 1
  endwhile
  if(nummatches == 1)
  execute ":buffer ". firstmatchingbufnr
  elseif(nummatches > 1)
  let desiredbufnr = input("Enter buffer number: ")
  if(strlen(desiredbufnr) != 0)
    execute ":buffer ". desiredbufnr
  endif
  else
  echo "No matching buffers"
  endif
endfunction

function SetupTerm()
  resize 15
  set winfixheight
endfunction

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  autocmd WinEnter * setlocal cursorline
  autocmd WinLeave * setlocal nocursorline
  autocmd WinLeave * setlocal nohls
  autocmd FocusGained * setlocal cursorline
  autocmd FocusLost * setlocal nocursorline
  autocmd FocusLost * setlocal nohls

  autocmd Filetype c,cpp,h,m,js,php,hphp autocmd BufWritePre <buffer> :%s/\s\+$//e

  " Enter insert mode on entering a terminal window
  autocmd BufWinEnter,WinEnter term://* startinsert
  autocmd TermOpen * call SetupTerm()

endif " has("autocmd")

"Bind the BufSel() function to a user-command
command! -nargs=1 Bs :call BufSel("<args>")

" Start following spacemacs basic style
let mapleader = "\<Space>"

nnoremap <leader>r :call NumberToggle()<CR>

" Do some stuff to make tabs a little nicer
noremap <silent> <c-Tab> :tabn<CR>
noremap <silent> <c-s-Tab> :tabp<CR>
inoremap <silent> <c-Tab> <Esc>:tabn<CR>
inoremap <silent> <c-s-Tab> <Esc>:tabp<CR>

noremap <silent> <C-h> :nohls<CR>

" Make window navigation somewhat quicker
if exists(':tnoremap')
  tnoremap <C-h> <C-\><C-n><C-w>h
  tnoremap <C-j> <C-\><C-n><C-w>j
  tnoremap <C-k> <C-\><C-n><C-w>k
  tnoremap <C-l> <C-\><C-n><C-w>l
end
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Bounce between buffers more easily
nnoremap <silent> <Leader>b :bp<CR>
nnoremap <silent> <Leader>f :bn<CR>

" CtrlP integration
noremap <silent> <c-o> :CtrlPBuffer<CR>
noremap <silent> <c-i> :CtrlP .<CR>

nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" Getting out of insert
inoremap <silent> jj <Esc>
inoremap <silent> kk <Esc>

noremap <silent> <leader>l :set invlist<CR>

" NERDCommenter usefulness
noremap <silent> <D-/> \ci

nmap <leader>o :TagbarToggle<CR>

" Shorter subsittute
nnoremap <leader>s :%s//g<left><Left>
nnoremap <leader>c :Gstatus<CR>

noremap <Leader>p :NERDTreeToggle<CR>

" Append a semicolon to the current line
nnoremap <c-;> mQA;<Esc>`Q

" Align on equal signs
vnoremap <leader>a :Align => = :<CR>

" double tap leader for swap to last file
nnoremap <leader><leader> <c-^>

nnoremap <leader>pg :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <leader>pd :YcmCompleter GoToDefinition<CR>
nnoremap <leader>pc :YcmCompleter GoToDeclaration<CR>
