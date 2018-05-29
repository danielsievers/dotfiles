setlocal tabstop=2
setlocal shiftwidth=2
map <F3> :e %:p:s,.h$,.X123X,:s,.cc$,.h,:s,.X123X$,.cc,<CR>
