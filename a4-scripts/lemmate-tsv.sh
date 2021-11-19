for FILE in $1/*.txt
do
	#stopwords=`echo $(cat STOPWORDS.txt) | sed -r 's/ /|/g' | tr '[:upper:]' '[:lower:]'`
	text=`cut -f $3 $FILE | sed -r 's/\b\w{1,2}\b//g' | awk '!/<(\/)*[a-z]+(\s)*(\/)*>/' | tr -d '[:punct:]' | tr '[:upper:]' '[:lower:]' | sed -r 's/(\b\w{1,2}\b)|(ing\b)|(ed\b)|(s\b)|(es\b)|\b(a(\s)+|about(\s)?|actually(\s)?|almost(\s)?|also(\s)?|although(\s)?|always(\s)?|am(\s)?|an(\s)?|and(\s)?|any(\s)?|are(\s)?|as(\s)?|at(\s)?|be(\s)?|became(\s)?|become(\s)?|but(\s)?|by(\s)?|can(\s)?|could(\s)?|did(\s)?|do(\s)?|does(\s)?|each(\s)?|either(\s)?|else(\s)?|for(\s)?|from(\s)?|had(\s)?|has(\s)?|have(\s)?|hence(\s)?|how(\s)?|i(\s)?|if(\s)?|in(\s)?|is(\s)?|it(\s)?|its(\s)?|just(\s)?|may(\s)?|maybe(\s)?|me(\s)?|might(\s)?|mine(\s)?|must(\s)?|my(\s)?|mine(\s)?|must(\s)?|my(\s)?|neither(\s)?|nor(\s)?|not(\s)?|of(\s)?|oh(\s)?|ok(\s)?|when(\s)?|where(\s)?|whereas(\s)?|wherever(\s)?|whenever(\s)?|whether(\s)?|which(\s)?|while(\s)?|who(\s)?|whom(\s)?|whoever(\s)?|whose(\s)?|why(\s)?|will(\s)?|with(\s)?|within(\s)?|without(\s)?|would(\s)?|yes(\s)?|yet(\s)?|you(\s)?|your)\b//g'`
	stats=`cut -f $3 --complement $FILE`	
	echo -e "$stats\t$text" | sed -r 's/-e //g' > $2/`basename $FILE .txt`.TRIMMED.txt
done
