Buttons[] buttonList;
PVector buttonSize = new PVector(50,60);
int colour = 255;
Buttons note;
Buttons[] noteList; 
int noteSize = 100;
int noteOrder = 0;
boolean play = false;
boolean move = false;
boolean addNote = true;


void setButton() {
    PVector loc = new PVector(510,30);
    buttonList = new Buttons[8];
    for (int i = 0;i < 2;i++) {
        for (int t = 0;t < 4;t++) {
            int scale = 60 + 2 * (t + i * 4) - 1;
            if ((t + i * 4)>= 4) {
                scale = scale - 1;
            }
            buttonList[t + i * 4] = new Buttons(scale,1,loc);
            loc.y = loc.y + 60 + 20;
        }
        loc.x += 70;     
        loc.y = 30;   
    } 
}

void startUi() {
    fill(255);
    rect(20, 20, 475, 320, 28);
    for (int i = 0;i < 8;i++) {
        buttonList[i].update();
    }
    for (int i = 0;i < noteOrder;i++) {
        noteList[i].update();
    }
}


class Buttons{
    PVector bLoc = new PVector();
    int scale, pitch;
    
    Buttons(int s, int p,PVector l) {
        bLoc = new PVector();
        bLoc.x = l.x;
        bLoc.y = l.y;
        scale = s;
        pitch = p;
    }
    Buttons() {
        bLoc = new PVector();
    }
    
    void update() {
        fill(colour);
        rect(bLoc.x, bLoc.y, buttonSize.x, buttonSize.y, 28);
    }
    
}
float midiToFreq(int n, int p) {
    return(pow(2,((n - 69) / 12.0))) * 440  * p;
}



void mousePressed() {       
    if (mouseX > 510) { 
        addNote = true;
        for (int i = 0;i < 8;i++) { 
            if (mouseX > buttonList[i].bLoc.x && mouseX < buttonList[i].bLoc.x + buttonSize.x 
                && mouseY > buttonList[i].bLoc.y && mouseY < buttonList[i].bLoc.y + buttonSize.y) {
                if (i!= 0) {
                    note = new Buttons();
                    cloneMember(note, buttonList[i]);
                    play = true;
                } else{
                    play = false;
                }
            }            
        } 
    } else if(noteOrder>0){
        addNote = false;
        for (int i = 0;i < noteOrder;i++) {
            if (mouseX > noteList[i].bLoc.x && mouseX < noteList[i].bLoc.x + 50 
                && mouseY > noteList[i].bLoc.y && mouseY < noteList[i].bLoc.y + 60) {
                note = new Buttons();
                note = noteList[i];
                play = true;
            }  
        }
    }   
}

void cloneMember(Buttons a, Buttons b) {
    a.bLoc.x = b.bLoc.x;
    a.bLoc.y = b.bLoc.y;
    a.scale = b.scale;
    a.pitch = b.pitch;
    //a.colour = b.colour;
}

void mouseReleased() {
    if (!play) {
        triOsc.stop();
    } else{
        triOsc.play(midiToFreq(note.scale,note.pitch), 0.8);
    }
    if (move&addNote) {
        noteList[noteOrder]=new Buttons();
        cloneMember(noteList[noteOrder],note);
        move = false;
        noteOrder +=1;
    }
}

void mouseDragged() {
    drag();
    move = true;
}

void drag() {
    if (play) {
        note.bLoc.x = mouseX;
        note.bLoc.y = mouseY;
        note.update();
    }
}