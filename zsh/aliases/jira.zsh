jr() {
  ISSUES=$(jira list --query="project = POOL order by lastViewed DESC")
  echo $ISSUES | fzf --no-sort --reverse \
    --preview='jira view $(echo {} | cut -d ':' -f 1)' \
    --header "enter to view, ctrl-o to open in browser" \
    --bind 'enter:execute(ISSUE=$(echo {} | cut -d ':' -f 1); jira view $ISSUE | less)' \
    --bind 'ctrl-o:execute(ISSUE=$(echo {} | cut -d ':' -f 1); jira browse $ISSUE)' \
    --preview-window=down:60%
  if [ $? -eq 130 ]
  then
    return
  fi

}
