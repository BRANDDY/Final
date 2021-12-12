PVector colours;
int red, green,blue;

void startUi() {
    fill(255);
    rect(20, 20, 475, 320, 28);
    int y1 = 20;
    for (int i = 0;i < 5;i++) {
        y1 += 53;
        line(20,y1,490,y1);
    }    
    for (int i = 0;i < 8;i++) {
        buttonList[i].update();
    }
    for (int i = 0;i < noteList.size();i++) {
        noteList.get(i).update();
    }
    line(522,33,552,57);
    line(552,57,522,83);
    line(522,33,522,83);
}

void setButton() {
    PVector loc = new PVector(510,30);
    for (int i = 0;i < 2;i++) {
        for (int t = 0;t < 4;t++) {
            int scale = 60 + 2 * (t + i * 4) - 1;
            if ((t + i * 4)>= 4) {
                scale = scale - 1;
            }
            buttonList[t + i * 4] = new Buttons(t + i * 4,scale,1,loc);
            loc.y = loc.y + 60 + 20;
        }
        loc.x += 70;     
        loc.y = 30;   
    } 
}



class Buttons{
    PVector bLoc;
    int scale, pitch;
    PVector colour,colourOrg;
    
    Buttons(int i,int s, int p,PVector l) {
        bLoc = new PVector(l.x,l.y);
        scale = s;
        pitch = p;
        setColour(i);
        colourOrg = new PVector(red,green,blue);
    }
    Buttons() {
        bLoc = new PVector();
    }
    
    void update() {
        fill(colour.x,colour.y,colour.z);
        rect(bLoc.x, bLoc.y, buttonSize.x, buttonSize.y, 28);
    }

    void setColour(int t) {
        switch(t) {
            case 0 : red = 255;green = 255;blue = 255; break;
            case 1 : red = 255 ;green = 50;blue = 50; break;
            case 2 : red = 255 ;green = 100;blue = 50; break;
            case 3 : red = 255 ;green = 255 ;blue = 50; break;
            case 4 : red = 50;green = 255 ;blue = 50; break;
            case 5 : red = 0;green = 255;blue = 200; break;
            case 6 : red = 50;green = 150;blue = 255; break;
            case 7 : red = 150;green = 50;blue = 255; break;
        }
        colour = new PVector(red,green,blue);
    }
}
float midiToFreq(int n, int p) {
    return(pow(2,((n - 69) / 12.0))) * 440  * p;
}