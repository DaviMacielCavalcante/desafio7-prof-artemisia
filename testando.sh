
curl 'https://wttr.in/' -H 'user-agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36' > previsao.html

title=$(cat previsao.html | grep -oP '(?<=<title>).*(?=<\/title>)')

body=$(cat previsao.html | grep -oP '(?<=<body>).*(?=<\/body>)')

echo "Título: $title"

echo "Conteúdo do body: $body"

