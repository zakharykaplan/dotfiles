"
"  autocommands.vim
"  Vim autocommands.
"
"  Created by Zakhary Kaplan on 2020-09-12.
"  Copyright © 2020 Zakhary Kaplan. All rights reserved.
"

" --------------------------------
"           Autocommands
" --------------------------------

" Vimrc: {{{
augroup vimrc
  autocmd!

  " Override formatoptions upon entering a new buffer
  autocmd BufNewFile,BufWinEnter * setlocal formatoptions-=cro

  " For very long files, set foldmethod to indent to avoid long folding times
  autocmd BufNewFile,BufRead *
    \ if line('$') < 1000
    \ |   setlocal foldmethod=syntax
    \ | else
    \ |   setlocal foldmethod=indent
    \ | endif
  " Tier foldlevel depending on how many lines are in the buffer
  autocmd BufNewFile,BufRead *
    \ if line('$') < 100
    \ |   setlocal foldlevel=99
    \ | else
    \ |   setlocal foldlevel=0
    \ | endif

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid, when inside an event handler
  " (happens when dropping a file on gvim) and for a commit message (it's
  " likely a different one than last time).
  autocmd BufReadPost *
    \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
    \ |   exe "normal! g`\""
    \ | endif

  " Trim trailing whitespace on write
  autocmd BufWritePre * %s/\s\+$//e
  " Replace tabs with spaces on write
  autocmd BufWritePre * retab

  " Don't screw up folds when inserting text that might affect them, until
  " leaving insert mode. Foldmethod is local to the window. Protect against
  " screwing up folding when switching between windows.
  autocmd InsertEnter *
    \ if !exists('w:foldmethod')
    \ |   let w:foldmethod=&foldmethod | setlocal foldmethod=manual
    \ | endif
  autocmd InsertLeave,WinLeave *
    \ if exists('w:foldmethod')
    \ |   let &l:foldmethod=w:foldmethod

  " Disable line numbers in terminal buffers
  if exists('##TerminalOpen')
    autocmd TerminalOpen * set nonumber
  endif

augroup END
" }}}

" vim: foldmethod=marker
