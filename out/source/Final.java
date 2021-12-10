/* autogenerated by Processing revision 1276 on 2021-12-10 */
import processing.core.*;
import processing.data.*;
import processing.event.*;
import processing.opengl.*;

import processing.sound.*;

import java.util.HashMap;
import java.util.ArrayList;
import java.io.File;
import java.io.BufferedReader;
import java.io.PrintWriter;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.IOException;

public class Final extends PApplet {


TriOsc triOsc;
Buttons[] buttonList;
Buttons note;
ArrayList<Buttons> noteList;
PVector buttonSize = new PVector(50,60);


 public void setup() {
    triOsc = new TriOsc(this);
    buttonList = new Buttons[8];
    triOsc.play(60, 0.8f);
    /* size commented out by preprocessor */;
    setButton();
    noteList = new ArrayList<Buttons>();
}

 public void draw() {
    background(0);
    startUi(); 
}
boolean play = false;
boolean move = false;
boolean addNote = true;
PVector colours;

 public void startUi() {
    fill(255);
    rect(20, 20, 475, 320, 28);
    for (int i = 0;i < 8;i++) {
        buttonList[i].update();
    }
    for (int i = 0;i < noteList.size();i++) {
        noteList.get(i).update();
    }
}

 public void setButton() {
    PVector loc = new PVector(510,30);
    for (int i = 0;i < 2;i++) {
        for (int t = 0;t < 4;t++) {
            int scale = 60 + 2 * (t + i * 4) - 1;
            if ((t + i * 4)>= 4) {
                scale = scale - 1;
            }
            setColour(t + i * 4);
            buttonList[t + i * 4] = new Buttons(scale,1,loc,colours);
            loc.y = loc.y + 60 + 20;
        }
        loc.x += 70;     
        loc.y = 30;   
    } 
}

    int red, green,blue;
 public void setColour(int i) {
    switch (i) {
        case 0 : red = 255;green = 255;blue = 255; break;
        case 1 : red = 255;green = 50;blue = 50; break;
        case 2 : red = 255;green = 100;blue = 50; break;
        case 3 : red = 255;green = 255;blue = 50; break;
        case 4 : red = 50;green = 255;blue = 50; break;
        case 5 : red = 0;green = 255;blue = 200; break;
        case 6 : red = 50;green = 150;blue = 255; break;
        case 7 : red = 150;green = 50;blue = 255; break;
    }
    colours = new PVector(red,green,blue);
}


class Buttons{
    PVector bLoc;
    int scale, pitch;
    PVector colour;
    
    Buttons(int s, int p,PVector l,PVector c) {
        bLoc = new PVector(l.x,l.y);
        scale = s;
        pitch = p;
        colour = new PVector(c.x,c.y,c.z);
        
    }
    Buttons() {
        bLoc = new PVector();
    }
    
     public void update() {
        fill(colour.x,colour.y,colour.z);
        rect(bLoc.x, bLoc.y, buttonSize.x, buttonSize.y, 28);
    }
    
}
 public float midiToFreq(int n, int p) {
    return(pow(2,((n - 69) / 12.0f))) * 440  * p;
}



 public void mousePressed() {       
    if (mouseX > 510) { 
        for (int i = 0;i < 8;i++) { 
            if (mouseX > buttonList[i].bLoc.x && mouseX < buttonList[i].bLoc.x + buttonSize.x 
                && mouseY > buttonList[i].bLoc.y && mouseY < buttonList[i].bLoc.y + buttonSize.y) {
                if (i!= 0) {
                    addNote = true;
                    note = new Buttons();
                    cloneMember(note, buttonList[i]);
                    play = true;
                } else{
                    addNote = false;
                    play = false;
                }
            }            
        } 
    } else{
        addNote = false;
        for (int i = 0;i < noteList.size();i++) {
            if (mouseX > noteList.get(i).bLoc.x && mouseX < noteList.get(i).bLoc.x + buttonSize.x 
                && mouseY > noteList.get(i).bLoc.y && mouseY < noteList.get(i).bLoc.y + buttonSize.y) {
                note = noteList.get(i);
                play = true;
            }  
        }
    }   
}

 public void cloneMember(Buttons a, Buttons b) {
    a.bLoc.x = b.bLoc.x;
    a.bLoc.y = b.bLoc.y;
    a.scale = b.scale;
    a.pitch = b.pitch;
    a.colour = b.colour;
}

 public void mouseReleased() {
    if (!play) {
        triOsc.stop();
    } else{
        triOsc.play(midiToFreq(note.scale,note.pitch), 0.8f);
    }
    if (move) {
        if (mouseX > 510) {
            noteList.remove(note);
            play = false;
        } else if (addNote) {
            noteList.add(note);
            move = false;
        }
    }
}

 public void mouseDragged() {
    if (play) {
        note.bLoc.x = mouseX;
        note.bLoc.y = mouseY;
        note.update();
    }
    move = true;
}


  public void settings() { size(640, 360); }

  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Final" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
