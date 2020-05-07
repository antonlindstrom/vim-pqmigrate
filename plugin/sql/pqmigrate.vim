function! sql#pqmigrate#Switch(bang, cmd) abort
	let file = expand('%')
	if empty(file)
		echo "No file provided"
		return
	elseif file =~# '^\f\+.down\.sql$'
		let l:root = split(file, '.down.sql$')[0]
		let l:alt_file = l:root . ".up.sql"
	elseif file =~# '^\f\+.up\.sql$'
		let l:root = split(file, ".up.sql$")[0]
		let l:alt_file = l:root . '.down.sql'
	else
		echo "File is not a pqmigrate file"
		return
	endif
	if !filereadable(alt_file) && !bufexists(alt_file) && !a:bang
		echo "Could not read file " . alt_file
		return
	elseif empty(a:cmd)
		execute ":edit " . alt_file
	else
		execute ":" . a:cmd . " " . alt_file
	endif
endfunction
