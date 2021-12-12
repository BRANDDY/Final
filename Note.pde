boolean play = false;
boolean move = false;
boolean addNote = false;
boolean playButton = false;

void mouseWheel(MouseEvent event) {
    if (mousePressed) {
        println("goin");
        for (int i = 0;i < noteList.size();i++) {
            if (mouseX > noteList.get(i).bLoc.x && mouseX < noteList.get(i).bLoc.x + buttonSize.x 
                && mouseY > noteList.get(i).bLoc.y && mouseY < noteList.get(i).bLoc.y + buttonSize.y) {
                float e = event.getCount();
                noteList.get(i).pitch += e;
                float c = noteList.get(i).pitch * 20;
                if (noteList.get(i).pitch<6 &&  noteList.get(i).pitch>0) {
                    noteList.get(i).colour=new PVector(noteList.get(i).colourOrg.x - c, noteList.get(i).colourOrg.y - c, noteList.get(i).colourOrg.z - c);
                } else{
                    noteList.get(i).pitch = 0;
                    noteList.get(i).colour=new PVector(255, 255, 255);
                }
                println("Pitch Level:" + noteList.get(i).pitch);
            }  
        }
    }
}

void mousePressed() {  
    addNote = false; 
    move = false;  
    playButton = false;  
    if (mouseX > 480) { //right panel
        for (int i = 0;i < 8;i++) { 
            if (mouseX > buttonList[i].bLoc.x && mouseX < buttonList[i].bLoc.x + buttonSize.x 
                && mouseY > buttonList[i].bLoc.y && mouseY < buttonList[i].bLoc.y + buttonSize.y) {
                if (i!= 0) {
                    addNote = true;
                    move = true;
                    note = new Buttons();
                    cloneMember(note, buttonList[i]);
                    play = true;
                } else{//the first button is PLAY Music
                    playButton = true;
                }
            }            
        } 
    } else{//left
        for (int i = 0;i < noteList.size();i++) {
            if (mouseX > noteList.get(i).bLoc.x && mouseX < noteList.get(i).bLoc.x + buttonSize.x 
                && mouseY > noteList.get(i).bLoc.y && mouseY < noteList.get(i).bLoc.y + buttonSize.y) {
                move = true;
                note = noteList.get(i);
                play = true;
            }  
        }
    }   
}

void mouseReleased() {
    if (!play) {
        triOsc.stop();
    } else{
        triOsc.play(midiToFreq(note.scale,note.pitch), 0.8);
    }
    if (move) {
        if (addNote) {
            if (mouseX < 480) {
                noteList.add(note);
            }
        } else{
            if (mouseX > 480) {
                noteList.remove(note);
                play = false;
            } 
        }
    }
    if (playButton) {
        playMusic();
        triOsc.stop();
    }
    note.update();
}

void cloneMember(Buttons a, Buttons b) {
    a.bLoc.x = b.bLoc.x;
    a.bLoc.y = b.bLoc.y;
    a.scale = b.scale;
    a.pitch = b.pitch;
    a.colourOrg = new PVector(b.colourOrg.x, b.colourOrg.y,b.colourOrg.z);
    a.colour = new PVector(b.colour.x, b.colour.y,b.colour.z);
    println(a.colour.x);
}

void mouseDragged() {
    if (move) {
        note.bLoc.x = mouseX;
        note.bLoc.y = mouseY;
        note.update();
    }
}



