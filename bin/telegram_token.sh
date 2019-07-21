#!/bin/bash

TOKEN=$1
curl -sS "https://api.telegram.org/bot$TOKEN/getUpdates" | jq
