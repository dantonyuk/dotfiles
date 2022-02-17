" vim: set fdm=marker:

" Compatibility {{{
    set nocompatible
    set encoding=utf8
    set modelines=1
    set nobackup
    set nowrap

    set noerrorbells
    set novisualbell
    set t_vb=

    set tags=./tags;
" }}}
" Indentations, tabs/spaces {{{
    set expandtab
    set tabstop=4
    set softtabstop=4
    set shiftwidth=4
    set shiftround
    set smarttab
    set smartindent
    set autoindent
    set formatoptions=croql
    set backspace=indent,eol,start
    filetype plugin on
    filetype indent on
" }}}
" Scrolling {{{
    set scrolloff=3
    set sidescroll=5
    set sidescrolloff=5
" }}}
" Line numbers {{{
    set number
" }}}
" Command line {{{
    set cmdheight=1
    set completeopt=menu,preview
    if has('nvim')
        "cnoremap <C-A> <Home>
        "cnoremap <C-F> <Right>
        "cnoremap <C-B> <Left>
        "cnoremap <C-p> <Up>
        "cnoremap <C-n> <Down>
        "cnoremap <Esc>b <S-Left>
        "cnoremap <Esc>f <S-Right>
    endif
" }}}
" Status line {{{
    set shortmess=filmnrwxtToOI
    set showcmd
    set laststatus=2
" }}}
" Sign column {{{
    set signcolumn=auto:5
" }}}
" {{{ Title
autocmd BufEnter * let &titlestring = "[vim] " . expand("%:t") | set title
" }}}
" Mouse {{{
    set ttyfast
    if !has('nvim')
        set ttymouse=sgr
    endif
    set mouse=a
    set mousemodel=popup
    set mousehide
" }}}
" Searching {{{
    set hlsearch
    set incsearch
    set ignorecase
    set smartcase
    set showmatch
    set nowrapscan

    set grepprg=grep\ -nH\ $*

    if has('nvim')
      set inccommand=split
    endif

    nnoremap <C-\> :nohlsearch<CR>
    vnoremap <C-\> <Esc>:nohlsearch<CR>gv
" }}}
" Buffers {{{
    set hidden
    set nostartofline
    nnoremap <Leader>q :bprevious<bar>split<bar>bnext<bar>bdelete<CR>
    nnoremap <Leader>s :update<CR>
" }}}
" Wildignore {{{
    set wildignore+=*.pyc
    set wildignore+=*.class
    set wildignore+=*.bak
    set wildignore+=*.swp
" }}}
" Clipboard {{{
    if has('nvim')
      set clipboard+=unnamedplus
    endif
" }}}
" Macros {{{
    set lazyredraw
" }}}
" File type autocmds {{{
    augroup md
        autocmd BufNewFile,BufRead *.md set tabstop=2 shiftwidth=2 expandtab tw=72
        autocmd BufNewFile,BufRead *.md setlocal spell spelllang=en_us
    augroup END
    augroup clj
        autocmd BufNewFile,BufRead *.clj RainbowParentheses
    augroup END
" }}}
" Plugins {{{1
" Coc Extensions {{{2
    let g:coc_global_extensions = [
    \ 'coc-css',
    \ 'coc-html',
    \ 'coc-json',
    \ 'coc-yaml',
    \ 'coc-tsserver',
    \ 'coc-vetur',
    \ 'coc-explorer',
    \ 'coc-go',
    \ 'coc-java',
    \ 'coc-lists',
    \ 'coc-snippets'
    \ ]
