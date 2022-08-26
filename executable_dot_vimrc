scriptencoding utf-8

" Load vim-plug
if empty(glob("~/.vim/autoload/plug.vim"))
    execute '!curl -fLo ~/.vim/autoload/plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim'
endif

" Load plug plugins
call plug#begin('~/.vim/plugged')

" statusbar
Plug 'itchyny/lightline.vim'

" open in GitHub (with :OpenGithub / :CopyGithub)
Plug 'k0kubun/vim-open-github'

" scratch (:Scratch or gs)
Plug 'mtth/scratch.vim'

" Asynchronous syntax checking
" Plug 'w0rp/ale'

" Editorconfig support
Plug 'editorconfig/editorconfig-vim'

" Salt file syntax support
Plug 'saltstack/salt-vim'

" JS
Plug 'pangloss/vim-javascript'

" TS
Plug 'leafgarland/typescript-vim'

" JSX
Plug 'maxmellon/vim-jsx-pretty'

" TSX
Plug 'peitalin/vim-jsx-typescript'

" Comment a line with gcc (and other stuff)
Plug 'tpope/vim-commentary'

" Allow . to repeat for certain plugins
Plug 'tpope/vim-repeat'

" Git commands (:Gblame, :Gbrowse)
Plug 'tpope/vim-fugitive'

" Homebrew fzf
Plug '/opt/homebrew/opt/fzf'

" Enable fzf support
Plug 'junegunn/fzf.vim'

" Git status in gutter
Plug 'airblade/vim-gitgutter'

" Get the git branch
Plug 'itchyny/vim-gitbranch'

" Test runner
Plug 'janko/vim-test'

" Fish
Plug 'dag/vim-fish'

" CSV
Plug 'chrisbra/csv.vim'

" kotlin
Plug 'udalov/kotlin-vim'

" dispatch
Plug 'tpope/vim-dispatch'

" rust
Plug 'rust-lang/rust.vim'

" protobufs
Plug 'uarun/vim-protobuf'

" prisma
Plug 'pantharshit00/vim-prisma'

" toml
Plug 'cespare/vim-toml'

call plug#end()

colorscheme molokai

" Set 24-bit colors
if (has('termguicolors'))
  set termguicolors
endif

" Turn on syntax highlighting
syntax on

set backspace=indent,eol,start  " more powerful backspacing

if !empty(glob('~/.vim/plugged/lightline.vim'))
  " Lightline config
  set laststatus=2
  let g:lightline = {
      \ 'colorscheme': 'one',
      \ 'active': {
      \   'left': [
      \     ['mode', 'paste'],
      \     ['filename', 'gitbranch', 'readonly', 'gutentags'],
      \   ],
      \   'right': [['filetype'], ['lineinfo', 'percent']],
      \ },
      \ 'inactive': {
      \   'left': [['filename']],
      \   'right': [[], ['lineinfo', 'percent']]
      \ },
      \ 'component_function': {
      \   'percent': 'LightLinePercentInfo',
      \   'lineinfo': 'LightLineLineInfo',
      \   'gitbranch': 'LightLineGitBranch',
      \   'filename': 'LightLineFilename',
      \ }
      \ }

  " The following two functions are here because lightline
  " by default has static widths for the percentage and lineinfo
  " components. This makes them dynamic
  function! LightLinePercentInfo()
    return line('.') * 100 / line('$') . '%'
  endfunction

  function! LightLineLineInfo()
    return 'L' . line('.') . ' C' . col('.')
  endfunction

  " Lightline git branch
  function! LightLineGitBranch()
    return gitbranch#name()
  endfunction

  " Lightline filename function
  function! LightLineFilename()
    let name = ''
    let fullpath = expand('%:p')
    if fullpath =~ '\[defx\]'
      return ''
    endif
    if &filetype ==# 'help'
      return ''
    elseif &filetype ==# 'gitcommit'
      return ''
    endif
    let prefix = fullpath =~ '^' . $HOME ? '~/' : '/'
    let withouthome = substitute(fullpath, $HOME, '', '')
    let subs = split(withouthome, '/')
    let cwd = split(getcwd(), '/')[-1]
    let i = 1
    if len(subs) == 1
      return prefix . subs[0]
    endif
    for s in subs
      let parent = name
      if i == len(subs)
        " Filename
        let name = parent . '/' . s
      elseif i == 1 && getcwd() !=# $HOME && prefix !=# '/'
        " The first subdirectory. We don't want to add the slash here
        " since we'll prefix it later
        let name = strpart(s, 0, 1)
      elseif i == 1
        " The first sub directory is directly underneath the home or root
        " directory. This is used to show ~/.config/n/init.vim instead of
        " ~/./n/init.vim
        let name = s
      elseif s ==# cwd
        " Show the full name of the current working directory
        let name = parent . '/' . s
      else
        " Show only the first character of any normal directory
        let name = parent . '/' . strpart(s, 0, 1)
      endif
      let i += 1
    endfor
    let modified = &modified ? ' +' : ''
    return prefix . name . modified
  endfunction
