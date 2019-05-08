jr() {
    ISSUES=$(jira list --query="project = POOL order by lastViewed DESC")
    echo $ISSUES | fzf --no-sort --reverse \
                       --preview='jira view $(echo {} | cut -d ':' -f 1)' \
                       --header "enter to view, ctrl-o to open in browser" \
                       --bind 'enter:execute(ISSUE=$(echo {} | cut -d ':' -f 1); jira view $ISSUE | less)' \
                       --bind 'ctrl-o:execute(ISSUE=$(echo {} | cut -d ':' -f 1); jira browse $ISSUE)' \
                       --preview-window=down:60%
}

jbr() {
    ISSUE_CODE=$(_jira_select_issue)
    ISSUE_DESCRIPTION=$(jira view $ISSUE_CODE | grep "summary:" | cut -d ':' -f 2)
    NON_LETTERS_OR_DIGITS="/[^A-Za-z0-9._-]/"
    NORMALIZED_DESCRIPTION=$(echo $ISSUE_DESCRIPTION | awk '{$1=$1};1' | awk '{gsub('$NON_LETTERS_OR_DIGITS',"-");print}')
    BRANCH=$ISSUE_CODE"-rafa-"$NORMALIZED_DESCRIPTION
    git checkout develop && git pull && git branch $BRANCH && git checkout $BRANCH
}
