if exists('g:loaded_showclass')
  finish
endif
let g:loaded_showclass = 1

augroup showclass
  autocmd!
  command! ShowClass call show_classname#Get_class()
augroup END
