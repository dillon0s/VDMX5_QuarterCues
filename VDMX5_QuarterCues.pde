/* 

!! IMPORTANT !!

Will only work with virtual MIDI bus running!
To activate (Mac):
  Spotlight > Audio MIDI Setup >
  IAC Driver > Check "Device is online" box.

If you're changing which Bus this sketch uses,
make sure to stick it in setup instead of "Bus 1".


!! IMPORTANT !!

Only works if the sketch is the prioritised window.
Should fit off to the right of VDMX in 'Simple Mixer' mode
to easily select when needed/remain visible all the time.
To map (Mac):
  'cmd'+'L' while VDMX window is selected for MIDI learn mode,
  click on the left deck playback ribbon,
  select the QuarterCues window,
  hit 'A','S','D','F' to teach VDMX (you might have to re click
  the ribbon before each key).
  Reselect VDMX, hit right deck ribbon,
  repeat with 'G','H','J','K'.
  'cmd'+'L' to exit MIDI learn mode.

Done :)
 
*/

import themidibus.*;
MidiBus myBus;

UIbox[] uiBox = new UIbox[8];

void setup()
{
  
  size(280,180);
 
// Here's where you need to have the right bus name.
// Bus 1 will work with the default (activated) IAC settings.
  myBus = new MidiBus(this,"Bus 1","Bus 1");
  
// This line is Mac specific.
  myBus.sendTimestamps(false);
  
  uiBox[0] = new UIbox(1,1,"<<","A");
  uiBox[1] = new UIbox(2,1,"1/4","S");  
  uiBox[2] = new UIbox(3,1,"1/2","D"); 
  uiBox[3] = new UIbox(4,1,"3/4","F"); 
  uiBox[4] = new UIbox(1,2,"<<","G");
  uiBox[5] = new UIbox(2,2,"1/4","H");  
  uiBox[6] = new UIbox(3,2,"1/2","j"); 
  uiBox[7] = new UIbox(4,2,"3/4","K");
  
}
void draw()
{
  background(0);
  
  rectMode(CENTER);
  textAlign(CENTER);
  text("LEFT DECK",width/2,30);
  text("RIGHT DECK",width/2,height-18);
  stroke(150);
  strokeWeight(2);
  for (int i = 0; i < 8; i++)
  {
    uiBox[i].draw();
  }
  
  
}

/*
Brief explanation of the next bit:

myBus.sendControllerChange(int MIDI channel,
                            int Controller Number,
                            int Controller Value)   

 MIDI channel is self explanatory (and not needed).
 controller number identifies which knob or slider, (I'm using one
 number for each deck to prevent conflicts).
 Controller value is the position of that knob or slider, in this
 case fractions of 128, minus 1 (128 possible values including 0).
 
 e.g "(128/4)-1" will skip to 1/4 of the total length of the video.
 
 */

void keyReleased()
{
  switch(key)
  {
    
//LEFT DECK
    case'a':
    myBus.sendControllerChange(1,1,0);
    uiBox[0].pulse();
    break;
    
    case's':
    myBus.sendControllerChange(1,1,(128/4)-1);
    uiBox[1].pulse();
    break;
    
    case'd':
    myBus.sendControllerChange(1,1,(128/2)-1);
    uiBox[2].pulse(); 
    break;
    
    case'f':
    myBus.sendControllerChange(1,1,((128/4)*3)-1);
    uiBox[3].pulse();
    break;
    
//RIGHT DECK
    case'g':
    myBus.sendControllerChange(1,2,0);
    uiBox[4].pulse();   
    break;
    
    case'h':
    myBus.sendControllerChange(1,2,(128/4)-1);
    uiBox[5].pulse();    
    break;
    
    case'j':
    myBus.sendControllerChange(1,2,(128/2)-1);
    uiBox[6].pulse();    
    break;
    
    case'k':
    myBus.sendControllerChange(1,2,((128/4)*3)-1);
    uiBox[7].pulse();    
    break;
    
    default:
    break;
    
  }
}

