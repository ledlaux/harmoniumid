#! /bin/sh 


fluidsynth -a alsa -z 160 -m alsa_raw -o midi.alsa.device=hw:2,0 -g 1 /home/pi/filename.sf2 sleep 10

