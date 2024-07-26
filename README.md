# MIDI HARMONIUM MADE WITH FLUIDSYNTH


In search for the best free sounding harmonium virtual instrument i found **N'hyra Virakah** recorded harmonium in Decent sampler format:
https://www.youtube.com/watch?v=6j1xUndPMio&t=785s

Than idea arised to try to convert this decent sampler preset and try it with Fluidsynth.


**Instructions:**

1. Download harmonium Decent sampler preset from
https://www.patreon.com/posts/indian-harmonium-90825095

2. Convert the preset to SFZ format with DSconverter by Eodowd
https://github.com/eodowd/ds2sfz

3. At this point you can edit attack and decay of the samples in Polyphone app

3. Convert SFZ file to SF2 soundfont. You can use Sforzando or Polyphone to do that.
I used Polyphone console command
/Applications/polyphone.app/Contents/MacOS/polyphone -1 filename.sfz -d /Users/user -o filename     

Thats it! 

Now you can load this instrument in to the Fluidsynth and play it. To make a portable harmonium instrument to exercise with headphones you can use it with Android Fluidsynth app and midi keyboard conected to you phone.

This instrument has some additional settings which can be asigned to midi keyboard: volume (CC 7), reverb (CC 91), chorus (CC 93)


## A prototype of midi harmonium on Raspberry pi zero w2 

I had a raspberry pi 0 w2 laying around so next idea came to test this instrument on it, and it worked wonderfully!


**You will need:**

 - Raspbery pi 0 w2 with power adapter or powerbank

 - Usb hub

 - Any compact usb soundcard or hdmi vga adapter cable with audio out (I could not make raspbery pi audio out to work with my adapter cable so used the sound card. Maybe with different cable it will work, try it. Than will be no need for a usb hub)
 
 - 3.5mm audio cable to connect to speakers if needed

 - Microusb to usb cable adapter (otg cable)

 - Midi keyboard

For this project M-audio Keystation Mini 32 MK3 is perfect because it is compact, not expensive, the key range is enough, also you can edit velocity and midi cc on the device itself.


**Instructions:**

1. Install Raspbian Lite OS in headless mode with SSH (instruction could be found in internet)

2. Updade the system
   sudo apt update 

4. edit /boot/config.txt
  To disable raspbery pi default sound card
  put dtparam=audio=off

5. Add user pi to audio group
  usermod -a -G audio pi

6. Adjust your default soundcard in alsa configuration file
  sudo nano /etc/asound.conf

  Put 
  defaults.pcm.card 1
  defaults.ctl.card 1

6. Install Fluidsynth
  sudo apt-get install fluidsynth

7. Copy SF2 soundfont file to the Raspberry pi home directory

8. Copy script **harmonium.sh** file to your home directory /home/pi
  It is simple scipt which starts Fluidsynth with harmonium soundfont and your midi keyboard
  
  #! /bin/sh
  fluidsynth -a alsa -z 160 -m alsa_raw -o midi.alsa.device=hw:2,0 -g 1 /home/pi/filename.sf2
  sleep 10

  Adjust the sample rate with -z parameter (minimal i could use without audio distortion and much of latency was 160)
  Adjust gain with -g parameter

9. Test midi keyboard connection to get a device name
  amidi -l 

10. Adjust midi device number in harmonium.sh
  nano ./harmonium.sh
  midi.alsa.device=hw:2,0
  Give execute permission to your script: chmod +x /home/pi/harmonium.sh

11. Add Fluidsynth harmonium to start on boot
  nano ~/bashrc
  Add to the end of file ./harmonium.sh

12. Make raspbery pi sd card read-only with raspi-config settings

13. Restart and enjoy!

PS. Loading time of the instrument can take up to 1 minute, because of the raspbery pi 0 limited resources. 
You can make it load little faster by some tweaks (disabling bluetooth in /boot/config.txt. and other)

**Send thanks to the N'hyra Virakah for a great harmonium recording and programming!** 

**ॐ**








