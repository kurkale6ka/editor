if filereadable($VIMRUNTIME . '/keymap/bulgarian-phonetic.vim')

    source $VIMRUNTIME/keymap/bulgarian-phonetic.vim
else
    source $VIMRUNTIME/keymap/bulgarian.vim
endif

set spelllang=bg

let b:keymap_name = "бг"

lmap <buffer> v  в
lmap <buffer> V  В
lmap <buffer> w  ж
lmap <buffer> W  Ж
lmap <buffer> y  у
lmap <buffer> Y  У
lmap <buffer> x  х
lmap <buffer> X  Х
lmap <buffer> 4  ч
lmap <buffer> $  Ч
lmap <buffer> 6  ш
lmap <buffer> ^  Ш
lmap <buffer> 7  щ
lmap <buffer> 6t щ
lmap <buffer> &  Щ
lmap <buffer> ^t Щ
lmap <buffer> ^T Щ
lmap <buffer> ]  ъ
lmap <buffer> }  Ъ
lmap <buffer> [  ь
lmap <buffer> {  Ь
lmap <buffer> 1  ю
lmap <buffer> !  Ю

iabbrev абв абвгдежзийклмнопрстуфхцчшщъьюя<cr>АБВГДЕЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЬЮЯ
