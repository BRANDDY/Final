ArrayList<ArrayList<Buttons>> rowList = new ArrayList<ArrayList<Buttons>>();
ArrayList<Buttons> music = new ArrayList<Buttons>();
int trigger = 0;

void playMusic() {
    organize();
    if (music.size()>0) {
        for (int i = 0;i < music.size() + 1;i++) {
            trigger = millis() + 300;
            while(millis() < trigger) {
                if (keyCode ==  UP) {
                    break;
                }
            }
            if (i!= (music.size())) {
                triOsc.play(midiToFreq(music.get(i).scale,music.get(i).pitch), 0.8);
            }   
        }
    } else{
        println("NullMusic");
    }
    music.clear();
    rowList.clear();
}

void organize() {
    orgRow(); 
    for (int n = 0;n < 6;n++) {
        while(rowList.get(n).size()> 0) {
            for (int i = 0;i < rowList.get(n).size();i++) {
                boolean small = true;
                for (int t = 0;t < rowList.get(n).size();t++) {
                    if (i!= t &&  rowList.get(n).get(i).bLoc.x>rowList.get(n).get(t).bLoc.x) {
                        small = false;
                    }
                }
                if (small) {
                    music.add(rowList.get(n).get(i));
                    rowList.get(n).remove(i);
                }
            }
        }
    }
}

void orgRow() {
    int row;
    ArrayList<Buttons> row0 = new ArrayList<Buttons>();
    ArrayList<Buttons> row1 = new ArrayList<Buttons>();
    ArrayList<Buttons> row2 = new ArrayList<Buttons>();
    ArrayList<Buttons> row3 = new ArrayList<Buttons>();
    ArrayList<Buttons> row4 = new ArrayList<Buttons>();
    ArrayList<Buttons> row5 = new ArrayList<Buttons>();
    for (int i = 0;i < noteList.size();i++) {
        float y = noteList.get(i).bLoc.y;
        if (y > 10 &&  y < 60) {
            row0.add(noteList.get(i));
        } 
        else if (y >= 60 &&  y < 110) {
            row1.add(noteList.get(i));
        }
        else if (y >= 110 &&  y < 160) {
            row2.add(noteList.get(i));
        }
        else if (y >= 160 &&  y < 210) {
            row3.add(noteList.get(i));
        }
        else if (y >= 210 &&  y < 260) {
            row4.add(noteList.get(i));
        }
        else if (y >= 260 &&  y < 300) {
            row5.add(noteList.get(i));
        } else{
            println(i + "wrong row" + y);
            break;
        }    
    } 
    rowList.add(row0);  
    rowList.add(row1);  
    rowList.add(row2);  
    rowList.add(row3);  
    rowList.add(row4);  
    rowList.add(row5);  
}