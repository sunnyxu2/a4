#stopwords=`echo $(cat STOPWORDS.txt) | sed -r 's/ /|/g' | tr '[:upper:]' '[:lower:]'`
temptext=$(mktemp)
tempstat=$(mktemp)
exec 3>"$temptext"
exec 4>"$tempstat"
awk '{print}' $1 | cut -f $2 | sed -r 's/\b\w{1,2}\b//g' | awk '!/<(\/)*[a-z]+(\s)*(\/)*>/' | sed -r 's/(@([A-Za-z0-9]*))//g' | tr -d '[:punct:]' | tr '[:upper:]' '[:lower:]' | sed -r 's/(ing\b)|(ed\b)|(s\b)|(es\b)|\b(a(\s)+|the(\s)?|about(\s)?|actually(\s)?|almost(\s)?|also(\s)?|although(\s)?|always(\s)?|am(\s)?|an(\s)?|and(\s)?|any(\s)?|are(\s)?|as(\s)?|at(\s)?|be(\s)?|became(\s)?|become(\s)?|but(\s)?|by(\s)?|can(\s)?|could(\s)?|did(\s)?|do(\s)?|does(\s)?|each(\s)?|either(\s)?|else(\s)?|for(\s)?|from(\s)?|had(\s)?|has(\s)?|have(\s)?|hence(\s)?|how(\s)?|i(\s)?|if(\s)?|in(\s)?|is(\s)?|it(\s)?|its(\s)?|just(\s)?|may(\s)?|maybe(\s)?|me(\s)?|might(\s)?|mine(\s)?|must(\s)?|my(\s)?|mine(\s)?|must(\s)?|my(\s)?|neither(\s)?|nor(\s)?|not(\s)?|of(\s)?|oh(\s)?|ok(\s)?|when(\s)?|where(\s)?|whereas(\s)?|wherever(\s)?|whenever(\s)?|whether(\s)?|which(\s)?|while(\s)?|who(\s)?|whom(\s)?|whoever(\s)?|whose(\s)?|why(\s)?|will(\s)?|with(\s)?|within(\s)?|without(\s)?|would(\s)?|yes(\s)?|yet(\s)?|you(\s)?|your)\b//g' | sed -r 's/http(([A-Za-z0-9]*))//g' > $temptext
awk '{print}' $1 | cut -f $2 --complement $line > $tempstat
paste -d "\t" $tempstat $temptext
rm "$temptext"
rm "$tempstat"


