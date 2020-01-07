function! Get_func_name()
  ?\vdef\stest_[a-z]*
  return split(split(getline('.'), " ")[1], "(")[0]
endfunction

function! Get_class_name()
  ?\vclass\s[a-zA-Z]*
  return split(split(getline('.'), " ")[1], "(")[0]
endfunction

function! Get_class_name_test()
  return getline(0,'$')
endfunction

let line_list = Get_class_name_test()
let line_number = 0
let match_str = []
for line in line_list
  let line_number += 1
  let is_hit = match(line, "function")
  if is_hit == 0
    call add(match_str, [line_number, matchstr(line, "function!")])
  endif
endfor

echo match_str

"command! ExecTest call Exec_test()
