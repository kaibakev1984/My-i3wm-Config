" Enable syntax highlighting
syntax on
"
" " Change tabs to 2 spaces
set expandtab 
set tabstop=2
set shiftwidth=2
"
" " Automatically indent when starting new lines in code blocks
set autoindent
"
" " Add line numbers
set number
"
" " shows column, & line number in bottom right 
set ruler
"
" " Color scheme I found that works best with PowerShell
colorscheme default

" helpful if using 'set ruler' and 'colorscheme shine', makes lineNumbers grey
" Same example from http://vim.wikia.com/wiki/Display_line_numbers
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE

" " Disable bell sounds 
set noerrorbells visualbell t_vb=


