" Filetype settings
filetype plugin on
filetype indent on

" Autoread and checktime settings
set autoread
au FocusGained,BufEnter * silent! checktime

" Ruler and syntax settings
set ruler
syntax enable

" Regexp engine setting
set regexpengine=0

" Color settings
if $COLORTERM == 'gnome-terminal'
    set t_Co=256
endif

" Vim-Plug setup
call plug#begin('~/.vim/plugged')
    Plug 'preservim/nerdtree'
    Plug 'ayu-theme/ayu-vim'
    Plug 'itchyny/lightline.vim'
    Plug 'tpope/vim-surround'
    Plug 'editorconfig/editorconfig-vim'
    Plug 'w0rp/ale'
    Plug 'airblade/vim-gitgutter'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'ycm-core/YouCompleteMe'
    Plug 'kamykn/spelunker.vim'
    Plug 'kamykn/popup-menu.nvim'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
call plug#end()

let g:ale_completion_enabled = 1
set omnifunc=ale#completion#OmniFunc
let g:ale_completion_autoimport = 0

" Theme settings
set termguicolors
let ayucolor="dark"

try
    colorscheme ayu
catch
endtry
set background=dark

" Encoding and file format settings
set encoding=utf8
set ffs=unix,dos,mac

" Backup settings
set nobackup
set nowb
set noswapfile

" Tab settings
set expandtab
set smarttab
set shiftwidth=4
set tabstop=4

" Indent and wrap settings
set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

" Visual mode mappings
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

" Return to last edit position when opening files
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Status line settings
set laststatus=2
set statusline=\ %F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ L\:\ %l\ \ C\:\ %c

" Spell checking mappings
map <leader>ss :setlocal spell!<cr>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=

" NERDTree settings (optional)
map <C-n> :NERDTreeToggle<CR>

" Relative line numbers
set relativenumber

" Buffer management
map <leader>ba :bufdo bd<cr>
map <leader>l :bnext<cr>
map <leader>h :bprevious<cr>

" Tab management
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove
map <leader>t<leader> :tabnext<cr>

" Toggle between tabs
let g:lasttab = 1
nmap <leader>tl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()

" Open a new tab with the current buffer's path
map <leader>te :tabedit <C-r>=escape(expand("%:p:h"), " ")<cr>/

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Specify the behavior when switching between buffers
try
    set switchbuf=useopen,usetab,newtab
    set stal=2
catch
endtry

" Tab navigation mappings (Ctrl + PageUp/PageDown)
nnoremap <C-PageUp> :tabprev<CR>
nnoremap <C-PageDown> :tabnext<CR>
nnoremap <C-S-PageUp> :tabm -1<CR>
nnoremap <C-S-PageDown> :tabm +1<CR>

" Terminal toggle function (F1, Ctrl-t)
let s:term_buf_nr = -1
function! s:ToggleTerminal() abort
    if s:term_buf_nr == -1
        execute "botright terminal"
        let s:term_buf_nr = bufnr("$")
    else
        try
            execute "bdelete! " . s:term_buf_nr
        catch
            let s:term_buf_nr = -1
            call s:ToggleTerminal()
            return
        endtry
        let s:term_buf_nr = -1
    endif
endfunction

" Terminal toggle mappings
noremap <silent> <C-t> :call <SID>ToggleTerminal()<CR>
tnoremap <silent> <C-t> <C-w>N:call <SID>ToggleTerminal()<CR>

noremap <silent> <F1> :call <SID>ToggleTerminal()<CR>
tnoremap <silent> <F1> <C-w>N:call <SID>ToggleTerminal()<CR>

" Make (F5)
noremap <silent> <F5> :make<CR>

" Disable error bells
set noerrorbells

" Function to toggle NERDTree (F2 and Ctrl-f)
function! ToggleNERDTree()
  if &filetype == 'nerdtree'
    bd!
  else
    NERDTreeToggle
  endif
endfunction

" Key mappings to call the functions
nnoremap <F2> :call ToggleNERDTree()<CR>
nnoremap <C-f> :call ToggleNERDTree()<CR>

" Lightline settings
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }

" toggle Fuzzy Finder (F3)
noremap <silent> <F3> :FZF<CR>

" Spell checking 
let g:enable_spelunker_vim = 1
let g:enable_spelunker_vim_on_readonly = 0

" pineapple

nnoremap <silent> <C-s> :call spelunker#correct_from_list()<CR>
nnoremap <silent> <C-a> :call spelunker#check()<CR>

" Vim key mappings
nnoremap <C-p> :NERDTreeToggle<CR>     " Open/close file explorer
nnoremap <C-f> :Rg<Space>               " Search files using ripgrep
nnoremap <C-s> :w<CR>                   " Save file
nnoremap <C-q> :q<CR>                   " Close file
nnoremap <C-z> :undo<CR>                " Undo
nnoremap <C-y> :redo<CR>                " Redo
nnoremap <C-c> "+y                     " Copy to system clipboard
nnoremap <C-v> "+p                     " Paste from system clipboard

highlight SpelunkerSpellBad cterm=underline ctermfg=247 gui=underline guifg=#ff0000
highlight SpelunkerComplexOrCompoundWord cterm=underline ctermfg=NONE gui=underline guifg=NONE

" Ignore case for write and quit commands
cnoreabbrev WQ wq
cnoreabbrev Wq wq
cnoreabbrev W w
cnoreabbrev Q q

" YCM

let g:ycm_min_num_of_chars_for_completion = 1


