#!/usr/bin/env bash

[ "$(printf '%s' "$1" | tr '[:upper:]' '[:lower:]' | tr -cd 'a-z' | grep -o . | sort -u | wc -l)" -eq 26 ] && echo true || echo false
