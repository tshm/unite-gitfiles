let s:save_cpo = &cpo
set cpo&vim

let s:source = {
\   'name': 'gitlsfiles',
\   'description': 'candidates from "git ls-files"',
\ }

function! unite#sources#gitlsfiles#define() "{{{
  return [s:source]
endfunction "}}}

function! s:source.gather_candidates(args, context) "{{{
	let lines = split(system("git ls-files"), '\n')

  return map(lines, '{
  \   "word": v:val,
  \   "source": "gitlsfiles",
  \   "kind": "file",
  \   "action__path": v:val,
  \ }')
endfunction "}}}

let &cpo = s:save_cpo
unlet s:save_cpo

" vim: foldmethod=marker

