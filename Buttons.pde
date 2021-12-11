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
}

void setButton() {
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

void setColour(int i) {
    switch(i) {
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
    
    void update() {
        fill(colour.x,colour.y,colour.z);
        rect(bLoc.x, bLoc.y, buttonSize.x, buttonSize.y, 28);
    }
}

float midiToFreq(int n, int p) {
    return(pow(2,((n - 69) / 12.0))) * 440  * p;
}