#!/bin/bash

nm-online && curl ifconfig.co/json | jq -r '"\(.latitude):\(.longitude)"' | xargs -I{} redshift -l {}
