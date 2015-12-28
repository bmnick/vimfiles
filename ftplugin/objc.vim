AlignCtrl =Irlp0P0

nnoremap <leader>mj ?[<CR>v%J
nnoremap <leader>ms ?[<CR>f ;:set paste<CR>r<CR>:s/ /\r/g<CR>?[<CR>v%:Align :<CR>:set nopaste<CR>
nnoremap <D-r> :!buck install --run orca
nnoremap <D-b> :!buck build orca
nnoremap <leader>xc :!buck project orca --without-tests && open ~/local/fbsource-fbobjc/fbobjc/Apps/FBMessenger/FBMessenger.xcodeproj

setlocal iskeyword=a-z,A-Z,48-57,_,.,-,>,#

nmap <leader>h :A<CR>

" add a definition for Objective-C to tagbar
let g:tagbar_type_objc = {
    \ 'ctagstype' : 'ObjectiveC',
    \ 'kinds'     : [
        \ 'i:interface',
        \ 'I:implementation',
        \ 'p:Protocol',
        \ 'm:Object_method',
        \ 'c:Class_method',
        \ 'v:Global_variable',
        \ 'F:Object field',
        \ 'f:function',
        \ 'p:property',
        \ 't:type_alias',
        \ 's:type_structure',
        \ 'e:enumeration',
        \ 'M:preprocessor_macro',
    \ ],
    \ 'sro'        : ' ',
    \ 'kind2scope' : {
        \ 'i' : 'interface',
        \ 'I' : 'implementation',
        \ 'p' : 'Protocol',
        \ 's' : 'type_structure',
        \ 'e' : 'enumeration'
    \ },
    \ 'scope2kind' : {
        \ 'interface'      : 'i',
        \ 'implementation' : 'I',
        \ 'Protocol'       : 'p',
        \ 'type_structure' : 's',
        \ 'enumeration'    : 'e'
    \ }
\ }
