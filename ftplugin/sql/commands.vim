command! -bang PqMigrateAlternate call sql#pqmigrate#Switch(<bang>0, '')
command! -bang PqMigrateAlternateSplit call sql#pqmigrate#Switch(<bang>0, ':split')
