let mapleader = " "
call plug#begin('~/.vim/plugged')

Plug 'maxbrunsfeld/vim-yankstack'
Plug 'jiangmiao/auto-pairs'
Plug 'itchyny/lightline.vim'
Plug 'morhetz/gruvbox'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'amix/open_file_under_cursor.vim'

call plug#end()

" Key mappings for fzf
nnoremap <C-f> :Files<CR>

" Key mappings for vim-fugitive
nnoremap <leader>ga :Git add .<CR>
nnoremap <leader>gt :Git commit "
nnoremap <leader>gp :Git push<CR>
nnoremap <leader>gl :Git log<CR>
nnoremap <leader>gd :Git diff<CR>

" Key mapping for open_file_under_cursor
nnoremap <leader>of :OpenFileUnderCursor<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""
syntax on
set number
filetype on
filetype plugin on
filetype indent on
set laststatus=2
set hlsearch
set wildmenu
set clipboard=unnamedplus,unnamed,autoselect
set history=5000
set undofile
set undodir=~/.vim/undo
set background=dark
colorscheme gruvbox

"""""""""""""""""""""""""""""""""""""""""""""""""
" Compiling with F5
function! CompileRun()
    write

    " Define commands based on file type
    if &filetype == 'c'
        let l:compile_cmd = 'gcc % -o %<'
        let l:run_cmd = './%<'
    elseif &filetype == 'cpp'
        let l:compile_cmd = 'g++ % -o %<'
        let l:run_cmd = './%<'
    elseif &filetype == 'java'
        let l:compile_cmd = 'javac %'
        let l:run_cmd = 'java %<'
    elseif &filetype == 'sh'
        let l:compile_cmd = ''
        let l:run_cmd = 'bash %'
    elseif &filetype == 'python'
        let l:compile_cmd = ''
        let l:run_cmd = 'python3 %'
    elseif &filetype == 'html'
        let l:compile_cmd = ''
        let l:run_cmd = 'open -a Safari % &'
    elseif &filetype == 'go'
        let l:compile_cmd = 'go build %<'
        let l:run_cmd = 'go run %'
    elseif &filetype == 'matlab'
        let l:compile_cmd = ''
        let l:run_cmd = 'octave %'
    else
        echo "Unsupported filetype"
        return
    endif

    " Compile the code if necessary
    if l:compile_cmd != ''
        " Measure compile time
        let l:compile_start = localtime()
        exec '!time ' . l:compile_cmd
        let l:compile_end = localtime()
        let l:compile_time = l:compile_end - l:compile_start
        echo 'Compilation time: ' . l:compile_time . ' seconds'
    endif

    " Run the code and measure execution time
    let l:run_start = localtime()
    exec '!time ' . l:run_cmd
    let l:run_end = localtime()
    let l:run_time = l:run_end - l:run_start
    echo 'Execution time: ' . l:run_time . ' seconds'
endfunction

nnoremap <F5> :call CompileRun()<CR>
