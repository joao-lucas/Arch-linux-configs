"
" Author: Tiago Silva <https://github.com/Morgareth>
" 
"""""""""""""""""""""""""""""""""""""""""""""
" Usa as definições do vim, não as do vi
set nocompatible
"
" Define o tamanho do histórico de comandos do vim:
set history=1000
"
" Habilita o reconhecimento de arquivos
filetype plugin on
filetype indent on
"
" Recarrega o arquivo caso ele seja editado por um programa externo enquanto aberto
set autoread
"
" Desabilitar backups:
set nobackup
set noswapfile
" set nowritebackup
"
" Mostra o modo que você esta.
set showmode
"
" Busca:
set hlsearch
set ignorecase
set smartcase
set incsearch
"
" Limpar os resultados destacados:
nmap <silent> <C-C> :silent noh<CR>
"
" Clipboard do sistema:
set clipboard=unnamed
"
" Altura da barra de comandos
set cmdheight=2
"
" Habilita expressões regulares
set magic
"
" Habilita o destaque de sintaxe
syntax on
"
" Esquema de cores do vim
" colorscheme sobrio
set background=dark
"
" Régua, quebra e número de linhas:
set nolinebreak
set number
set ruler
"
" Permite a navegação dentro de uma mesma linha longa com j e k
set wrap
"
" Define a fonte a ser usada
set guifont=Monaco\ 10
"
" Insere espaços no lugar de caracteres de tabulação
set expandtab
"
" Uso inteligente de tabulações
set smarttab
"
" Define uma tabulação como sendo oito espaços
set shiftwidth=8
set tabstop=8
"
"Toda vez que você fecha um parêntese, colchete ou chave, o Vi mostra onde este foi aberto. Caso não haja  nenhum aberto para este, deixa em vermelho parênteses ou  chaves que não têm um par.
set sm
"
"Mostra o nome do arquivo na parte superior do prompt
set title

set laststatus=2

set encoding=utf-8

set showtabline=2 

set noshowmode 

set fillchars+=stl:\ ,stlnc:\

"Atalhos

nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>

" Plugins

"Patogen
execute pathogen#infect()
"
" NerdTree {
        if isdirectory(expand("~/.vim/bundle/nerdtree"))
            map <C-e> :NERDTreeToggle<CR>
            map <leader>e :NERDTreeFind<CR>
            nmap <leader>nt :NERDTreeFind<CR>
 
            let NERDTreeShowBookmarks=1
            let NERDTreeIgnore=['\.py[cd]$', '\~$', '\.swo$', '\.swp$', '^\.git$', '^\.hg$', '^\.svn$', '\.bzr$']
            let NERDTreeChDirMode=0
            let NERDTreeQuitOnOpen=1
            let NERDTreeMouseMode=2
            let NERDTreeShowHidden=1
            let NERDTreeKeepTreeInNewTab=1
            let g:nerdtree_tabs_open_on_gui_startup=0
        endif
    " }
       
" YouCompleteMe
 
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_autoclose_preview_window_after_completion=1
nnoremap <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>     
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
"          
"Python-mode
 
" Override go-to.definition key shortcut to Ctrl-]
let g:pymode_rope_goto_definition_bind = "<C-]>"
"
" Override run current python file key shortcut to Ctrl-Shift-e
let g:pymode_run_bind = "<C-S-e>"
"
" Override view python doc key shortcut to Ctrl-Shift-d
let g:pymode_doc_bind = "<C-S-d>"

" vim-airline
let g:airline_theme = 'powerlineish'
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
" vim-airline
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

if !exists('g:airline_powerline_fonts')
  let g:airline#extensions#tabline#left_sep = ' '
  let g:airline#extensions#tabline#left_alt_sep = '|'
  let g:airline_left_sep          = '▶'
  let g:airline_left_alt_sep      = '»'
  let g:airline_right_sep         = '◀'
  let g:airline_right_alt_sep     = '«'
  let g:airline#extensions#branch#prefix     = '⤴' "➔, ➥, ⎇
  let g:airline#extensions#readonly#symbol   = '⊘'
  let g:airline#extensions#linecolumn#prefix = '¶'
  let g:airline#extensions#paste#symbol      = 'ρ'
  let g:airline_symbols.linenr    = '␊'
  let g:airline_symbols.branch    = '⎇'
  let g:airline_symbols.paste     = 'ρ'
  let g:airline_symbols.paste     = 'Þ'
  let g:airline_symbols.paste     = '∥'
  let g:airline_symbols.whitespace = 'Ξ'
else
  let g:airline#extensions#tabline#left_sep = ''
  let g:airline#extensions#tabline#left_alt_sep = ''

  " powerline symbols
  let g:airline_left_sep = ''
  let g:airline_left_alt_sep = ''
  let g:airline_right_sep = ''
 endif
