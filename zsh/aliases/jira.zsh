jr() {
  ISSUES=$(jira list --query="project = POOL order by lastViewed DESC")
  echo $ISSUES | fzf --no-sort --reverse \
    --preview='jira view $(echo {} | cut -d ':' -f 1)' \
    --header "enter to view, ctrl-o to open in browser" \
    --bind 'enter:execute(ISSUE=$(echo {} | cut -d ':' -f 1); jira view $ISSUE | less)' \
    --bind 'ctrl-o:execute(ISSUE=$(echo {} | cut -d ':' -f 1); jira browse $ISSUE)' \
    --preview-window=down:60%
  }

start_ticket() {
  ISSUES=$(jira list --query="project = POOL AND status = groomed AND assignee IS empty")
  ISSUE_LINE=$(echo $ISSUES | fzf --no-sort --reverse \
          --preview='jira view $(echo {} | cut -d ':' -f 1)' \
          --header "ctrl-v to view / ctrl-o to open in browser" \
          --bind 'ctrl-o:execute(ISSUE=$(echo {} | cut -d ':' -f 1); jira browse $ISSUE)' \
          --bind 'ctrl-v:execute(jira view $(echo {} | cut -d ':' -f 1)' \
          --preview-window=down:80%)
  ISSUE_CODE=$(echo $ISSUE_LINE | cut -d ':' -f 1)
  ISSUE_DESCRIPTION=$(echo $ISSUE_LINE | cut -d ':' -f 2)
  NON_LETTERS_OR_DIGITS="/[^A-Za-z0-9._-]/"
  NORMALIZED_DESCRIPTION=$(echo $ISSUE_DESCRIPTION | awk '{$1=$1};1' | awk '{gsub('$NON_LETTERS_OR_DIGITS',"-");print}')
  BRANCH=$ISSUE_CODE"-rafa-"$NORMALIZED_DESCRIPTION
  git checkout develop && git pull && git branch $BRANCH && git checkout $BRANCH
  jira assign $ISSUE_CODE
  jira transition assigned  $ISSUE_CODE
}
