#!/bin/bash
#==
#   NOTE      - grep_screenshot.sh
#   Author    - Aru
#
#   Created   - 2023.05.17
#   Github    - https://github.com/aruyu
#   Contact   - vine9151@gmail.com
#/



function error_exit()
{
  notify-send --urgency critical "Scrot" "Canceled to capture Grep ScreenShot." --icon="accessories-screenshot"
  exit 1
}


TIME=`date +%b%d_%H%M%S`
SAVE_DIR=~/Pictures/

if [[ ! -d "${SAVE_DIR}" ]]; then
  mkdir ${SAVE_DIR}
fi

grim -g "$(slurp)" ${SAVE_DIR}${TIME}.png || error_exit
notify-send --urgency low "Scrot" "Grep ScreenShot successfully saved to\n${SAVE_DIR}${TIME}.png." --icon="accessories-screenshot"