endif

" Since we're using lightline, don't show "-- INSERT --", etc. at the bottom
set noshowmode

" Automatically change the directory to the current file
" set autochdir

" Set path
set path+=*

" change the leader key from "\" to ","
let mapleader=','

" Shortcut to edit THIS configuration file: (e)dit (c)onfiguration
nnoremap <silent> <Leader>ec :e $MYVIMRC<CR>

" Shortcut to source (reload) THIS configuration file after editing it: (s)ource (c)onfiguraiton
nnoremap <silent> <Leader>sc :source $MYVIMRC<CR>:echo "Sourced $MYVIMRC"<CR>

" spaces/tabs setup
set tabstop=2
set shiftwidth=2
set expandtab
set smarttab
augroup file_tabs_and_spaces
  autocmd!
  autocmd filetype python setlocal shiftwidth=4 tabstop=4
  autocmd filetype gitconfig setlocal shiftwidth=8 tabstop=8 noexpandtab
  autocmd filetype fish setlocal shiftwidth=4 tabstop=4
augroup end

" disable line numbers fzf
augroup disable_lines_fzf
  autocmd! filetype fzf
  autocmd filetype fzf set laststatus=0 noshowmode noruler nonumber
      \ norelativenumber | autocmd bufleave <buffer> set laststatus=2 showmode
      \ ruler number relativenumber
augroup end

" Highlight characters over the length limit
let g:skip_highlight_long_lines = ['defx', 'vim-plug']
function! UpdateMatch()
  match NONE
  if index(g:skip_highlight_long_lines, &filetype) >= 0
    return
  elseif &filetype ==# 'python'
    match Error /\%>120v.*\%<122v/
  else
    match Error /\%>80v.*\%<82v/
  end
endfunction
augroup highlight_long_lines
  autocmd!
  autocmd VimEnter,WinEnter * call UpdateMatch()
augroup END

" set a specific character for indent guides
let g:indentline_char = '│'

" don't use backup files
set nobackup
set nowritebackup

" don't give |ins-completion-menu| messages. (see :help shortmess)
set shortmess+=c

" always display the "signcolumn"
set signcolumn=yes

" turn on git-gutter by default
let g:gitgutter_enabled = 1

" How often to update git-gutter (and other stuff)
set updatetime=200

if !empty(glob('~/.vim/plugged/fzf.vim'))
  " Search for files
  command! -bang -nargs=? -complete=dir Files call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)
  nnoremap <silent> <Leader>f :Files<CR>

  " Customize fzf colors to match your color scheme
  let g:fzf_colors =
  \ { 'fg':      ['fg', 'Normal'],
    \ 'bg':      ['bg', 'Normal'],
    \ 'hl':      ['fg', 'Comment'],
    \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
    \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
    \ 'hl+':     ['fg', 'Statement'],
    \ 'info':    ['fg', 'PreProc'],
    \ 'border':  ['fg', 'Ignore'],
    \ 'prompt':  ['fg', 'Conditional'],
    \ 'pointer': ['fg', 'Exception'],
    \ 'marker':  ['fg', 'Keyword'],
    \ 'spinner': ['fg', 'Label'],
    \ 'header':  ['fg', 'Comment'] }

  " Customize fzf actions
  let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'enter': 'vsplit' }
