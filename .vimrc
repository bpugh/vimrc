" Environment {

    " Basics {
        set nocompatible        " Must be first line
    " }

    " Windows Compatible {
        " On Windows, also use '.vim' instead of 'vimfiles'; this makes synchronization
        " across (heterogeneous) systems easier.
        if has('win32') || has('win64')
            set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after
            source $VIMRUNTIME/mswin.vim
        endif
    " Vundle
        source C:/projects/github/dotfiles/vundle.vim
" }
    syntax enable
" key mappings {

    let mapleader = ","

    "Saves time; maps the spacebar to colon
    nmap <space> :

    "Shortcut for editing  vimrc file in a new tab
    nmap <leader>ev :tabedit $MYVIMRC<cr>

    "fix line endings
    nnoremap <leader>ed :e ++ff=dos<cr>

    "make Y behave like other commands
    nnoremap Y y$
    "fast paste yank register
    nnoremap s "0P

    "navigate by row
    nnoremap j gj
    nnoremap k gk

    nnoremap <leader>s :Ack '<C-R><C-W>'

    "paste default buffer on newline and autoindent
    nnoremap <leader>v o<C-R>"<ESC>

    "remove trailing whitespace
    nnoremap <Leader>w :%s/\s\+$//e<CR>

    " navigate tabs like most editors
    " just another reason to love
    nnoremap <C-S-Tab> :tabprevious<CR>
    nnoremap <C-Tab> :tabnext<CR>
    nnoremap J :tabprevious<CR>
    nnoremap K :tabnext<CR>

    "quick save and quit
    "nnoremap <leader>s :wq<CR>

    nnoremap <leader><space> :noh<cr>
    nnoremap <tab> %
    vnoremap <tab> %

    " Switch between the last two files
    nnoremap <leader><leader> <c-^>

    " NERDTree settings {{{
    " Put focus to the NERD Tree with F3 (tricked by quickly closing it and
    " immediately showing it again, since there is no :NERDTreeFocus command)
    nnoremap <leader>n :NERDTreeClose<CR>:NERDTreeToggle<CR>
    nnoremap <leader>m :NERDTreeClose<CR>:NERDTreeFind<CR>
    nnoremap <leader>N :NERDTreeClose<CR>

    " Quicker window movement
    nnoremap <C-j> <C-w>j
    nnoremap <C-k> <C-w>k
    nnoremap <C-h> <C-w>h
    nnoremap <C-l> <C-w>l

    map <F2> :NERDTreeToggle<CR>


" }

    "show line and column number on bottom of screen
    set ruler
    " Open new split panes to right and bottom, which feels more natural
    set splitbelow
    set splitright

    nnoremap / /\v
    vnoremap / /\v
    set ignorecase
    set smartcase
    set gdefault                    " search/replace 'globally' (on a line) by default
    set incsearch
    set showmatch
    set hlsearch
    set relativenumber
    set undofile
    set nomodeline                  " disable mode lines (security measure)

    autocmd Filetype gitcommit setlocal spell "turn on spell ckecking for git commit msgs

" Formatting {

    " set nowrap                      " Wrap long lines
    set autoindent                  " Indent at the same level of the previous line
    set shiftwidth=4                " Use indents of 4 spaces
    set expandtab                   " Tabs are spaces, not tabs
    set tabstop=4                   " An indentation every four columns
    set softtabstop=4               " Let backspace delete indent

    "don't treat - as a word separator
    "especially handy when working html classes and ids
    set iskeyword+=-
    " set lisp
    "set matchpairs+=<:>             " Match, to be used with %
    " set pastetoggle=<F12>           " pastetoggle (sane indentation on pastes)
    "set comments=sl:/*,mb:*,elx:*/  " auto format comment blocks
    " Remove trailing whitespaces and ^M chars
    " autocmd FileType c,cpp,java,php,javascript,python,twig,xml,yml autocmd BufWritePre <buffer> call StripTrailingWhitespace()
    " autocmd BufNewFile,BufRead *.html.twig set filetype=html.twig

" }

    " Backups files
    set backupdir=~/.vim/tmp/backup// " backups
    set directory=~/.vim/tmp/swap// " swap files
    set undodir=~/.vim/tmp/undo//
    set backup " enable backup

    " Set syntax highlighting for specific file types
    autocmd BufRead,BufNewFile *.md set filetype=markdown
    autocmd BufRead,BufNewFile *.markdown set filetype=markdown

    " Enable spellchecking for Markdown
    autocmd BufRead,BufNewFile *.md setlocal spell

    " Automatically wrap at 80 characters for Markdown
    autocmd BufRead,BufNewFile *.md setlocal textwidth=80
    autocmd BufRead,BufNewFile *.markdown setlocal textwidth=80

    " Display extra whitespace
    set list listchars=tab:��,trail:�

" Writing settings
    au FileType markdown set tw=80
    let g:pencil#wrapModeDefault = 'hard'   " or 'soft'

augroup pencil
  autocmd!
  autocmd FileType markdown call pencil#init()
  autocmd Filetype gitcommit call pencil#init()
  autocmd FileType text call pencil#init({'wrap': 'hard'})
augroup END

let g:litecorrect#typographic = 0
augroup litecorrect
    autocmd!
    autocmd FileType markdown call litecorrect#init()
    autocmd Filetype gitcommit call litecorrect#init()
  augroup END
