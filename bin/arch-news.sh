#!/bin/env bash

rsstail -1 -p -u 'https://www.archlinux.org/feeds/news/' | head -n 2
