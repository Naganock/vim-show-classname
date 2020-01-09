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

function! show_classname#Get_class()
  let line_list = getline(0,'$')
  let line_number = 0
  let match_str = []
  for line in line_list
    let line_number += 1
    let is_hit = match(line, "class [a-zA-Z]*")
    if is_hit == 0
      let hikizan = line(".") - line_number
      call add(match_str, [hikizan, matchstr(line, "class [a-zA-Z]*")])
    endif
  endfor

  let class_name = 0
  let tmp = 100000000000000000000000000
  for result in match_str
    if tmp > result[0] && result[0] >= 0
      let tmp = result[0]
      let class_name = result[1]
    endif
  endfor
  if class_name == 0
    echo class_name
    return class_name
  else
    echo split(class_name, " ")[1]
    return split(class_name, " ")[1]
  endif
endfunction
