import processing.sound.*;

TriOsc triOsc;
int red, green, blue;


void setup() {
    triOsc = new TriOsc(this);
    triOsc.play(60, 0.8);
    size(640, 360);
    setButton();
    noteList = new ArrayList<Buttons>();
}

void draw() {
    background(red, green, blue);
    startUi(); 
}
