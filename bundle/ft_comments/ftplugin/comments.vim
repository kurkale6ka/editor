augroup RC_GRP_FILETYPE
   autocmd!
   " Wrap automatically at 80 chars for plain text files
   autocmd FileType txt,text,svn setlocal formatoptions+=t autoindent smartindent
   autocmd FileType nroff,groff setlocal paragraphs='IPLPPPQPP TPHPLIPpLpItpplpipbp'
   autocmd FileType gitcommit execute 'goto|setlocal spell foldmethod&|startinsert'
   autocmd FileType vim setlocal keywordprg=:help
   autocmd FileType json command! -range=% -nargs=* Tidy <line1>,<line2>! python -mjson.tool
   autocmd FileType html,htm,phtml,shtml,xhtml,xml,xsd
      \ imap <silent> <buffer> <localleader><localleader> <!--  --><left><left><left><left>|
      \ imap <silent> <buffer> <localleader>cs <!--<cr><cr>><left><up><space>|
      \ command! -range=% -nargs=* Tidy <line1>,<line2>! xmllint --format --recover - 2>/dev/null|
      \ command! DeleteTags %substitute:<[?%![:space:]]\@!/\=\_.\{-1,}[-?%]\@<!>::gc

   " html, server side includes
   " [49 1] [50 2] [51 3] [52 4] [53 5] [54 6] [97 a] [65 A] [101 e] [98 b] [115 s] [83 S] [108 l] [76 L] [100 d] [68 D] [112 p] [80 P] [116 t] [84 T] [104 h] [72 H]
   autocmd FileType html,htm,phtml,shtml,xhtml
      \ imap <silent> <buffer> <localleader>p <p><cr><cr></p><left><left><left><left><up><tab>|
      \ imap <silent> <buffer> <localleader>d <div><cr><cr></div><left><left><left><left><left><left><up><tab>|
      \ imap <silent> <buffer> <localleader>n <noscript><cr><cr></noscript><left><left><left><left><left><left><left><left><left><left><left><up><tab>|
      \ imap <silent> <buffer> <localleader>s <span></span><left><left><left><left><left><left><left>|
      \ imap <silent> <buffer> <localleader>li <li></li><left><left><left><left><left>|
      \ let b:surround_49  = "<h1>\r</h1>"|
      \ let b:surround_50  = "<h2>\r</h2>"|
      \ let b:surround_51  = "<h3>\r</h3>"|
      \ let b:surround_52  = "<h4>\r</h4>"|
      \ let b:surround_53  = "<h5>\r</h5>"|
      \ let b:surround_54  = "<h6>\r</h6>"|
      \ let b:surround_97  = "<a href=\"\" title=\"\">\r</a>"|
      \ let b:surround_65  = "<a href=\"\" title=\"\" class=\"\1Class: \1\">\r</a>"|
      \ let b:surround_101 = "<em>\r</em>"|
      \ let b:surround_98  = "<strong>\r</strong>"|
      \ let b:surround_115 = "<span>\r</span>"|
      \ let b:surround_83  = "<span class=\"\1Class: \1\">\r</span>"|
      \ let b:surround_108 = "<li>\r</li>"|
      \ let b:surround_76  = "<li class=\"\1Class: \1\">\r</li>"|
      \ let b:surround_100 = "<div>\r</div>"|
      \ let b:surround_68  = "<div class=\"\1Class: \1\">\r</div>"|
      \ let b:surround_112 = "<p>\r</p>"|
      \ let b:surround_80  = "<p class=\"\1Class: \1\">\r</p>"|
      \ let b:surround_116 = "<td>\r</td>"|
      \ let b:surround_84  = "<td class=\"\1Class: \1\">\r</td>"|
      \ let b:surround_104 = "<th>\r</th>"|
      \ let b:surround_72  = "<th class=\"\1Class: \1\">\r</th>"|
      \ setlocal include=--\\s*#\\s*include\\s*virtual=\\\|href=|
      \ setlocal includeexpr=substitute(v:fname,'^/','','')

   " Get highlighting for apache version 2.2
   autocmd FileType apache let apache_version = '2.2'
   autocmd FileType vim let vim_indent_cont = &shiftwidth
   autocmd FileType md,markdown
      \ onoremap <buffer> ih :<c-u>execute "normal! ?^==\\+$\r:nohlsearch\rkvg_"<cr>|
      \ onoremap <buffer> ah :<c-u>execute "normal! ?^==\\+$\r:nohlsearch\rg_vk0"<cr>

   " Comments: \\
   autocmd FileType c,cpp,java,javascript
      \ imap <silent> <buffer> <localleader><localleader> /*  */<left><left><left>

   " Comments: \cs
   autocmd FileType c,cpp,javascript
      \ imap <silent> <buffer> <localleader>cs /*<cr><cr>/<left><up><space>

   " Comments: \cs
   autocmd FileType java
      \ imap <silent> <buffer> <localleader>cs /**<cr><cr>/<left><up><space>

   " autocmd FileType c
   " " imap <silent> <buffer> <localleader>p printf("\n");<left><left><left><left><left>

   autocmd FileType cpp
      \ imap <silent> <buffer> <localleader>p cout << '' << endl;<left><left><left><left><left><left><left><left><left><left>

   " For shell scripts, use bash syntax not sh
   autocmd FileType sh
      \ let g:is_bash = 1

   " the letter c is used for surrounding
   autocmd FileType ruby
      \ imap <silent> <buffer> <localleader>p puts ''<left>|
      \ let b:surround_99 = "=begin \r =end"

   " To be improved
   autocmd FileType perl
      \ setlocal makeprg=perl\ -c\ %\ $*|
      \ setlocal errorformat=%m\ at\ %f\ line\ %l.

   " [49 1] [50 2] [51 3] [98 b] [101 e] [108 l] [109 m] [77 M] [69 E] [100 d] [112 p]
   autocmd FileType tex
      \ let b:surround_49  = "\\section{\r}"                              |
      \ let b:surround_50  = "\\subsection{\r}"                           |
      \ let b:surround_51  = "\\subsubsection{\r}"                        |
      \ let b:surround_98  = "\\textbf{\r}"                               |
      \ let b:surround_101 = "\\emph{\r}"                                 |
      \ let b:surround_108 = "\\\1command: \1{\r}"                        |
      \ let b:surround_109 = "\\begin{math} \r \\end{math}"               |
      \ let b:surround_77  = "\\begin{math}\\displaystyle \r \\end{math}" |
      \ let b:surround_69  = "\\begin{equation} \r \\end{equation}"       |
      \ let b:surround_100 = "\\begin{displaymath} \r \\end{displaymath}" |
      \ let b:surround_112 = "\\left( \r \\right)"                        |
      \ iabbrev latex \latex{}
augroup END

augroup RC_GRP_SYNTAX
   autocmd!
   autocmd Syntax tex
      \ syntax region texFold start=/\\section{.\{-}}/ end=/\\section{.\{-}}/ transparent fold
   " autocmd Syntax html,htm,phtml,shtml,xhtml
   "    \ syntax clear htmlLink
   "    \ syntax region htmlLink start=/<a\_[[:space:]]\+\_[^>]\{-}\<href\_.\{-}>\_[[:space:]]*/hs=e+1 end="\_[[:space:]]*</a>"he=s-1 contains=@Spell,htmlTag,htmlEndTag,htmlSpecialChar,htmlPreProc,htmlComment,javaScript,@htmlPreproc
augroup END

augroup RC_GRP_POSITION
   autocmd!
   " Jump to the last spot the cursor was at in a file when reading it
   autocmd BufReadPost *
      \ if line("'\"") > 0 && line("'\"") <= line('$') && &filetype != 'gitcommit' |
      \ execute 'normal! g`"' |
      \ endif

   " When reading a file, :cd to its parent directory unless it's a help
   " file. This replaces 'autochdir which doesn't work properly.
   autocmd BufEnter * if &filetype != 'help' | silent! cd %:p:h | endif
augroup END

augroup RC_GRP_MISC
   autocmd!
   " Delete EOL white spaces
   autocmd BufWritePre * if &ft != 'markdown' | silent! %s/\s\+$//e | endif
augroup END