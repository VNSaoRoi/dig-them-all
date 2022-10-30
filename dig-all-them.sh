#!/bin/sh

echo '
______  ___ _______     _______ ___     ___         _______ __   __ _______ ____ 
|      ||   |       |   |   _   |   |   |   |       |       |  | |  |       |  |_|  |
|  _    |   |    _______|  |_|  |   |   |   |       |_     _|  |_|  |    ___|       |
| | |   |   |   | _|____|       |   |   |   |         |   | |       |   |___|       |
| |_|   |   |   ||  |   |       |   |___|   |___      |   | |       |    ___|       |
|       |   |   |_| |   |   _   |       |       |_____|   | |   _   |   |___| ||_|| |
|______||___|_______|   |__| |__|_______|_______|_____|___| |__| |__|_______|_|   |_|

'


if test "$1" = "" || test "$2" = "" || test "$3" = "" ;
then
        echo '

	./dig-all-them.sh [dns-type] [domain list] [where-to-save]  
        
		dns-type: a,any,txt,axfr,...
		domain list: list of domain use want to dig
'
        exit
fi



while read source ; do dig $1 $source | egrep "([0-9]{1,3}[.]){3}[0-9]{1,3}"| egrep -v refused. ;done < $2 | tee $3
