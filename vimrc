" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

let g:airline#extensions#tagbar#enabled = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:rails_statusline=0

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

" Toggle between relative numbering and absolute numbering
function! NumberToggle()
	if(&relativenumber == 1)
		set number
	else
		set relativenumber
	endif
endfunction
nnoremap <leader>r :call NumberToggle()<CR>

let g:syntastic_mode_map = { 'mode': 'active',
													 \ 'active_filetypes': ['ruby', 'perl'],
													 \ 'passive_filetypes': ['puppet'] }

" Make sure we're saving for most actions
set autowrite

" Too much ruby has me loving:
set tabstop=2
set shiftwidth=2

" Smarter case handling in searches
set ignorecase
set smartcase

" Airline config!
let g:airline_detect_modified=1

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

set incsearch
set hlsearch
noremap <silent> <C-h> :nohls<CR>

if has("gui_macvim")
	set guifont=Monaco:h14
	set guioptions-=T
end

set pastetoggle=<leader>v

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

" Bounce between buffers more easily
nnoremap <silent> <Leader>b :bp<CR>
nnoremap <silent> <Leader>f :bn<CR>
set hidden

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

"Bind the BufSel() function to a user-command
command! -nargs=1 Bs :call BufSel("<args>")

" CtrlP integration
noremap <silent> <c-o> :CtrlPBuffer<CR>

if executable('ag') 
	" Use ag over grep
	set grepprg=ag\ --nogroup\ --nocolor

	" Use ag in CtrlP for listing files
	let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

endif

nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" Getting out of insert
inoremap <silent> jj <Esc>
inoremap <silent> kk <Esc>

" Show some non-printing characters
set listchars=eol:¶,tab:>-,trail:∙,extends:>,precedes:<
noremap <silent> <leader>l :set invlist<CR>

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
	"
" autoset compilers/makeprgs for test and spec files
	autocmd FileType cucumber compiler cucumber | setl makeprg=cucumber\ \"%:p\"
	autocmd FileType ruby
		\if expand('%') =~# '_test\.rb$' |
		\	compiler rubyunit | setl makeprg=testrb\ \"%:p\" |
		\elseif expand('%') =~# '_spec\.rb$' |
		\	compiler rspec | setl makeprg=rspec\ \"%:p\" |
		\else |
		\	compiler ruby | setl makeprg=ruby\ -wc\ \"%:p\" |
		\endif
	autocmd User Bundler if &makeprg !~ 'bundle' | setl makeprg^=bundle\ exec\  | endif

	autocmd Filetype c,cpp,h,m,js,php,hphp autocmd BufWritePre <buffer> :%s/\s\+$//e

endif " has("autocmd")

" colorscheme github

" let molokai_original=1
" colorscheme molokai

" colorscheme detailed

colorscheme wombat256mod

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

" Add project-specific vimrcs
set exrc
set secure

" Since I use fish and vim doesn't play so well with that, tell it to use bash
set shell=/bin/bash

