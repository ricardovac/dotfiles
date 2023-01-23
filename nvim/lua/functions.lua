vim.cmd([[
" create file with subdirectories if needed :E
if !exists("g:E_loaded")
  let g:E_loaded = 1
  function s:MKDir(...)
    if         !a:0
          \|| stridx('`+', a:1[0])!=-1
          \|| a:1=~#'\v\\@<![ *?[%#]'
          \|| isdirectory(a:1)
          \|| filereadable(a:1)
          \|| isdirectory(fnamemodify(a:1, ':p:h'))
      return
    endif
    return mkdir(fnamemodify(a:1, ':p:h'), 'p')
  endfunction
  command -bang -bar -nargs=? -complete=file E :call s:MKDir(<f-args>) | e<bang> <args>
endif

" Rename buffer and file
command! -nargs=* -complete=file -bang Rename :call Rename("<args>", "<bang>")
function! Rename(name, bang)
    let l:curfile = expand("%:p")
    let l:newname = a:name
    let v:errmsg = ""
    silent! exe "saveas" . a:bang . " " . l:newname
    if v:errmsg =~# '^$\|^E329'
        if expand("%:p") !=# l:curfile && filewritable(expand("%:p"))
            silent exe "bwipe! " . l:curfile
            if delete(l:curfile)
                echoerr "Could not delete " . l:curfile
            endif
        endif
    else
        echoerr v:errmsg
    endif
endfunction
]])

-- Java functions
function get_spring_boot_runner(profile, debug)
  local debug_param = ""
  if debug then
    debug_param = ' -Dspring-boot.run.jvmArguments="-Xdebug -Xrunjdwp:transport=dt_socket,server=y,suspend=y,address=5005" '
  end 

  local profile_param = ""
  if profile then
    profile_param = " -Dspring-boot.run.profiles=" .. profile .. " "
  end

  return 'mvn spring-boot:run ' .. profile_param .. debug_param
end

function run_spring_boot(debug)
  vim.cmd('term ' .. get_spring_boot_runner(method_name, debug))
end

function attach_to_debug()
  local dap = require('dap')

  dap.configurations.java = {
    {
      type = 'java';
      request = 'attach';
      name = "Attach to the process";
      hostName = 'localhost';
      port = '5005';
    },
  }
  dap.continue()
end

-- run debug
function get_test_runner(test_name, debug)
  if debug then
    return 'mvn test -Dmaven.surefire.debug -Dtest="' .. test_name .. '"' 
  end
  return 'mvn test -Dtest="' .. test_name .. '"' 
end

function run_java_test_method(debug)
  local utils = require'plugins.dap'
  local method_name = utils.get_current_full_method_name("\\#")
  vim.cmd('term ' .. get_test_runner(method_name, debug))
end

function run_java_test_class(debug)
  local utils = require'plugins.dap'
  local class_name = utils.get_current_full_class_name()
  vim.cmd('term ' .. get_test_runner(class_name, debug))
end


