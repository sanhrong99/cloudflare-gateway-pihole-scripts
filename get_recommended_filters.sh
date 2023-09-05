#!/bin/bash

# create an empty input.csv file
touch input.csv

# declare an array of urls
urls=(
https://github.com/uBlockOrigin/uAssets/blob/master/filters/filters-2023.txt
https://github.com/AdguardTeam/AdguardFilters/blob/master/MobileFilter/sections/general_url.txt
https://github.com/AdguardTeam/AdguardFilters/blob/master/MobileFilter/sections/adservers.txt
https://github.com/AdguardTeam/AdguardFilters/blob/master/MobileFilter/sections/antiadblock.txt
https://easylist.to/easylist/easyprivacy.txt
https://easylist.to/easylist/easylist.txt
https://urlhaus-filter.pages.dev/urlhaus-filter-dnscrypt-blocked-names.txt
https://abpvn.com/vip/thantaibx.txt
)

# loop through the urls and download each file with curl
for url in "${urls[@]}"; do
  # get the file name from the url
  file=$(basename "$url")
  # download the file with curl and save it as file.txt
  curl -o "$file.txt" "$url"
  # append the file contents to input.csv and add a newline
  cat "$file.txt" >> input.csv
  echo "" >> input.csv
  # remove the file.txt
  rm "$file.txt"
done

# print a message when done
echo "Done. The input.csv file contains merged data from recommended filter lists."
