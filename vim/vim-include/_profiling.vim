function! StartProfiling()
  :profile start vim-profiling.log
  :profile file *
  :profile func *
  echo 'profiling is started. log file: vim-profiling.log'
endfunction

function! StopProfiling()
  :profile stop
  echo 'profiling is stopped. log file: vim-profiling.log'
endfunction
