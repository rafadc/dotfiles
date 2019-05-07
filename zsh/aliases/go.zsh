alias gtest="go test \$(go list ./... | grep -v /vendor/) -tags=integration"
