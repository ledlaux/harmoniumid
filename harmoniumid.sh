#! /bin/sh 

# Disconnect all previous midi connections
aconnect -x

# Run fluidsynth with small delay to allow passing of the booting process

fluidsynth -a alsa -z 160 -m alsa_raw -o midi.alsa.device=hw:2,0 -g 1 /home/pi/harmoniumid.sf2 

sleep 10

