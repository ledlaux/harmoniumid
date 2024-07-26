# Midi harmonium made with Fluidsynth

In search for the best free sounding harmonium virtual instrument i found **N'hyra Virakah** recorded harmonium in Decent sampler format:
https://www.youtube.com/watch?v=6j1xUndPMio&t=785s

Then the idea arose to try to convert this Decent sampler preset for use with the Fluidsynth.
<br>
<br>
**Instructions:**
<br>
1. Download harmonium Decent sampler preset from<br>
https://www.patreon.com/posts/indian-harmonium-90825095

2. Convert the preset to SFZ format with DSconverter by Eodowd<br>
https://github.com/eodowd/ds2sfz

3. Convert SFZ file to SF2 soundfont.<br>
You can use Sforzando or Polyphone to do that. I used Polyphone console command<br>
/Applications/polyphone.app/Contents/MacOS/polyphone -1 filename.sfz -d /Users/user -o filename     

Thats it! 

Now you can load this instrument in to the Fluidsynth and play it. To make a portable harmonium instrument to exercise with headphones you can use it with Android Fluidsynth app and midi keyboard connected to your phone.

This instrument has some additional settings which can be asigned to midi keyboard: volume (CC 7), reverb (CC 91), chorus (CC 93)
<br>
<br>
## A prototype of midi harmonium on Raspberry pi zero w2 

I had a raspberry pi zero laying around so next idea came to test this instrument on it, and it worked wonderfully!
<br>
<br>
**You will need:**
<br>
 - Raspberry pi zero w2 with power adapter or powerbank

 - Usb hub

 - Any compact usb soundcard or hdmi vga adapter cable with audio out (I could not make raspbery pi audio out to work with my adapter cable so used the sound card. Maybe with different cable it will work, try it. Than will be no need for a usb hub)
 
 - 3.5mm audio cable to connect to speakers if needed

 - Microusb to usb cable adapter (otg cable)

 - Midi keyboard

For this project M-audio Keystation Mini 32 MK3 is perfect because it is compact, not expensive, the key range is enough, also you can edit velocity and midi cc on the device itself.<br>
<br>
**Instructions:**
<br>
1. Install Raspbian Lite OS in headless mode with SSH (instruction could be found in internet)

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

8. Copy script **midiharmonium.sh** file to home directory /home/pi<br>
  It is simple script which starts Fluidsynth with harmonium soundfont and your midi keyboard<br>
  - Adjust the buffer size with -z parameter (minimal i could use without audio distortion and much of latency on this device was 160)<br>
  - Adjust gain with -g parameter<br>

9. Test midi keyboard connection to get a device number<br>
  amidi -l<br>

10. Adjust midi device number in midiharmonium.sh file<br>
  nano ./midiharmonium.sh<br>
  midi.alsa.device=hw:2,0<br>
  give execute permission to your script: chmod +x /home/pi/midiharmonium.sh<br>

11. Add ./midiharmonium.sh to your ~/bashrc file to start Midiharmonium on boot

12. Make raspbery pi sd card read-only with raspi-config settings

13. Restart and enjoy!

PS. Loading time of the instrument can take up to 1 minute, because of the raspbery pi zero limited resources. 
You can make it load little faster by some tweaks (disabling bluetooth in /boot/config.txt. and other)

### Send your thanks to the N'hyra Virakah for a great harmonium recording and programming! 

**ॐ**








