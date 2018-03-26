" Author: Michel Lang <michellang@gmail.com>, w0rp <devw0rp@gmail.com>
" Description: This file adds support for checking R code with lintr.

function! ale_linters#r#lintr#GetCommand(buffer) abort
    return ale#path#BufferCdString(a:buffer)
    \   . 'Rscript -e ' . ale#Escape('lintr::lint(commandArgs(TRUE), lintr::with_defaults(line_length_linter = lintr::line_length_linter(120), assignment_linter = NULL, camel_case_linter = NULL, snake_case_linter = NULL, commented_code_linter = NULL, trailing_whitespace_linter = NULL, absolute_paths_linter = NULL, commas_linter = NULL, closed_curly_linter = NULL))') . ' %t'
endfunction

call ale#linter#Define('r', {
\   'name': 'lintr',
\   'executable': 'Rscript',
\   'command_callback': 'ale_linters#r#lintr#GetCommand',
\   'callback': 'ale#handlers#gcc#HandleGCCFormat',
\   'output_stream': 'both',
\})
