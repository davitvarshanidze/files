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
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

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

"""""""""""""""""""""""""""""""""""""""""""""""""
" Function to open URL in Safari, whether inside <a> tag or as plain text
function! OpenUrlInSafari()
    " Get the current line
    let l:line = getline('.')

    " First, try to match a URL inside an <a> tag's href attribute
    let l:url_in_href = matchstr(l:line, 'href="\zshttps\?:\/\/[^"]\+')

    " Next, try to match a URL inside an <a> tag (even without href)
    let l:url_in_a_tag = matchstr(l:line, '<a[^>]*>\zshttps\?:\/\/[^<]\+')

    " Finally, check for a plain URL without any tag
    let l:plain_url = matchstr(l:line, 'https\?:\/\/[a-zA-Z0-9./?=&_-]\+')

    " Determine which URL to open
    if l:url_in_href != ''
        execute '!open -a Safari ' . shellescape(l:url_in_href)
    elseif l:url_in_a_tag != ''
        execute '!open -a Safari ' . shellescape(l:url_in_a_tag)
    elseif l:plain_url != ''
        execute '!open -a Safari ' . shellescape(l:plain_url)
    else
        echo "No valid URL found"
    endif
endfunction

nnoremap <leader>o :call OpenUrlInSafari()<CR>
