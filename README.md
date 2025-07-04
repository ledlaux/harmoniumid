# Harmonium on Fluidsynth

In search for the best free sounding harmonium virtual instrument i found **N'hyra Virakah** recorded harmonium in Decent sampler format:
https://www.youtube.com/watch?v=6j1xUndPMio&t=785s

Then the idea arose to try to convert this Decent sampler preset for use with the Fluidsynth.
<br>
<br>
**Instructions:**
<br>
1. Download free harmonium Decent sampler preset from N'hyra Virakah patreon page<br>
https://www.patreon.com/posts/indian-harmonium-90825095

2. Convert Decent sampler preset to SF2 soundfont<br>
Use ConvertWithMoss app from https://www.mossgrabers.de/Software/ConvertWithMoss/ConvertWithMoss.html

Thats it! 

Now you can load this instrument in to the Fluidsynth and play it. To make a portable harmonium instrument to exercise with headphones you can use it with Android Fluidsynth app and midi keyboard connected to your phone.

This instrument has some additional settings which can be asigned to midi keyboard: volume (CC 7), sustain (CC 64), reverb (CC 91), chorus (CC 93)
<br>
<br>
## A prototype of Harmoniumid on Raspberry Pi Zero W

I had a raspberry Pi Zero laying around so next idea came to test this instrument on it, and it worked wonderfully!

**You will need:**
<br>
 - Raspberry Pi Zero W (or other Raspberry pi) with power adapter or powerbank

 - USB hub
 - Microusb to usb cable adapter (otg cable)
 - Usb soundcard and 3.5mm audio cable 
 - Midi keyboard

For this project M-audio Keystation Mini 32 MK3 is perfect because it is not expensive, the key range is good, also you can edit velocity on the device itself and there is transposition function.<br>
<br>
**Instructions:**
<br>
1. Install Raspbian Lite OS in headless mode with SSH (instruction could be found on the internet)

2. Updade the system<br>
   sudo apt update 

4. edit /boot/config.txt to disable raspbery pi default sound card<br>
  put dtparam=audio=off<br>

5. Add user pi to audio group<br>
  usermod -a -G audio pi

6. Adjust your default soundcard in alsa configuration file
  sudo nano /etc/asound.conf<br> 
  defaults.pcm.card 1<br> 
  defaults.ctl.card 1<br>

6. Install Fluidsynth<br>
  sudo apt-get install fluidsynth

7. Copy your converted SF2 soundfont file to the raspberry pi home directory

8. Copy script **harmoniumid.sh** file to home directory /home/pi<br>
  It is simple script which starts Fluidsynth with harmonium soundfont and your midi keyboard<br>
  - Adjust the buffer size with -z parameter (minimal i could use without audio distortion and much of latency on this device was 160)<br>
  - Adjust gain with -g parameter<br>

9. Test midi keyboard connection to get a device number<br>
  amidi -l<br>

10. Adjust midi device number in harmoniumid.sh file<br>
  nano ./harmoniumid.sh<br>
  midi.alsa.device=hw:2,0<br>
  give execute permission to your script: chmod +x /home/pi/harmoniumid.sh<br>

11. Add ./harmoniumid.sh to your ~/bashrc file to start instrument on boot

12. Make raspbery pi sd card read-only with raspi-config settings

13. Restart and enjoy!

PS. Loading of the instrument can take up to 1 minute, because of the raspbery pi zero booting time. 
You can make it load little faster by some tweaks (Edit /boot/config.txt or make custom buildroot image of the linux system). 

### Send your thanks to N'hyra Virakah for a great harmonium recording and programming! 
https://www.patreon.com/nhyravirakah<br>
**ॐ**








