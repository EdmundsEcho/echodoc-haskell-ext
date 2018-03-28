"=============================================================================
" FILE: autoload/echodoc/haskell.vim
" AUTHOR:  Edmund Cape <Edmund.Cape at gmail.com>
" License: MIT license
"=============================================================================

" echodoc extension for Haskell to display the function type.
" Note: Hoogle does not seem to be a useful option given the extra space
"       required to display the findings.

function! echodoc#haskell#get() abort
  return s:doc_dict
endfunction

let s:doc_dict = {
      \ 'name' : 'haskell',
      \ 'rank' : 10,
      \ 'filetypes' : { 'haskell' : 1 },
      \ }
function! s:doc_dict.search(cur_text) abort
  if empty(get(v:, 'completed_item', {}))
    return []
  endif

  " The function name is not being used to conduct a search using Hoogle,
  " for instance.
  "
  " let id = matchstr(v:completed_item.word, '\p\+')
  " if id == ''
  "   return []
  " endif

  let doc = matchstr(v:completed_item.menu, '\p\+')
  if doc == ''
    return []
  endif

  return [{ 'text' : '', 'highlight' : g:echodoc#highlight_identifier },
        \ {'text': doc}]
endfunction
