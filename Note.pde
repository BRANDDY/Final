boolean play = false;
boolean move = false;
boolean addNote = true;
boolean dontRemove = false;

void mousePressed() {       
    if (mouseX > 460) { 
        for (int i = 0;i < 8;i++) { 
            if (mouseX > buttonList[i].bLoc.x && mouseX < buttonList[i].bLoc.x + buttonSize.x 
                && mouseY > buttonList[i].bLoc.y && mouseY < buttonList[i].bLoc.y + buttonSize.y) {
                if (i!= 0) {
                    addNote = true;
                    note = new Buttons();
                    cloneMember(note, buttonList[i]);
                    play = true;
                    dontRemove = false;
                } else{
                    addNote = false;
                    play = false;
                    dontRemove = true;
                    playMusic();
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

void cloneMember(Buttons a, Buttons b) {
    a.bLoc.x = b.bLoc.x;
    a.bLoc.y = b.bLoc.y;
    a.scale = b.scale;
    a.pitch = b.pitch;
    a.colour = b.colour;
}

void mouseReleased() {
    if (!play) {
        triOsc.stop();
    } else{
        triOsc.play(midiToFreq(note.scale,note.pitch), 0.8);
    }
    if (move) {
        if (mouseX > 460 && dontRemove) {
            noteList.remove(note);
            play = false;
        } else if (addNote) {
            noteList.add(note);
        }
        move = false;
    }
}

void mouseDragged() {
    if (play) {
        note.bLoc.x = mouseX;
        note.bLoc.y = mouseY;
        note.update();
    }
    move = true;
}
