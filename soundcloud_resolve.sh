URL='http://api.soundcloud.com/resolve.json?url='$1'&client_id='$SOUNDCLOUD_KEY

curl -L $URL | ruby -rjson -e 'print JSON.pretty_generate(JSON.parse(STDIN.read))'
