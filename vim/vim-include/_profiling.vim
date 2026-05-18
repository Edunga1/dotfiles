function! StartProfiling()
  let s:profiling_logfile = printf('vim-profiling-%s.log', strftime('%Y%m%d-%H%M%S'))
  execute 'profile start ' . fnameescape(s:profiling_logfile)
  profile file *
  profile func *
  echo 'profiling is started. log file: ' . s:profiling_logfile
endfunction

function! StopProfiling()
  profile stop
  echo 'profiling is stopped.'
endfunction
