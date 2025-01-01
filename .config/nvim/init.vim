call plug#begin(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/plugged"'))
Plug 'jreybert/vimagit'
call plug#end()

let g:python3_host_prog = '/usr/bin/python3'
