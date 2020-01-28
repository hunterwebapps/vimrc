syntax on
filetype indent plugin on

" ui 
set number
set relativenumber
set guifont=Cascadia\ Code:h10
set t_Co=256
set cursorline
set hidden
set wrap
set showcmd
set modelines=0
set updatetime=300

" colorscheme
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif
let &colorcolumn=join(range(81,999),",")
colorscheme codedark

" search
set wildmenu
set hlsearch
set incsearch
set showmatch
set ignorecase
set smartcase

" input
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set autowrite
set autoread
set backspace=indent,eol,start
set mouse=a
set clipboard=unnamedplus

" vim-vue
let g:vim_vue_plugin_load_full_syntax=1
let g:vue_pre_processors='detect_on_enter'

" NERDTree
nmap <F3> :NERDTreeToggle<CR>
let g:NERDTreeMouseMode=3
let g:NERDTreeShowLineNumbers=1
let g:NERDTreeMinimalUI=1
let g:nerdtreeindicatormapcustom={
    \ "modified"  : "*",
    \ "staged"    : "+",
    \ "untracked" : "_",
    \ "renamed"   : "r",
    \ "unmerged"  : "-",
    \ "deleted"   : "x",
    \ "dirty"     : "~",
    \ "clean"     : "o",
    \ "ignored"   : ".",
    \ "unknown"   : "?"
    \ }

" NERDCommenter
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDTrimTrailingWhitespace = 1

" Ctrl+P
let g:ctrlp_custom_ignore='\v[\/](node_modules|target|dist)|(\.(swp|ico|git|svn|nuget-packages))$'

" vim-javascript
let g:javascript_plugin_jsdoc = 1

" vim-rooter
let g:rooter_use_lcd = 1
let g:rooter_silent_chdir = 1

" vim-airline
let g:airline_theme="codedark"

" Omnisharp-roslyn
let g:OmniSharp_server_stdio = 1

" coc.nvim
let g:coc_global_extensions = [
    \ 'coc-json',
    \ 'coc-tsserver',
    \ 'coc-html',
    \ 'coc-css',
    \ 'coc-vetur',
    \ 'coc-yaml',
    \ 'coc-emmet',
    \ 'coc-snippets',
    \ 'coc-git',
    \ 'coc-xml',
    \ 'coc-markdownlint',
    \ 'coc-explorer',
    \ 'coc-omnisharp',
    \ 'coc-fsharp'
    \ ]

inoremap <silent><expr> <c-space> coc#refresh()

inoremap <silent><expr> <TAB>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

