let mapleader = " "
syntax on
set tabstop=2
set shiftwidth=2
set expandtab
set ai
set hlsearch
set wildmenu
set ruler
set undofile
set undodir=~/.vim/undo
set clipboard=unnamedplus,unnamed,autoselect
highlight Comment ctermfg=green

map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

function! CompileRun()
    write

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
        let l:run_cmd = 'open -a Firefox % &'
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

    if l:compile_cmd != ''
        let l:compile_start = localtime()
        exec '!time ' . l:compile_cmd
        let l:compile_end = localtime()
        let l:compile_time = l:compile_end - l:compile_start
        echo 'Compilation time: ' . l:compile_time . ' seconds'
    endif

    let l:run_start = localtime()
    exec '!time ' . l:run_cmd
    let l:run_end = localtime()
    let l:run_time = l:run_end - l:run_start
    echo 'Execution time: ' . l:run_time . ' seconds'
endfunction

nnoremap <F5> :call CompileRun()<CR>

function! OpenUrlInSafari()
    let l:line = getline('.')
    let l:url_in_href = matchstr(l:line, 'href="\zshttps\?:\/\/[^"]\+')
    let l:url_in_a_tag = matchstr(l:line, '<a[^>]*>\zshttps\?:\/\/[^<]\+')
    let l:plain_url = matchstr(l:line, 'https\?:\/\/[a-zA-Z0-9./?=&_-]\+')

    if l:url_in_href != ''
        execute '!open -a Firefox ' . shellescape(l:url_in_href)
    elseif l:url_in_a_tag != ''
        execute '!open -a Firefox ' . shellescape(l:url_in_a_tag)
    elseif l:plain_url != ''
        execute '!open -a Firefox ' . shellescape(l:plain_url)
    else
        echo "No valid URL found"
    endif
endfunction

nnoremap <leader>o :call OpenUrlInSafari()<CR>
