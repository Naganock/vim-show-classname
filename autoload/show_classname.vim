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
  let is_hit = match(line, "class [a-zA-Z]*")
  if is_hit == 0
    call add(match_str, [line_number, matchstr(line, "class [a-zA-Z]*")])
  endif
endfor

"echo match_str

let result_list = []
for str in match_str
  let hikizan = line(".") - str[0]
  let str[0] = hikizan
  call add(result_list, [str[0], str[1]])
endfor

echo result_list

let tmp = 100000000000000000000000000
for result in result_list
  if tmp > result[0] && result[0] > 0
    let tmp = result[0]
    let class_name = result[1]
  endif
endfor
echo class_name


"command! ExecTest call Exec_test()