endif

" Better searching in vim
set ignorecase
set smartcase

" Highlight the current line
set cursorline

" Show line numbers
set number

" Disable automatic comment insertion
augroup filetype_formatoptions
  autocmd!
  autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
augroup end

" Incremental search
set incsearch

" Spawn horizontal splits below instead of above
set splitbelow

" Spawn vertical splits to the right instead of left
set splitright

" Hide the end of line buffer characters (~) by making them the same
" color as the background
highlight EndOfBuffer guifg=bg

if !empty(glob('~/.vim/plugged/vim-projectionist'))
  " Projectionist shortcuts
  " Alternate file
  nnoremap <Leader>a :A<CR>
end

" Ignore pyc files in netrw
let g:netrw_list_hide= '.*\.swp$,.*\.pyc'

" Have Y yank from cursor to end of the line (like C[hange] and D[elete])
nnoremap Y y$

" Automatically autocomplete the first word from the completions
set completeopt+=noinsert

" Indent wrapped lines at the same level as the current line
set breakindent

" Only redraw when necessary
set lazyredraw

" Reload files when they're changed on disk
set autoread

" Set a buffer
set scrolloff=1

" Use good mouse behavior
set mouse=a

set re=0

" Move lines up and down
nnoremap - ddp
nnoremap _ ddkP

" Show trailing whitespaces
set list

" Trailing whitespace characters
set listchars=tab:»·,trail:·

" Automatically fix trailing whitespaces
function! FixWhitespace(line1,line2)
  let l:save_cursor = getpos('.')
  silent! execute ':' . a:line1 . ',' . a:line2 . 's/\s\+$//'
  call setpos('.', l:save_cursor)
endfunction
command! -range=% FixWhitespace call FixWhitespace(<line1>,<line2>)
augroup fix_whitespace
  autocmd!
  autocmd BufWritePre * execute "FixWhitespace"
augroup END

" VimScript continuation indent 2 tab widths
" https://google.github.io/styleguide/vimscriptguide.xml?showone=Whitespace#Whitespace
let g:vim_indent_cont = &shiftwidth * 2

" Testing config
if !empty(glob('~/.vim/plugged/vim-test'))
  let test#strategy = "vimterminal"
  let test#python#runner = 'nose'
  let test#python#nose#options = "--nologcapture --verbose"
endif

if !empty(glob('~/.vim/plugged/ale'))
  let g:ale_python_black_executable = 'black'
  let g:ale_completion_enabled = 1
  let g:ale_linters = {
      \ 'python': ['flake8', 'pyls'],
      \ 'javascript': [],
      \}
  let g:ale_fixers = {
      \ 'python': ['black', 'autopep8'],
      \ 'javascript': [],
      \}
endif

" Quickly echo the full file path
nnoremap <leader>% :let @*=expand("%:p")<CR>:echo expand('%:p')<CR>
nnoremap <leader>5 :let @*=expand("%:p")<CR>:echo expand('%:p')<CR>


if !empty(glob('~/.vim/plugged/vim-dispatch'))
  let g:dispatch_compilers = {}
  let g:dispatch_compilers['nosetests --doctest-tests --nologcapture --verbose'] = 'pyunit'
endif

function s:Psql(svc)
  silent execute "!psql_query " . a:svc . " " . expand('%:p')
  redraw!
endfunction

command! -nargs=1 Psql call s:Psql(<f-args>)

let g:rustfmt_autosave = 1

autocmd FileType ts,js autocmd BufWritePre * silent "!yarn format" <afile>
let g:typescript_compiler_binary = 'npx tsc'
