jr() {
  jira $(git branch | sed -n '/* /s///p' | sed -n '/PFM/p' | awk -F. '{ print $1 }')
}
