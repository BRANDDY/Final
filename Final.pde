/*Creat Color Score
Different color has different pitch.
->PITCH:Click pitch buttons(colour).
->ADD a note:Drag a button to paper on left side.
->DELETED: Drag the note to right side.
->OCTAVE:Press the note, use mouse wheel increase or decrease octave(8 pitches)
When you finish composing the score, 
click the White Button to PLAY your music.
You can compose them any way you want at any time.
***The music will be played line by line.***
*/

import processing.sound.*;
TriOsc triOsc;
Buttons[] buttonList;
Buttons note;
ArrayList<Buttons> noteList;
boolean start = false;

PVector buttonSize = new PVector(50,60);


void setup() {
    triOsc = new TriOsc(this);
    buttonList = new Buttons[8];
    size(640, 360,P2D);
    setButton();
    noteList = new ArrayList<Buttons>();
}

void draw() {
    background(0);
    startUi(); 
}
