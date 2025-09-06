#!/usr/bin/env bash
# Usage:
#   ./allergies.sh <flags> list
#   ./allergies.sh <flags> allergic_to <item>

set -u

flags="$1"
cmd="$2"
item="${3:-}"

flags=$((flags % 256))

allergies=(
  "cats:128"
  "pollen:64"
  "chocolate:32"
  "tomatoes:16"
  "strawberries:8"
  "shellfish:4"
  "peanuts:2"
  "eggs:1"
)

list_allergies() {
  local f="$1"
  local kv name bit
  local -a lst=()
  for kv in "${allergies[@]}"; do
    IFS=':' read -r name bit <<< "$kv"
    if (( bit <= f )); then
      lst=("$name" "${lst[@]}")
      f=$((f - bit))
    fi
  done

  if (( ${#lst[@]} )); then
    printf "%s" "${lst[0]}"
    for ((i=1; i<${#lst[@]}; i++)); do
      printf " %s" "${lst[i]}"
    done
    printf "\n"
  fi
}

case "$cmd" in
  list)
    list_allergies "$flags"
    ;;
  allergic_to)
    # get space-separated list (may be empty)
    items="$(list_allergies "$flags")"
    found="false"
    for name in $items; do
      if [ "$name" = "$item" ]; then
        found="true"
        break
      fi
    done
    printf "%s\n" "$found"
    ;;
esac
