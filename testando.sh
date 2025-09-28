curl -s 'https://wttr.in/' \
-H "Accept-Language: pt-br" \
-H 'user-agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36' > previsao.html

current=$(cat previsao.html)

title=$(echo "$current" | pup 'title text{}')

current_weather=$(echo "$current" | sed -n '/<pre>/,/<\/pre>/p' | sed '/┌/q' | grep -oP '<span class="ef226">.*?</span>.*' \
    | head -n 1 \
    | sed -E 's/<span class="ef226">.*?<\/span>//' \
    | xargs)

current_temperature=$(echo "$current" | pup 'pre span.ef214 text{}' | head -n 1)

termic_sensation=$(echo "$current" | pup 'pre span.ef202 text{}' | head -n 1)

echo "$title"

echo "$current_weather"

echo "Temperatura: $current_temperature ºC"

echo "Sensação térmica : $termic_sensation ºC"