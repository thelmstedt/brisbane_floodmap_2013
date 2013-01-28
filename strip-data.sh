#grep "Brisbane River Flood Forecast Report" 062850s.html | head -n 1 | grep -o "[^-]*"
#grep -oh metre *  -A 999999999 | grep Likely -B 2 -A 3 | sed 's/<br>//' | grep -v '\-\-' | awk 'ORS=NR%6?"~~":RS' > data.csv

rm -rf out
mkdir out
echo "geocode_address\tabove_high\tabove_low\ttime"
for x in input/*.html
do
   suburb=`grep "Brisbane River Flood Forecast Report" $x| head -n 1 | grep -o "[^-]*" | tr -d ' '`
   grep -oh metre $x  -A 999999999 | grep Likely -B 2 -A 3 | sed 's/<br>//' | grep -v '\-\-' | awk 'ORS=NR%6?"~~":RS' \
       | awk -v suburb="$suburb" -F"~~" '{ st=$2; if (st ~ /- [0-9]*$/) { split(st, a, "-"); st=a[1]} print st" "$1", "suburb", BRISBANE\t"$4"\t"$5"\t"$6 }'
       
done