" }}}
    packadd matchit
    packadd cfilter

    let g:polyglot_disabled = ['go']

    call plug#begin('~/.vim/plugged')

    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'
    Plug 'yuki-yano/fzf-preview.vim', { 'branch': 'release/rpc' }
    " fzf {{{2
    nnoremap <silent> <Leader>a :Buffers<CR>
    nnoremap <silent> <Leader>A :Files<CR>

    if has('nvim') || has('gui_running')
      let $FZF_DEFAULT_OPTS .= ' --inline-info --bind up:preview-up,down:preview-down'
    endif

    nnoremap <Space><Tab> :CocCommand fzf-preview.
    " }}}

    Plug 'akinsho/bufferline.nvim'
    Plug 'nvim-lualine/lualine.nvim'
    Plug 'jreybert/vimagit'
    Plug 'rhysd/git-messenger.vim'
    " git-messenger {{{2
    nnoremap <silent> <Space>gm :GitMessenger<CR>
    nmap <silent> <Space>gM gmgm
    " }}}
    Plug 'tpope/vim-fugitive'
    " vim-fugitive {{{2
    nnoremap <silent> <Space>gg :G<CR>
    nnoremap <silent> <Space>gw :Gwrite<CR>
    nnoremap <silent> <Space>gr :Gread<CR>
    nnoremap <silent> <Space>gcc :Git commit -v<CR>
    nnoremap <silent> <Space>gca :Git commit -a<CR>
    nnoremap <silent> <Space>gc! :Git commit --amend<CR>
    nnoremap <silent> <Space>gp :Git push<CR>
    nnoremap <silent> <Space>gb :Git blame<CR>
    nnoremap <silent> <Space>gd :tab Gvdiff<CR>
    " }}}
    Plug 'machakann/vim-sandwich'
    Plug 'tpope/vim-unimpaired'
    Plug 'tpope/vim-repeat'
    Plug 'tpope/vim-eunuch'
    Plug 'tpope/vim-commentary'
    Plug 'idanarye/vim-merginal'
    Plug 'airblade/vim-gitgutter'
    " vim-gitgutter {{{2
    nnoremap <silent> <Space>gf :GitGutterFold<CR>
    nnoremap <silent> <Space>gq :GitGutterQuickFix \| copen<CR>
    " }}}
    Plug 'junegunn/gv.vim'
    " gv.vim {{{2
    nnoremap <silent> <Space>gv :GV<CR>
    " }}}
    Plug 'tpope/vim-rhubarb'
    Plug 'junegunn/vim-github-dashboard'
    Plug 'flazz/vim-colorschemes'
    Plug 'mhinz/vim-startify'
    " vim-startify {{{2
    let g:startify_change_to_dir = 0
    " }}}
    Plug 'mg979/vim-visual-multi'

    Plug 'easymotion/vim-easymotion'
    Plug 'haya14busa/incsearch.vim'
    Plug 'haya14busa/incsearch-fuzzy.vim'
    Plug 'haya14busa/incsearch-easymotion.vim'
    " easy-motion {{{2
    map <Leader>f <Plug>(easymotion-overwin-f)
    map <Leader>w <Plug>(easymotion-overwin-w)
    map <Leader>j <Plug>(easymotion-j)
    map <Leader>k <Plug>(easymotion-k)

    let g:incsearch#auto_nohlsearch = 1
    map n  <Plug>(incsearch-nohl-n)
    map N  <Plug>(incsearch-nohl-N)
    map *  <Plug>(incsearch-nohl-*)
    map #  <Plug>(incsearch-nohl-#)
    map g* <Plug>(incsearch-nohl-g*)
    map g# <Plug>(incsearch-nohl-g#)

    map /  <Plug>(incsearch-forward)
    map ?  <Plug>(incsearch-backward)
    map g/ <Plug>(incsearch-stay)

    function! s:config_easyfuzzymotion(...) abort
      return extend(copy({
      \   'converters': [incsearch#config#fuzzy#converter()],
      \   'modules': [incsearch#config#easymotion#module()],
      \   'keymap': {"<C-M>": '<Over>(easymotion)'},
      \   'is_expr': 0,
      \   'is_stay': 1
      \ }), get(a:, 1, {}))
    endfunction

    noremap <silent><expr> <Space>/ incsearch#go(<SID>config_easyfuzzymotion())
    " }}}

    Plug 'honza/vim-snippets'

    Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
    " vim-go {{{2
    let g:go_version_warning = 0
    " }}}
    Plug 'tpope/vim-fireplace'
    Plug 'guns/vim-clojure-static'
    Plug 'junegunn/rainbow_parentheses.vim'
    " rainbow_parentheses.vim {{{2
    let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['{', '}']]
    " }}}
    Plug 'guns/vim-sexp'
    " vim-sexp {{{2
    let g:sexp_filetypes = 'clojure,scheme,racket,lisp,timl'
    " }}}
    Plug 'tpope/vim-sexp-mappings-for-regular-people'

    Plug 'sheerun/vim-polyglot'
    Plug 'junegunn/vim-easy-align'
    " vim-easy-align {{{2
    xmap ga <Plug>(EasyAlign)
    nmap ga <Plug>(EasyAlign)
    xmap gA <Plug>(LiveEasyAlign)
    nmap gA <Plug>(LiveEasyAlign)
    " }}}

    Plug 'junegunn/goyo.vim'
    " goyo {{{2
    nmap <F5> :Goyo<CR>
    " }}}
    Plug 'junegunn/limelight.vim'
    " limelight {{{2
    let g:limelight_conceal_ctermfg = '238'
    autocmd! User GoyoEnter Limelight
    autocmd! User GoyoLeave Limelight!
    " }}}

    Plug 'neoclide/coc.nvim', {'branch': 'release', 'do': { -> coc#util#install() }}
    " coc {{{2
    " Autocompletion mappings
    function! s:check_back_space() abort
        let col = col('.') - 1
        return !col || getline('.')[col - 1]  =~# '\s'
    endfunction
    inoremap <silent><expr> <TAB>
                \ pumvisible() ? "\<C-n>" :
                \ <SID>check_back_space() ? "\<Tab>" :
                \ coc#refresh()
    inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<Tab>"
    inoremap <expr><C-y><C-y> pumvisible() ? "\<C-y>" : "\<C-y>\<C-y>"
    inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"

    " Go to mappings
    nmap <silent> <Space>ld <Plug>(coc-definition)
    nmap <silent> <Space>lt <Plug>(coc-type-definition)
    nmap <silent> <Space>lp <Plug>(coc-implementation)
    nmap <silent> <Space>lr <Plug>(coc-references)

    " Diagnostics navigation
    nmap <silent> [g <Plug>(coc-diagnostic-prev)
    nmap <silent> ]g <Plug>(coc-diagnostic-next)

    " Refactoring mappings
    nmap <Space>ln <Plug>(coc-rename)
    nmap <Space>lf <Plug>(coc-format)
    xmap <Space>lf <Plug>(coc-format-selected)
    nmap <Space>la <Plug>(coc-codeaction)
    xmap <Space>la <Plug>(coc-codeaction-selected)
    nmap <Space>lX <Plug>(coc-fix-current)
    nmap <Space>lx :CocFix<CR>
    nmap <Space>lo :call CocAction('organizeImport')<CR>

    " Coc lists mappings
    nnoremap <silent> <Space>lld :<C-u>CocList diagnostics<cr>
    nnoremap <silent> <Space>lle :<C-u>CocList extensions<cr>
    nnoremap <silent> <Space>llc :<C-u>CocList commands<cr>
    nnoremap <silent> <Space>llo :<C-u>CocList outline<cr>
    nnoremap <silent> <Space>lls :<C-u>CocList -I symbols<cr>

    " Util mappings
    nnoremap <silent> <Space>li :<C-u>call CocAction('doHover')<CR>
    nmap <silent> <Space>ls <Plug>(coc-range-select)
    xmap <silent> <Space>ls <Plug>(coc-range-select)

    " Highlight current identifier usage in current document
    autocmd CursorHold * silent call CocActionAsync('highlight')

    " Text objects: functions and classes
    xmap if <Plug>(coc-funcobj-i)
    omap if <Plug>(coc-funcobj-i)
    xmap af <Plug>(coc-funcobj-a)
    omap af <Plug>(coc-funcobj-a)
    xmap ic <Plug>(coc-classobj-i)
    omap ic <Plug>(coc-classobj-i)
    xmap ac <Plug>(coc-classobj-a)
    omap ac <Plug>(coc-classobj-a)
    " }}}

    Plug 'mattn/emmet-vim'
    Plug 'nathanaelkane/vim-indent-guides'
    " vim-indent-guides {{{2
    let g:indent_guides_enable_on_vim_startup = 0
    let g:indent_guides_guide_size = 1
    " }}}
    " Text object plugins
    Plug 'michaeljsmith/vim-indent-object'
    Plug 'wellle/targets.vim'
    " To test them first
    Plug 'DougBeney/vim-reddit'

    Plug 'nvim-lua/plenary.nvim'
    Plug 'NTBBloodbath/rest.nvim'
    " rest-nvim {{{2
    nnoremap <Space>hh :lua require('rest-nvim').run()<CR>
    nnoremap <Space>hp :lua require('rest-nvim').run(true)<CR>
    " }}}
    Plug 'jeetsukumaran/vim-markology'
    Plug 'liuchengxu/vim-clap'
    Plug 'mattn/webapi-vim'
    Plug 'mattn/vim-gist'
    Plug 'kyazdani42/nvim-web-devicons'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'pwntester/octo.nvim'

    Plug 'dantonyuk/auto-sessions.vim'
    
    call plug#end()
    " vim-startify {{{2
    let g:startify_custom_header_quotes =
        \ startify#fortune#predefined_quotes()
        \ + [['Design is separating into things that can be composed.', '', '- Rich Hickey']]
        \ + [['When you combine two pieces of data you get data.', 'When you combine two machines you get trouble.', '', '- Rich Hickey']]
        \ + [['Nobody wants to program with mutable strings anymore,', 'why do you want to program with mutable collections?', '- Rich Hickey']]
        \ + [['Eventually, with mutable objects you create an intractable mess. And encapsulation does not get rid of that. Encapsulation only means: "well I''m in charge of this mess".', '- Rich Hickey']]
        \ + [['It’s not an idea until you write it down.', '', '- Ivan Sutherland']]
        \ + [['If the technology you do isn’t fun for you, you may wish to seek other employment.', 'Without the fun, none of us would go on.', '', '- Ivan Sutherland']]
    " }}}
    " markology {{{2
    let g:markology_enable=0
    let g:markology_textlower=' '
    let g:markology_textupper=' '
    let g:markology_textother=' '
    hi MarkologyHLl ctermfg=yellow ctermbg=black cterm=bold guifg=green guibg=black
    hi MarkologyHLLine cterm=underline gui=undercurl guisp=#007777
    hi MarkologyHLu ctermfg=yellow ctermbg=black cterm=bold guifg=green guibg=black
    hi MarkologyHLo ctermfg=yellow ctermbg=black cterm=bold guifg=green guibg=black
    hi MarkologyHLm ctermfg=yellow ctermbg=black cterm=bold guifg=green guibg=black
    " }}}
" }}}
lua << EOF
-- octo
require"octo".setup {
    colors = {
        white = { gui = "#ffffff", cterm = "Black" },
        grey = { gui = "#d7dadf", cterm = "Grey" },
        black = { gui = "#000000", cterm = "White" },
        red = { gui = "#fdb8c0", cterm = "Green" },
        dark_red = { gui = "#da3633", cterm = "Green" },
        green = { gui = "#acf2bd", cterm = "Red" },
        dark_green = { gui = "#238636", cterm = "Red" },
        yellow = { gui = "#d3c846", cterm = "Blue" },
        dark_yellow = { gui = "#735c0f", cterm = "Blue" },
        blue = { gui = "#58A6FF", cterm = "Yellow" },
        dark_blue = { gui = "#0366d6", cterm = "Yellow" },
        purple = { gui = "#6f42c1", cterm = "54" },
    }
}
require'octo.colors'.setup()

-- lualine
hide_in_width = function()
        return vim.fn.winwidth(0) > 72
end

require('lualine').setup {
    options = {
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        disabled_filetypes = { "coc-explorer" }
    },
    sections = {
        lualine_a = {
            {
                "mode"
            }
        },
        lualine_b = {
            {
                "branch",
                icon = " "
            },
            {
                "filename"
            }
        },
        lualine_c = {
            {
                "diff",
                symbols = { added = "  ", modified = " ", removed = " " },
            },
            {
                "python_env"
            }
        },
        lualine_x = {
            {
                "diagnostics",
				sources = { 'nvim_diagnostic', 'coc' },
                symbols = { error = " ", warn = " ", info = " ", hint = " " },
                cond = hide_in_width,
            },
            {
                "treesitter"
            },
            {
                "lsp"
            },
            {
                "filetype"
            }
        },
        lualine_y = {},
        lualine_z = {
            {
                function()
                    local current_line = vim.fn.line "."
                    local total_lines = vim.fn.line "$"
                    local chars = { "__", "▁▁", "▂▂", "▃▃", "▄▄", "▅▅", "▆▆", "▇▇", "██" }
                    local line_ratio = current_line / total_lines
                    local index = math.ceil(line_ratio * #chars)
                    local percent = math.ceil(line_ratio * 100)
                    return " " .. tostring(percent) .. "%% " .. chars[index] .. " "
                end,
                padding = { left = 0, right = 0 },
                color = { fg = "yellow", bg = vim.fn.synIDattr(vim.api.nvim_get_hl_id_by_name('Normal'), 'bg') },
                cond = nil,
            }
        },
    },
}

-- bufferline
vim.opt.termguicolors = true
require("bufferline").setup {
    highlights = {
      background = {
        gui = "",
      },
      buffer_selected = {
        gui = "bold",
      },
    },
    options = {
        show_buffer_close_icons = false,
        show_close_icon = false,
        offsets = {
            {
                filetype = "coc-explorer",
                text = "Explorer",
                highlight = "PanelHeading",
                padding = 1,
            }
        }
    }
}
EOF
" Colors {{{
    syntax on
    colorscheme nord
" }}}
" Russian keyboard {{{
    set keymap=russian-jcukenwin
    set iskeyword=@,48-57,_,192-255
    set iminsert=0
    set imsearch=0
    map ё `
    map й q
    map ц w
    map у e
    map к r
    map е t
    map н y
    map г u
    map ш i
    map щ o
    map з p
    map х [
    map ъ ]
    map ф a
    map ы s
    map в d
    map а f
    map п g
    map р h
    map о j
    map л k
    map д l
    map ж ;
    map э '
    map я z
    map ч x
    map с c
    map м v
    map и b
    map т n
    map ь m
    map б ,
    map ю .
    map Ё ~
    map Й Q
    map Ц W
    map У E
    map К R
    map Е T
    map Н Y
    map Г U
    map Ш I
    map Щ O
    map З P
    map Х {
    map Ъ }
    map Ф A
    map Ы S
    map В D
    map А F
    map П G
    map Р H
    map О J
    map Л K
    map Д L
    map Ж :
    map Э "
    map Я Z
    map Ч X
    map С C
    map М V
    map И B
    map Т N
    map Ь M
    map Б <
    map Ю >
" }}}
" Some fun stuff {{{

" Morse operator
"nnoremap <silent> gm :set opfunc=Morse<cr>g@
"vnoremap <silent> gm :<c-u>call Morse(visualmode(), 1)<cr>
function! Morse(vt, ...)
    let [sl, sc] = getpos(a:0 ? "'<" : "'[")[1:2]
    let [el, ec] = getpos(a:0 ? "'>" : "']")[1:2]
    if a:vt == 'line'
    elseif a:vt == 'char'
        exe sl.','.el.'s/\%'.sc.'c.\+\%<'.(ec + 1).'c/\=MorseMap(submatch(0))/g'
    elseif a:vt == 'block'
    endif
endfunction

function MorseMap(ch)
python3 << EOF
import vim
morse_map = {
    '"': '\\"',
    '\n': '\\n',
    '\r': '\\r',
    's': ' ... ',
    'o': ' --- ',
}

text = vim.eval('a:ch')
new_text = ''.join(map(lambda c: morse_map.get(c, c), text))
vim.command('let result="' + new_text + '"')
EOF
    return result
endfunction
" }}}
