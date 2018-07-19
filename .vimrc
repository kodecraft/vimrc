" Leader
let mapleader = " "

filetype plugin indent on 

" for showing block cursor in normal mode and edit is pipe 

let &t_ti.="\e[1 q" 
let &t_SI.="\e[5 q" 
let &t_EI.="\e[1 q" 
let &t_te.="\e[0 q" 

set expandtab           " enter spaces when tab is pressed 
" set textwidth=120       " break lines when line length increases 
set tabstop=4           " use 4 spaces to represent tab 
set softtabstop=4 
set shiftwidth=4        " number of spaces to use for auto indent 
set autoindent          " copy indent from current line when starting a new line 

" make backspaces more powerful 
set backspace=indent,eol,start 

set ruler               " show line and column number 
syntax on               " syntax highlighting 
set showcmd             " show (partial) command in status line 
imap jk <Esc> 
imap kj <Esc> 

set incsearch 
set number 
set hlsearch 
set mouse=a  "for mouse clicks to be intercepted by terminal programs like vim 
set wrap!  "do not wrap texts or can use set nowrap 

set rtp+=~/.fzf 

let g:ctrlp_show_hidden = 1 
let g:ctrlp_match_window = 'results:100' 
let NERDTreeShowHidden=1 

" Start interactive EasyAlign in visual mode (e.g. vipga) 

xmap ga <Plug>(EasyAlign) 

" Start interactive EasyAlign for a motion/text object (e.g. gaip) 

nmap ga <Plug>(EasyAlign) 

set statusline+=%#warningmsg# 
set statusline+=%{SyntasticStatuslineFlag()} 
set statusline+=%* 

let g:syntastic_always_populate_loc_list = 1 
let g:syntastic_auto_loc_list = 1 
let g:syntastic_check_on_open = 1 
let g:syntastic_check_on_wq = 0 


set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo
set wildignore=*.swp,*.bak,*.pyc,*.class
set title                " change the terminal's title
set visualbell           " don't beep
set noerrorbells         " don't beep

set nobackup
set noswapfile
set t_vb=

" vim to highlight whitespaces
set pastetoggle=<F2>

nnoremap ; :
nmap <silent> ,/ :nohlsearch<CR> " clear highlighted search
cmap w!! w !sudo tee % >/dev/null

" vim you complete me
" Tab completion
" will insert tab at beginning of line,
" will use completion if not at beginning
set wildmode=list:longest,list:full
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<Tab>"
    else
        return "\<C-p>"
    endif
endfunction
inoremap <Tab> <C-r>=InsertTabWrapper()<CR>
inoremap <S-Tab> <C-n>
