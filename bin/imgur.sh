#!/usr/bin/env bash

tag="${*// /+}"
random_api_url="https://api.imgur.com/3/gallery/search/viral/0.json?q=title:$tag&q_type=gif"
gif_url="$(curl -s --header "Authorization: Client-ID $IMGUR_API_KEY" "$random_api_url" | jq '.data[0].link' -r)"
echo "Loading image: $gif_url ..."
echo "$gif_url" | pbcopy
curl "$gif_url" 2> /dev/null | imgcat
