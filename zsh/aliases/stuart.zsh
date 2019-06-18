#!/usr/bin/env zsh

function start_ticket() {
  ISSUES=$(jira list --query="project = POOL AND status = groomed AND assignee IS empty")
  ISSUE_LINE=$(echo $ISSUES | fzf --no-sort --reverse \
          --preview='jira view $(echo {} | cut -d ':' -f 1)' \
          --header "ctrl-v to view / ctrl-o to open in browser" \
          --bind 'ctrl-o:execute(ISSUE=$(echo {} | cut -d ':' -f 1); jira browse $ISSUE)' \
          --bind 'ctrl-v:execute(jira view $(echo {} | cut -d ':' -f 1)' \
          --preview-window=down:80%)
  if [ $? -eq 130 ] 
  then
    return
  fi
  ISSUE_CODE=$(echo $ISSUE_LINE | cut -d ':' -f 1)
  ISSUE_DESCRIPTION=$(echo $ISSUE_LINE | cut -d ':' -f 2)
  NON_LETTERS_OR_DIGITS="/[^A-Za-z0-9._-]/"
  NORMALIZED_DESCRIPTION=$(echo $ISSUE_DESCRIPTION | awk '{$1=$1};1' | awk '{gsub('$NON_LETTERS_OR_DIGITS',"-");print}')
  BRANCH=$ISSUE_CODE"-rafa-"$NORMALIZED_DESCRIPTION
  git checkout develop && git pull && git branch $BRANCH && git checkout $BRANCH
  jira assign $ISSUE_CODE "r.decastro"
  jira transition --noedit Start $ISSUE_CODE
}

function review_ticket() {
  ISSUES=$(jira list --query="project = POOL AND status = 'Ready for review' AND assignee IS empty")
  ISSUE_LINE=$(echo $ISSUES | fzf --no-sort --reverse --exit-0 \
          --preview='jira view $(echo {} | cut -d ':' -f 1)' \
          --header "ctrl-v to view / ctrl-o to open in browser" \
          --bind 'ctrl-o:execute(ISSUE=$(echo {} | cut -d ':' -f 1); jira browse $ISSUE)' \
          --bind 'ctrl-v:execute(jira view $(echo {} | cut -d ':' -f 1)' \
          --preview-window=down:80%)
  if [ $? -eq 130 ] 
  then
    return
  fi
  ISSUE_CODE=$(echo $ISSUE_LINE | cut -d ':' -f 1)
  jira assign $ISSUE_CODE "r.decastro"
  jira transition --noedit Start $ISSUE_CODE
}

close_ticket() {
        # TODO: This has yet to check for jenkins tests and code climate
        CURRENT_BRANCH=$(git branch | sed -n '/\* /s///p')
        ISSUE_CODE=$(echo $CURRENT_BRANCH | awk -F '-rafa-' '{$0=$1}1')
        jira transition --noedit "Ask for code review" $ISSUE_CODE
}

alias standup_edit="vi ~/code/stuart/standup.md"

function standup() {
        echo "😎 Standup\n"
        cat ~/code/stuart/standup.md
        echo "\n\n"
        echo "🤖 My Issues\n"
        jira list --query "assignee = 'r.decastro'"
}
