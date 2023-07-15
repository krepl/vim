"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" My Vim configuration (sfurman)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"******************************************************************************
" GUI settings
set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar
"******************************************************************************

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" YouCompleteMe
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let g:ycm_auto_hover=''
set completeopt-=preview

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CTags
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NOTE: You can generate the tags file for a sandbox with the following
" commands
" $ cd $(sbroot)
" $ /mathworks/hub/share/sbtools/external-apps/exuberant-ctags/exuberant-ctags-5.9/exuberant-ctags/ctags -R matlab/src/

" add the path "$(sbroot)/tags" to the tag stack
"let sbroot = systemlist("sbroot")[0]
"let &tags = &tags . "," . sbroot . "/tags"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <C-n> :NERDTreeToggle<CR>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" EasyMotion
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Gif config
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)

" These `n` & `N` mappings are options. You do not have to map `n` & `N` to EasyMotion.
" Without these mappings, `n` & `N` works fine. (These mappings just provide
" different highlight method and have some other features )
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-clang-format
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:clang_format#command="clang-format"
let g:clang_format#auto_format=1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

execute pathogen#infect()
syntax on
filetype plugin indent on

" Set values of backspace, to delete over line breaks, or automatically-inserted
" indentation, or the place where insert mode started
" (for some reason none of these are set by default in Vim 7.4
set backspace=indent,eol,start

" Set the default encoding to utf-8
set encoding=utf-8

" Set statusline always on
set laststatus=2

" Set info on the left
set statusline=\ %m                                     "modified flag
set statusline+=%t                                      "tail of the filename
set statusline+=%r                                      "read only flag
set statusline+=\ %y                                    "filetype
set statusline+=\ [enc:%{strlen(&fenc)?&fenc:'none'},   "file encoding
set statusline+=\ fmt:%{&ff}]                           "file format

" Set info on the right
set statusline+=%=\ \ \ \ BN:\ %{bufnr('%')}\ \ \       "buffer number
"set statusline+=%=%{strftime('%a\ %d\ %b\ %Y\ \ \ ')}   "date

"Change the window-local current directory to be the same as the directory of
"the current file.
    "NOTE: There is no easy way to test for this autocmd in a script like there
    "is for the 'autochdir' option.
autocmd BufEnter * silent! lcd %:p:h

"Keymappings for custom macros
    "Add Markdown-style 'dash' underline to a line of text
    let @d = 'yyp:s/./-/gkddPj^'
    "Add Markdown-style 'equal-sign' underline to a line of text
    let @e = 'yyp:s/./=/gkddPj^'
    "Remove whitespace from empty lines
    let @w = 'ma:%s/^\s*$//g`a'

"Hides buffers instead of closing them.
    "This means that you can have unwritten changes to a file and open a new
    "file using :e, without being forced to write or undo your changes first.
    "Also, undo buffers and marks are preserved while the buffer is open.
    "set hidden

"Autocompletion
    "Autocompletion with CTRL-N
    "Set a dictionary for CTRL-N autocomplete
    set dictionary+=/usr/share/dict/words
    set dictionary+=/usr/share/dict/
    "Enable dictionary completion source (For the CTRL-N shortcut in insert
    "mode)
    set complete+=k

""Omnicompletion - complete syntax words (<CTRL-X><CTRL-O>)
"if has("autocmd") && exists("+omnifunc")
  "autocmd Filetype *
          "\	if &omnifunc == "" |
          "\		setlocal omnifunc=syntaxcomplete#Complete |
          "\	endif
"endif

"Programming formatting
    "Lines numbers
    set number
    set autoindent
    "Syntax highlighting
    syntax enable
    set tabstop=8
    "Convert tabs to spaces
    set expandtab
    set shiftwidth=4
    set softtabstop=4
    "filetype indent plugin on
        "^^^ Redundant b/c exists in Vundle settings above
    "Show (partial) command in the last line of the screen
    set showcmd
    "Automatic folding based on indentation
    set foldmethod=syntax
    "Start with all folds open
    set foldlevelstart=99

"Textwidth (i.e. wrapping)
set tw=79

"Colored bar at the 80th column
set colorcolumn=80

" Settings for Solarized colorscheme
"let g:solarized_termcolors = 256
colorscheme solarized
set background=dark
highlight Visual cterm=reverse ctermbg=NONE
