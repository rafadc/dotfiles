#!/usr/bin/env zsh
gif() {
    IMAGES="$(curl -s --header 'Authorization: Client-ID df22b9c46aa3aaa' 'https://api.imgur.com/3/gallery/search/viral/0.json?q=title:cucumber&q_type=gif' | jq '.data[] | .link')"
    echo $IMAGES | fzf --no-sort --reverse --no-bold \
                       --preview='curl "http://i.imgur.com/LmvYayBh.gif" 2> /dev/null | imgcat' \
                       --preview-window=down:60%
}
