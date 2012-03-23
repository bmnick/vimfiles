" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" Pathogen for bundled plugins
call pathogen#runtime_append_all_bundles() 
call pathogen#helptags()

syntax on
filetype plugin indent on

" Nifty vim command options
set nrformats="alpha,hex"   " Change letters and hex with ^a and ^x
set tildeop									" turn tildeop on for tilde as an operator

" Global line numbering options
set number					" Enable line numbering
set numberwidth=6 	" Make line numbering wide like TextMate

" Make sure we're saving for most actions
set autowrite

" Too much ruby has me loving:
set tabstop=2
set shiftwidth=2

" Activate the statusline globally
set laststatus=2
" set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v]\ [%p%%]\ [LEN=%L] 
set statusline=   " clear the statusline for when vimrc is reloaded
set statusline+=%-3.3n\                      " buffer number
set statusline+=%f\                          " file name
set statusline+=%h%m%r%w                     " flags
set statusline+=[%{strlen(&ft)?&ft:'none'},  " filetype
set statusline+=%{strlen(&fenc)?&fenc:&enc}, " encoding
set statusline+=%{&fileformat}]              " file format
set statusline+=%=                           " right align
set statusline+=%{synIDattr(synID(line('.'),col('.'),1),'name')}\  " highlight
set statusline+=%b,0x%-8B\                   " current char
set statusline+=%-14.(%l,%c%V%)\ %<%P        " offset

set hlsearch

if has("gui_macvim")
	set guifont=Monaco:h14
	set guioptions-=T
end

" Do some stuff to make tabs a little nicer
noremap <silent> <c-Tab> :tabn<CR>
noremap <silent> <c-s-Tab> :tabp<CR>
inoremap <silent> <c-Tab> <Esc>:tabn<CR>
inoremap <silent> <c-s-Tab> <Esc>:tabp<CR>

" Make window navigation somewhat quicker
noremap <silent> <c-j> <c-w>j
noremap <silent> <c-k> <c-w>k
noremap <silent> <c-h> <c-w>h
noremap <silent> <c-l> <c-w>l

" Fuzzy Finder integration
noremap <silent> <c-o> :FufCoverageFile<CR>

" NERDCommenter usefulness
noremap <silent> <D-/> \ci

" Only do this part when compiled with support for autocommands.
if has("autocmd")

	autocmd WinEnter * setlocal cursorline
	autocmd WinLeave * setlocal nocursorline
	autocmd WinLeave * setlocal nohls
	autocmd FocusGained * setlocal cursorline
	autocmd FocusLost * setlocal nocursorline
	autocmd FocusLost * setlocal nohls

	autocmd BufNewFile,BufRead *.rb compiler rakespec
	autocmd BufNewFile,BufRead *.handlebars set filetype=mustache

	autocmd BufNewFile, BufRead *.py set ts=4 sw=4 expandtab

endif " has("autocmd")

" colorscheme pyte

" let molokai_original=1
" colorscheme molokai

" set bg=dark
" colorscheme solarized

" colorscheme wombat256mod

" colorscheme vividchalk

colorscheme railscasts

" Rails extras
command -bar -nargs=1 OpenURL :!open <args>

" Shorter subsittute
nnoremap <leader>s :%s//g<left><Left>

noremap <Leader>p :NERDTreeToggle<CR>

" show routes in a window to top left
function! ShowRoutes()
  " Requires 'scratch' plugin
  :topleft 100 :split __Routes__
  " Make sure Vim doesn't write __Routes__ as a file
  :set buftype=nofile
  " Delete everything
  :normal 1GdG
  " Put routes output in buffer
  :0r! rake -s routes
  " Size window to number of lines (1 plus rake output length)
  :exec ":normal " . line("$") . _ "
  " Move cursor to bottom
  :normal 1GG
  " Delete empty trailing line
  :normal dd
endfunction
map <leader>gR :call ShowRoutes()<cr>

" autoset compilers/makeprgs for test and spec files
autocmd FileType cucumber compiler cucumber | setl makeprg=cucumber\ \"%:p\"
autocmd FileType ruby
      \ if expand('%') =~# '_test\.rb$' |
      \   compiler rubyunit | setl makeprg=testrb\ \"%:p\" |
      \ elseif expand('%') =~# '_spec\.rb$' |
      \   compiler rspec | setl makeprg=rspec\ \"%:p\" |
      \ else |
      \   compiler ruby | setl makeprg=ruby\ -wc\ \"%:p\" |
      \ endif
autocmd User Bundler
      \ if &makeprg !~ 'bundle' | setl makeprg^=bundle\ exec\  | endif

" double tap leader for swap to last file
nnoremap <leader><leader> <c-^>
