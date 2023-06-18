#!/usr/bin/env python3

import subprocess
import sys
from time import sleep
import json

progress = 0
max_len = 20

while(True):
  data = {}

  now_playing = subprocess.check_output(['mpris-ctl', 'info', '%artist_name - %track_name']).decode('utf-8').splitlines()
  if(len(now_playing) == 0):
    progress = 0
  else:
    now_playing = now_playing[0]
    data['text'] = "🎧 "

    if(len(now_playing) >= max_len):
      now_playing += ' *** '
      padding = progress + max_len
      data['text'] += now_playing[progress:padding]
      if(padding > len(now_playing)):
        padding = padding - len(now_playing)
        data['text'] += now_playing[0:padding]
    else:
      data['text'] += now_playing
    
    info = subprocess.check_output(['mpris-ctl', 'info', '%full']).decode('utf-8').split('\n')[0:15]
    data['tooltip'] = '\n'.join(info)

    progress += 1
    if(progress > len(now_playing)):
      progress = 0
  
  sys.stdout.write(json.dumps(data) + '\n')
  sys.stdout.flush()
  sleep(0.333)
