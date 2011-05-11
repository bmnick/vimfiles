" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible
syntax on
filetype plugin indent on

" Pathogen for bundled plugins
call pathogen#runtime_append_all_bundles() 
call pathogen#helptags()

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
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v]\ [%p%%]\ [LEN=%L] 

set hlsearch

if has("gui_macvim")
	set guifont=Menlo:h14
	set guioptions-=T
end

" Do some stuff to make tabs a little nicer
noremap <silent> <c-Tab> :tabn<CR>
noremap <silent> <c-s-Tab> :tabp<CR>
inoremap <silent> <c-Tab> <Esc>:tabn<CR>
inoremap <silent> <c-s-Tab> <Esc>:tabp<CR>

" Only do this part when compiled with support for autocommands.
if has("autocmd")

	autocmd WinEnter * setlocal cursorline
	autocmd WinLeave * setlocal nocursorline
	autocmd WinLeave * setlocal nohls
	autocmd FocusGained * setlocal cursorline
	autocmd FocusLost * setlocal nocursorline
	autocmd FocusLost * setlocal nohls

	autocmd BufNewFile,BufRead *.rb compiler rakespec

endif " has("autocmd")

colorscheme ir_black

" Rails extras
command -bar -nargs=1 OpenURL :!open <args>

noremap <Leader>p :NERDTreeToggle<CR>
