#!/bin/bash

# author: Carlos Suarez F - https://github.com/crsuarez

which curl > /dev/null && which grep > /dev/null || echo "Missing curl or grep, exiting"

what=$1
test $what || what=$(< /dev/stdin)
result=$(curl -G -s --data-urlencode "q=$what" 'http://ajax.googleapis.com/ajax/services/search/web?v=1.0')
how="$(echo $result | grep -oP '"estimatedResultCount":"\K(\d+)')"
if [[ $how -gt 0 ]]; then
  echo "[+] 0 - Results found. String is indexed by Google."
else
  echo "[-] $how - Zero results. String not indexed by Google."
fi
