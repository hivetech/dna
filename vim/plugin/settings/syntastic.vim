"mark syntax errors with :signs
let g:syntastic_enable_signs=1
"automatically jump to the error when saving the file
let g:syntastic_auto_jump=1
"show the error list automatically
let g:syntastic_auto_loc_list=0
"don't care about warnings
let g:syntastic_quiet_messages = {'level': 'warnings'}

let g:syntastic_python_checker_args='--ignore=E501,E126,E221,E251,E127,W404,E128,E122,E203,W402,E272,E702,F403'
