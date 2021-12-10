import processing.sound.*;
TriOsc triOsc;
Buttons[] buttonList;
Buttons note;
ArrayList<Buttons> noteList;
PVector buttonSize = new PVector(50,60);


void setup() {
    triOsc = new TriOsc(this);
    buttonList = new Buttons[8];
    triOsc.play(60, 0.8);
    size(640, 360);
    setButton();
    noteList = new ArrayList<Buttons>();
}

void draw() {
    background(0);
    startUi(); 
}
