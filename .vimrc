" Leader
let mapleader = " "
let maplocalleader =","

filetype plugin indent on 

" for showing block cursor in normal mode and edit is pipe 

let &t_ti.="\e[1 q" 
let &t_SI.="\e[5 q" 
let &t_EI.="\e[1 q" 
let &t_te.="\e[0 q" 

set expandtab           " enter spaces when tab is pressed 
set tw=0
set tabstop=4           " use 4 spaces to represent tab 
set softtabstop=4 
set shiftwidth=4        " number of spaces to use for auto indent 
set autoindent          " copy indent from current line when starting a new line 
set formatoptions-=tc   " turn off line splitting in Vim

" make backspaces more powerful 
set backspace=indent,eol,start 

set ruler               " show line and column number 
syntax on               " syntax highlighting 
set showcmd             " show (partial) command in status line 
imap jj <Esc>
imap jk <Esc>
imap kj <Esc>

set incsearch 
set number 
set hlsearch 
set mouse=a  "for mouse clicks to be intercepted by terminal programs like vim 
set wrap!  "do not wrap texts or can use set nowrap 
set rtp+=~/.fzf 

"smarter case insensitive search - should have done this earlier!!
set ignorecase
set smartcase

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
let g:airline_powerline_fonts = 1
let g:airline_theme='dark'
set t_Co=256

" set default mode of ctrlp to showing MRU files rather than to search for files
let g:ctrlp_map='<c-p>'
let g:ctrlp_cmd='CtrlPMRU'

" use ctags - make sure to install exuberant-ctags
let g:ctrlp_extensions = ['buffertag'] 
nmap <Leader>/ :CtrlPBufTag<CR>
nnoremap <leader>. :CtrlPTag<cr>

" using ack to fuzzy search text in current buffer
nnoremap <Leader>af :Ack  %<Left><Left>

" using fzflines to search text in current buffer
set hidden
function! s:line_handler(l)
  let keys = split(a:l, ':\t')
  exec 'buf' keys[0]
  exec keys[1]
  normal! ^zz
endfunction

function! s:buffer_lines()
  let res = []
  for b in filter(range(1, bufnr('$')), 'buflisted(v:val)')
    call extend(res, map(getbufline(b,0,"$"), 'b . ":\t" . (v:key + 1) . ":\t" . v:val '))
  endfor
  return res
endfunction

command! FZFLines call fzf#run({
\   'source':  <sid>buffer_lines(),
\   'sink':    function('<sid>line_handler'),
\   'options': '--extended --nth=3..',
\   'down':    '60%'
\})
nnoremap <Leader>fzf :FZFLines<CR>

" phpactor configs
"
let g:phpactorPhpBin = 'php'
let g:phpactorBranch = 'master'
let g:phpactorOmniAutoClassImport = v:true

" innclude use statement
nmap <Leader>u :call phpactor#UseAdd()<CR>

" Invoke the context menu
nmap <Leader>mm :call phpactor#ContextMenu()<CR>

" Invoke the navigation menu
nmap <Leader>nn :call phpactor#Navigate()<CR>

" Goto definition of class or class member under the cursor
nmap <Leader>o :call phpactor#GotoDefinition()<CR>

" Show brief information about the symbol under the cursor
nmap <Leader>K :call phpactor#Hover()<CR>

" Transform the classes in the current file
nmap <Leader>tt :call phpactor#Transform()<CR>

" Generate a new class (replacing the current file)
nmap <Leader>cc :call phpactor#ClassNew()<CR>

" Extract expression (normal mode)
nmap <silent><Leader>ee :call phpactor#ExtractExpression(v:false)<CR>

" Extract expression from selection
vmap <silent><Leader>ee :<C-U>call phpactor#ExtractExpression(v:true)<CR>

" Extract method from selection
vmap <silent><Leader>em :<C-U>call phpactor#ExtractMethod()<CR>:set nopaste

" autopair remappings
let g:AutoPairsShortcutFastWrap = '<Leader>e'

" python-mode bindings
"
let g:pymode_rope = 1
let g:pymode_python = 'python3'
let g:pymode_options_colorcolumn = 0
let g:pymode_run_bind = '<leader>r'
let g:pymode_breakpoint_bind = '<leader>b'
let g:pymode_rope_show_doc_bind = '<leader>pd'
let g:pymode_rope_goto_definition_bind = '<leader>pg'
let g:pymode_rope_goto_definition_cmd = 'new'
let g:pymode_rope_rename_bind = '<leader>pr'
let g:pymode_rope_module_to_package_bind = '<leader>p1p'
let g:pymode_rope_extract_method_bind = '<leader>pm'
let g:pymode_rope_extract_variable_bind = '<leader>pl'
let g:pymode_rope_use_function_bind = '<leader>pu'
let g:pymode_rope_move_bind = '<leader>pv'
let g:pymode_rope_change_signature_bind = '<leader>ps'
