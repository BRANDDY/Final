import processing.sound.*;

TriOsc triOsc;

int red, green, blue;


void setup() {
    triOsc = new TriOsc(this);
    triOsc.play(60, 0.8);
    size(640, 360);
    setButton();
    noteList = new Buttons[100];
}


void draw() {
    background(red, green, blue);
    startUi(); 
}
/*void keyPressed() {
red = int(random(255));
green = int(random(255));
blue = int(random(255));
//为键盘上的每个数字分配声音。1 5 玩
//文件原始音高以下的八度，6-0 播放
//以上八度音阶。
switch(key) {
case'1':

triOsc.play(midiToFreq(60), 0.8);
break;
case'2':
triOsc.play(midiToFreq(61), 0.8);1
break;
case'3':
triOsc.play(midiToFreq(62), 0.8);
break;
case'4':
triOsc.play(midiToFreq(63), 0.8);2
break;
case'5':
triOsc.play(midiToFreq(64), 0.8);
break;
case'6':
triOsc.play(midiToFreq(65), 0.8);3
break;
case'7':
triOsc.play(midiToFreq(66), 0.8);4
break;
case'8':
triOsc.play(midiToFreq(67), 0.8);
break;
case'9':
triOsc.play(midiToFreq(68), 0.8);
break;
case'0' : 
triOsc.play(midiToFreq(69), 0.8);
break;
    }
}*/


