#!/bin/bash
export SITE_CHECK="http://www.example.com"
export EXPECTED_TEXT="Example Domain"

INTERNET_DOWN=1

while [[ $INTERNET_DOWN ]]; do
  if [[ "$(curl -s $SITE_CHECK | grep "$EXPECTED_TEXT")" ]]; then
    INTERNET_DOWN=0
    break
  fi
  sleep 10s
done

for i in 1 2 3 4 5 ; do
  if [[ $i = 1 ]]; then
    termux-notification --sound -t "The internet is back"
  else
    termux-tts-speak "The internet is back"
  fi
  sleep 5s
done
