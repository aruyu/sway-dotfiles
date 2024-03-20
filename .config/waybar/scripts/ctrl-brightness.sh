#!/bin/bash
#==
#   NOTE      - ctrl-brightness.sh
#   Author    - Aru
#
#   Created   - 2024.03.19
#   Github    - https://github.com/aruyu
#   Contact   - vine9151@gmail.com
#/



present=$(echo $(brightnessctl) | awk '{print $9}')

if [[ ${present} != *"100%"* ]]; then
  lightctl up
else
  lightctl down 95
fi
