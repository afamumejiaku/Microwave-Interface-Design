import controlP5.*;
import guru.ttslib.*;

TTS tts;
ControlP5 cp5;
ControlP5 controlP5;
controlP5.Knob KNOB;
controlP5.Button  MAIN1, MAIN2,MAIN3, MAIN4,MAIN5, MAIN6,MAIN7, MAIN8,MAIN9, MAIN10,MAIN11, MAIN12,MAIN13, MAIN14,MAIN15, MAIN16,MAIN17, MAIN18,MAIN19, MAIN20,  MAIN21, MAIN22,MAIN23, MAIN24;
controlP5.Button  QUICK, EXPRESS, LEVEL, TEMP, FINISHED, BARCODE, ANALOG, DIGITAL, QUICKSWITCH, HOME, SETTING, EXPRESSSWITCH, REST, LEVEL1 , LEVEL2, LEVEL3, LEVEL4, LEVEL5, LEVEL6 ;
controlP5.Toggle SETTING1, SETTING2, SETTING3, CLOCK,SOUND; 
controlP5.Slider POWER, TEMPERATURE, SETTING4, SETTING5, SETTING6; 
controlP5.Button  BUTTON1, OVENSETTINGS, BUTTON2, OPENDOOR;
Timer startTimer;

PImage imgHome,imgHome2,imgHome3, imgBarcode,imgBarcode2,imgBarcode3,imgSettings,imgSettings2,imgSettings3,imgAnalogClock,imgDigitalClock,imgExpressStart,imgQuickStart;
PImage imglevel1,imglevel2,imglevel3,imglevel4,imglevel5,imglevel6,imgLevel1,imgLevel2,imgLevel3,imgLevel4,imgLevel5,imgLevel6,imgScanning,imgFinished, imgClock;
PImage img1,img2,img3,img4,img5,img6,img7,img8,img9,img10,img11,img12,img13,img14,img15,img16,img17,img18,img19,img20,img21,img22,img23,img24;
PImage imgB1,imgB2,imgB3,imgB4,imgB5,imgB6,imgB7,imgB8,imgB9,imgB10,imgB11,imgB12,imgB13,imgB14,imgB15,imgB16,imgB17,imgB18,imgB19,imgB20,imgB21,imgB22,imgB23,imgB24;
PFont font, font1, font2, font3, font4, font5;
int cx, cy, Quick=0, Express=0, Main=0, Level=0, Temp=0, Home=1, Setting=0,Finished=1, Barcode=0, clockNum= 0, analogClock, digitalClock, quickSwitch=1, R=0,G=0,B=0, Temperature=350, Power=500,pAUSE=0 ;
float secondsRadius, minutesRadius, hoursRadius, clockDiameter, initialTime, timeRemaining=0;
int secondsRemaining, minutesRemaining=0,count,countLight, soundOn=1;
int CF = #363636, CB = #222021, CA = #B9BBB6;
String Mon,Ext, key1,key2,key3,key4,key5,key6,key7,key8,key9,key10,key11,key12,key13,key14,total="00:00",totalnum,totalnum2,T1="0",T2="0",T3="0",T4="0",secondSRemaining, hOURS,mINUTES;
boolean display = false;

void setup(){
  size (2000, 2000);
  font = createFont("digital-7.ttf", 100);
  font1 = createFont("Georgia", 80);
  font2 = createFont("digital-7.ttf", 250);
  font3 = createFont("Georgia", 10);
  font4 = createFont("Georgia", 1);
  font5 = createFont("Georgia", 110);
  
  tts = new TTS();
  
  imgHome = loadImage("Home.png");imgHome2 = loadImage("Home2.png");imgHome3 = loadImage("Home3.png"); imgClock= loadImage("Clock.png");
  imgBarcode = loadImage("Barcode.png"); imgBarcode2 = loadImage("Barcode2.png");imgBarcode3 = loadImage("Barcode3.png");
  imgSettings = loadImage("Setting.png"); imgSettings2 = loadImage("Setting2.png"); imgSettings3 = loadImage("Setting3.png");
  imgAnalogClock = loadImage("analogClock.jpg"); imgDigitalClock = loadImage("digitalClock.jpg"); imgFinished= loadImage("Chef.jpg");
  imgExpressStart = loadImage("expressStart.jpg"); imgQuickStart = loadImage("quickStart.png"); imgScanning= loadImage("scanBarcode.png");
  imgLevel1= loadImage("Blue.jpg");imgLevel2= loadImage("Rare.jpg");imgLevel3= loadImage("Medium Rare.jpg");
  imgLevel4= loadImage("Medium.jpg");imgLevel5= loadImage("Medium Well.jpg");imgLevel6= loadImage("Welldone.jpg");
  imglevel1= loadImage("l1.jpg");imglevel2= loadImage("l2.jpg");imglevel3= loadImage("l3.jpg");  imglevel4= loadImage("l4.jpg");imglevel5= loadImage("l5.jpg");imglevel6= loadImage("l6.jpg");
  img1= loadImage("coffee.jpg");img2= loadImage("steak.jpg");img3= loadImage("potatoes.jpg");img4= loadImage("frozen.jpg");img5= loadImage("pizza.png");img6= loadImage("bread.jpg");
  img7= loadImage("cake.jpg");img8= loadImage("donut.jpg");img9= loadImage("popcorn.jpg");img10= loadImage("oatmeal.jpg");img11= loadImage("soup.jpg");img12= loadImage("rice.jpg");
  img13= loadImage("sauce.jpg");img14= loadImage("eggs.jpg");img15= loadImage("vegetables.jpg");img16= loadImage("pasta.jpg");  img17= loadImage("noodles.jpg");img18= loadImage("bacon.jpg");
  img19= loadImage("hotdog.jpg");img20= loadImage("nachos.jpg");img21= loadImage("reheat.jpg");img22= loadImage("SpeedDefrost.png");img23= loadImage("CookWeight.png");img24= loadImage("defrostWeight.png");
  imgB1= loadImage("coffee2.jpg");imgB2= loadImage("steak2.jpg");imgB3= loadImage("potatoes2.jpg");imgB4= loadImage("frozen2.jpg");imgB5= loadImage("pizza2.jpg");imgB6= loadImage("bread2.jpg");
  imgB7= loadImage("cake2.jpg");imgB8= loadImage("donut2.jpg");imgB9= loadImage("popcorn2.jpg");imgB10= loadImage("oatmeal2.jpg");imgB11= loadImage("soup2.jpg");imgB12= loadImage("rice2.jpg");
  imgB13= loadImage("sauce2.jpg");imgB14= loadImage("eggs2.jpg");imgB15= loadImage("vegetables2.jpg");imgB16= loadImage("pasta2.jpg");imgB17= loadImage("noodles2.jpg");imgB18= loadImage("bacon2.jpg");
  imgB19=loadImage("hotdog2.jpg");imgB20=loadImage("nachos2.jpg");imgB21= loadImage("reheat2.jpg");imgB22= loadImage("SpeedDefrost2.png");imgB23= loadImage("CookWeight2.png");imgB24= loadImage("defrostWeight2.png");
  imgHome.resize(120,120);imgHome2.resize(100,0);imgHome3.resize(100,0);
  imgBarcode.resize(120,120); imgBarcode2.resize(100,0); imgBarcode3.resize(100,0); 
  imgSettings.resize(120,120);imgSettings2.resize(100,0);imgSettings3.resize(100,0);
  img1.resize(150,150);img2.resize(150,150);img3.resize(150,150);img4.resize(150,150);img5.resize(150,150);img6.resize(150,150);img7.resize(150,150);img8.resize(150,150);
  img9.resize(150,150);img10.resize(150,150);img11.resize(150,150);img12.resize(150,150);img13.resize(150,150);img14.resize(150,150);img15.resize(150,150);img16.resize(150,150);
  img17.resize(150,150);img18.resize(150,150);img19.resize(150,150);img20.resize(150,150); img21.resize(150,150);img22.resize(150,150);img23.resize(150,150);img24.resize(150,150);
  
  
  
  cp5= new ControlP5(this);
   QUICKSWITCH = cp5.addButton("quick_Start").setPosition(650,1500).setSize(700,150).setLabel("Quick Start").setColorForeground(CF).setColorBackground(CB).setColorActive(CA); cp5.setFont(font1); QUICKSWITCH.hide();
   EXPRESSSWITCH = cp5.addButton("express_Start").setPosition(650,1500).setSize(700,150).setLabel("Express Start").setColorForeground(CF).setColorBackground(CB).setColorActive(CA); cp5.setFont(font1);EXPRESSSWITCH.hide();
   OVENSETTINGS = cp5.addButton("ovenSettings").setPosition(650,175).setSize(700,150).setLabel("Oven Settings").setColorForeground(CF).setColorBackground(CB).setColorActive(CA); cp5.setFont(font1); OVENSETTINGS.hide();

  cp5= new ControlP5(this);
   HOME =cp5.addButton("homeIcon").setPosition(700, 1800).setImages(imgHome,imgHome2,imgHome3).updateSize();HOME.hide();
   REST =cp5.addButton("resting").setPosition(700, 1800).setImages(loadImage("resting.png"),loadImage("resting2.png"),loadImage("resting2.png")).updateSize();REST.hide();
   BARCODE = cp5.addButton("barcodeIcon").setPosition(950, 1800).setImages(imgBarcode,imgBarcode2,imgBarcode3).updateSize(); BARCODE.hide();
   SETTING = cp5.addButton("settingIcon").setPosition(1200, 1800).setImages(imgSettings,imgSettings2,imgSettings3).updateSize();SETTING.hide();
   KNOB = cp5.addKnob("Knob",0,30,minutesRemaining,700,700,575).setColorForeground(CF).setColorBackground(CB).setColorActive(CA); cp5.setFont(font4);  KNOB.hide();
   MAIN1 = cp5.addButton("Coffee").setPosition(640, 350).setImages(img1,imgB1,img1).updateSize();MAIN1.hide();
   MAIN2= cp5.addButton("Steak").setPosition(825, 350).setImages(img2,imgB2,img2).updateSize();MAIN2.hide();
   MAIN3= cp5.addButton("Potatoes").setPosition(1010, 350).setImages(img3,imgB3,img3).updateSize();MAIN3.hide();
   MAIN4 = cp5.addButton("Frozen").setPosition(1195, 350).setImages(img4,imgB4,img4).updateSize();MAIN4.hide();
   MAIN5 =  cp5.addButton("Pizza").setPosition(640, 550).setImages(img5,imgB5,img5).updateSize();MAIN5.hide();
   MAIN6 = cp5.addButton("Bread").setPosition(825, 550).setImages(img6,imgB6,img6).updateSize();MAIN6.hide();
   MAIN7 =cp5.addButton("Cake").setPosition(1010, 550).setImages(img7,imgB7,img7).updateSize();MAIN7.hide();
   MAIN8 =cp5.addButton("Donut").setPosition(1195, 550).setImages(img8,imgB8,img8).updateSize();MAIN8.hide();
   MAIN9 =  cp5.addButton("Popcorn").setPosition(640, 750).setImages(img9,imgB9,img9).updateSize();MAIN9.hide();
   MAIN10 = cp5.addButton("Oatmeal").setPosition(825, 750).setImages(img10,imgB10,img10).updateSize();MAIN10.hide();
   MAIN11 =cp5.addButton("Soup").setPosition(1010, 750).setImages(img11,imgB11,img11).updateSize();MAIN11.hide();
   MAIN12 =cp5.addButton("Rice").setPosition(1195, 750).setImages(img12,imgB12,img12).updateSize();MAIN12.hide();
   MAIN13 =cp5.addButton("Sauce").setPosition(1010, 950).setImages(img13,imgB13,img13).updateSize();MAIN13.hide();
   MAIN14 =cp5.addButton("Eggs").setPosition(1195, 950).setImages(img14,imgB14,img14).updateSize();MAIN14.hide();
   MAIN15 =cp5.addButton("Vegetables").setPosition(640, 950).setImages(img15,imgB15,img15).updateSize();MAIN15.hide();
   MAIN16 =cp5.addButton("Pasta").setPosition(825, 950).setImages(img16,imgB16,img16).updateSize();MAIN16.hide();
   MAIN17 =cp5.addButton("Noodles").setPosition(1010, 1150).setImages(img17,imgB17,img17).updateSize();MAIN17.hide();
   MAIN18=cp5.addButton("Bacon").setPosition(1195, 1150).setImages(img18,imgB18,img18).updateSize();MAIN18.hide();
   MAIN19 =cp5.addButton("Hotdogs").setPosition(640, 1150).setImages(img19,imgB19,img19).updateSize();MAIN19.hide();
   MAIN20 =cp5.addButton("Nachos").setPosition(825, 1150).setImages(img20,imgB20,img20).updateSize();MAIN20.hide();
   MAIN21 =cp5.addButton("Brownies").setPosition(1010, 1350).setImages(img21,imgB21,img21).updateSize();MAIN21.hide();
   MAIN22 =cp5.addButton("Pumpking").setPosition(1195, 1350).setImages(img22,imgB22,img22).updateSize();MAIN22.hide();
   MAIN23 =cp5.addButton("Smores").setPosition(640, 1350).setImages(img23,imgB23,img23).updateSize();MAIN23.hide();
   MAIN24 =cp5.addButton("Chicken").setPosition(825, 1350).setImages(img24,imgB24,img24).updateSize(); MAIN24.hide(); 
   CLOCK = cp5.addToggle("clockType").setPosition(650, 400).setSize(700,150).setValue(1).setImages(imgAnalogClock,imgDigitalClock);cp5.setFont(font4); CLOCK.hide();
   SETTING1 = cp5.addToggle("cookType").setPosition(650, 675).setSize(700,150).setImages(imgExpressStart, imgQuickStart);cp5.setFont(font4); SETTING1.hide();
   SETTING2 = cp5.addToggle("pairPhone").setPosition(650, 950).setSize(700,150).setImages(loadImage("pairing.png"),loadImage("pairing2.jpeg"));cp5.setFont(font4); SETTING2.hide();
   SETTING3 = cp5.addToggle("backgroundPhoto").setPosition(650, 1225).setSize(700,150).setImages(loadImage("upload.jpg"),loadImage("upload2.gif"));cp5.setFont(font4); SETTING3.hide();
   SETTING4 = cp5.addSlider("R").setPosition(650, 1600).setSize(700,40).setRange(0,255).setColorForeground(#8B0000).setColorBackground(#F08080).setColorActive(#FF0000);cp5.setFont(font4);SETTING4.hide();
   SETTING5 = cp5.addSlider("G").setPosition(650, 1650).setSize(700,40).setRange(0,255).setColorForeground(#006400).setColorBackground(#3CB371).setColorActive(#00FF00);cp5.setFont(font4);SETTING5.hide();
   SETTING6 = cp5.addSlider("B").setPosition(650, 1700).setSize(700,40).setRange(0,255).setColorForeground(#00008B).setColorBackground(#87CEFA).setColorActive(#0000FF);cp5.setFont(font4);SETTING6.hide();
   BUTTON1 = cp5.addButton("888").setValue(350).setPosition(850,565).setSize(225,100).setColorForeground(CF).setColorBackground(color(127,127,127,127)).setColorActive(CA); BUTTON1.hide();
   BUTTON2 = cp5.addButton("8888").setValue(500).setPosition(850,1265).setSize(225,100).setColorForeground(CF).setColorBackground(color(127,127,127,127)).setColorActive(CA);BUTTON2.hide();
   TEMPERATURE = cp5.addSlider("Temp Select").setPosition(650, 400).setSize(700,100).setValue(450).setRange(150,650).setColorForeground(CF).setColorBackground(CB).setColorActive(CA); cp5.setFont(font4);TEMPERATURE.hide();
   POWER = cp5.addSlider("Power Select").setPosition(650, 1100).setSize(700,100).setValue(700).setRange(100,900).setColorForeground(CF).setColorBackground(CB).setColorActive(CA); cp5.setFont(font4);POWER.hide();
   SOUND = cp5.addToggle("soundType").setPosition(650, 1500).setSize(700,150).setValue(1).setImages(loadImage("sound.png"),loadImage("sound2.png"));cp5.setFont(font4); SOUND.hide();
   LEVEL1 =cp5.addButton("Blue").setPosition(630, 450).setImages(imglevel1,imgLevel1,imgLevel1).updateSize();LEVEL1.hide();
   LEVEL2 =cp5.addButton("Medium Rare").setPosition(630, 650).setImages(imglevel2,imgLevel2,imgLevel2).updateSize();LEVEL2.hide();
   LEVEL3 =cp5.addButton("Rare").setPosition(630, 850).setImages(imglevel3,imgLevel3,imgLevel3).updateSize();LEVEL3.hide();
   LEVEL4 =cp5.addButton("Medium").setPosition(630, 1050).setImages(imglevel4,imgLevel4,imgLevel4).updateSize();LEVEL4.hide();
   LEVEL5 =cp5.addButton("Medium Well").setPosition(630, 1250).setImages(imglevel5,imgLevel5,imgLevel5).updateSize();LEVEL5.hide();
   LEVEL6 =cp5.addButton("Welldone").setPosition(630, 1450).setImages(imglevel6,imgLevel6,imgLevel6).updateSize();LEVEL6.hide();
 OPENDOOR = cp5.addButton("doorOpen").setPosition(100,200).setSize(200,1600).setLabel("DOOR").setColorForeground(CF).setColorBackground(CB).setColorActive(CA); cp5.setFont(font4); QUICKSWITCH.hide();
    
   rectMode(CENTER);  imageMode(CENTER); textAlign(CENTER);
    // Analog Clock Parameters     
   stroke(255);  int radius = 350;  secondsRadius = radius * 0.72;  minutesRadius = radius * 0.60;  hoursRadius = radius * 0.50;  clockDiameter = radius * 1.8;  cx = 1000;  cy = 600; 
   
   
   resting();
   }

void draw(){

  background(#D3D3D3);
//Control Screen Frame
  fill(R,G,B);   stroke(#C0C0C0);    strokeWeight(20);   rect(width/2, height/2, 800, 1900);
  
//Home Screen  
if(Home==1){
    textFont(font1);  strokeWeight(1);     stroke(255,255,255);     fill(0,0,0);     rect(1000, 600, 750, 1050, 3, 20, 20, 20);
    //Analog Clock
    if(analogClock == 1){ 
      fill(80);       noStroke();       ellipse(cx, cy, clockDiameter, clockDiameter);
      image(imgClock, cx, cy);
      float s = map(second(),0,60,0,TWO_PI)-HALF_PI; float m = map(minute() + norm(second(),0,60),0,60,0,TWO_PI)-HALF_PI; float h = map(hour()+norm(minute(),0,60),0,24,0,TWO_PI * 2)-HALF_PI;
      stroke(255);       strokeWeight(2);      line(cx, cy, cx + cos(s) * secondsRadius, cy + sin(s) * secondsRadius);//Seconds Hand
      strokeWeight(4);    line(cx, cy, cx + cos(m) * minutesRadius, cy + sin(m) * minutesRadius);//Minutes Hand
      strokeWeight(8);    line(cx, cy, cx + cos(h) * hoursRadius, cy + sin(h) * hoursRadius); //Hours Hand
      strokeWeight(1);  beginShape(POINTS);  for (int a = 0; a < 360; a+=6) {float angle=radians(a); float x=cx+cos(angle)*secondsRadius; float y=cy+sin(angle)*secondsRadius;vertex(x, y); } endShape(); 
      strokeWeight(5); stroke(#39FF14);  beginShape(POINTS);  for (int a = 0; a < 360; a+=30) {float angle=radians(a); float x=cx+cos(angle)*secondsRadius; float y=cy+sin(angle)*secondsRadius;vertex(x, y); } endShape(); 
      //Draw Date   
      int day = day(); int mon = month(); int year = year();  
      String Day = String.valueOf(day);       if (mon==1){Mon = "Jan";} else if (mon==2){Mon = "Feb";}else if (mon==3){Mon = "Mar";}else if (mon==4){Mon = "Apr";}else if (mon==5){Mon = "May";}
      else if(mon==6){Mon="June";}else if(mon==7){Mon="July";}else if(mon==8){Mon="Aug";}else if(mon==9){Mon="Sept";}else if(mon==10){Mon="Oct";}else if(mon==11){Mon="Nov";}else{Mon="Dec";} 
      if (day==0){Ext = "st";} else if (day==2){Ext = "nd";}else {Ext = "th";} //Date Number text
      String Year = String.valueOf(year);  String Date = Day+ Ext +" " + Mon +" " +Year;       fill(255 ,255, 255);    text(Date, 1000, 1050); //Display Date
      } image(imgHome, 700, 200); 
     if(digitalClock == 2){ 
      //Draw Time
      int seconds = second(); int minutes = minute(); int hours = hour();
      if(hours>9){hOURS = String.valueOf(hours);}else{hOURS = "0"+String.valueOf(hours);} if(minutes>9){mINUTES = String.valueOf(minutes);}else{mINUTES = "0"+String.valueOf(minutes);}
      String TIME =  hOURS +" : " + mINUTES ;       fill(255 ,255, 255); textFont(font5);   text(TIME, 1000, 650); //Display Time
      //Draw Date   
      int day = day(); int mon = month(); int year = year();  
      String Day = String.valueOf(day);       if (mon==1){Mon = "Jan";} else if (mon==2){Mon = "Feb";}else if (mon==3){Mon = "Mar";}else if (mon==4){Mon = "Apr";}else if (mon==5){Mon = "May";}
      else if(mon==6){Mon="June";}else if(mon==7){Mon="July";}else if(mon==8){Mon="Aug";}else if(mon==9){Mon="Sept";}else if(mon==10){Mon="Oct";}else if(mon==11){Mon="Nov";}else{Mon="Dec";} 
      if (day==0){Ext = "st";} else if (day==2){Ext = "nd";}else {Ext = "th";} //Date Number text
      String Year = String.valueOf(year);  String Date = Day+ Ext +" " + Mon +" " +Year;   textFont(font1);    fill(255 ,255, 255);    text(Date, 1000, 750); //Display Date
      } image(imgHome, 700, 200);     
    }
  if(Setting==1){textAlign(CENTER); textFont(font1);   fill(155 ,155, 155);    textSize(65);  text("Background Colour", 1000, 1580);
    SETTING1.show();SETTING2.show();SETTING3.show();SETTING4.show();SETTING5.show();SETTING6.show();CLOCK.show();OVENSETTINGS.show();}else{ SETTING1.hide();SETTING2.hide();SETTING3.hide();SETTING4.hide();SETTING5.hide();
    SETTING6.hide();CLOCK.hide();OVENSETTINGS.hide();
  }
  if(Barcode==1){textAlign(CENTER); textFont(font1);   fill(155 ,155, 155);     text("Scan Barcode", 1000, 250); textSize(50); text("Please Align barcode", 1000, 400); image(imgScanning, 1000, 1000);  }
  if(Level==1){textAlign(CENTER); textFont(font1);   fill(155 ,155, 155);    textSize(73);  text("Cook Level", 1000, 350);
    LEVEL1.show(); LEVEL2.show(); LEVEL3.show(); LEVEL4.show(); LEVEL5.show(); LEVEL6.show();} else{ LEVEL1.hide(); LEVEL2.hide(); LEVEL3.hide(); LEVEL4.hide(); LEVEL5.hide(); LEVEL6.hide();}
  if(Temp==1){textFont(font1);   fill(155 ,155, 155); Temperature=int(cp5.getController("Temp Select").getValue()); Power=int(cp5.getController("Power Select").getValue());
    textSize(73);  text("Temperature", 1000, 300); text("Power", 1000, 1000); textFont(font); text(Temperature, 1000,650); text(Power, 1000,1350);}
  if(Finished==1){textAlign(CENTER); textFont(font1);   fill(155 ,155, 155);   textSize(75);   text("Your Food Is Ready", 1000, 400);image(imgFinished, 1000, 1000);  }
  if(Main==1){textAlign(CENTER);textFont(font1);fill(155 ,155, 155);text("Main Menu",1000,250); MAIN1.show();MAIN2.show();MAIN3.show();MAIN4.show();MAIN5.show();MAIN6.show();MAIN7.show();
       MAIN8.show();MAIN9.show();MAIN10.show(); MAIN11.show();MAIN12.show();MAIN13.show();MAIN14.show();MAIN15.show();MAIN16.show();MAIN17.show();MAIN18.show();MAIN19.show();MAIN20.show();
       MAIN21.show();MAIN22.show();MAIN23.show();MAIN24.show();}
       else{text("",0,0); MAIN1.hide();MAIN2.hide();MAIN3.hide();MAIN4.hide();MAIN5.hide();MAIN6.hide();MAIN7.hide();
       MAIN8.hide();MAIN9.hide();MAIN10.hide(); MAIN11.hide();MAIN12.hide();MAIN13.hide();MAIN14.hide();MAIN15.hide();MAIN16.hide();MAIN17.hide();MAIN18.hide();MAIN19.hide();MAIN20.hide();
       MAIN21.hide();MAIN22.hide();MAIN23.hide();MAIN24.hide();       }
  if(Quick==1){strokeWeight(1); fill(0,0,0); rect(1000, 370, 600, 250, 3, 20, 20, 20);   rect(1000, 1570, 620, 250, 20, 20, 20, 20); 
            textAlign(CENTER); textFont(font2);fill(37,37,37);text("88:88",1000,450);fill(CA);if(pAUSE==0){text("PAUSE",1000,1650);}else{text("START",1000,1650);}
            startTimer.countDown();if(pAUSE==1){startTimer.countUp();}fill(255);timeRemaining = startTimer.getTime()/60;minutesRemaining=(int)timeRemaining; float B =timeRemaining- minutesRemaining;
            Float C=B*60; secondsRemaining=int(C); if(secondsRemaining<10){secondSRemaining="0"+String.valueOf(secondsRemaining);} else{secondSRemaining= String.valueOf(secondsRemaining);};
            fill(255,255,255);textAlign(RIGHT);text(minutesRemaining,975,450); textAlign(RIGHT);text(secondSRemaining,1250,450);textAlign(CENTER);text(":",1000,450);    }
  if(Express==1){
  textFont(font); strokeWeight(1); fill(0,0,0); rect(775, 850, 180, 120, 3, 20, 20, 20);   rect(1005, 850, 180, 120, 20, 20, 20, 20);  rect(1230, 850,180, 120, 20, 3, 20, 20);  
  rect(775, 1020, 180, 120, 20, 20, 20, 20);   rect(1005, 1020, 180, 120, 20, 20, 20, 20);  rect(1230, 1020, 180, 120, 20, 20, 20, 20);  rect(775, 1190, 180, 120, 20, 20, 20, 20);  
  rect(1005, 1190, 180, 120, 20, 20, 20, 20);  rect(1230, 1190, 180, 120, 20, 20, 20, 20);  rect(775, 1360, 180, 120, 20, 20, 20, 20);   rect(1005, 1360, 180, 120, 20, 20, 20, 20); 
  rect(1230, 1360, 180, 120, 20, 20, 20, 20);    rect(840, 1540, 280, 135, 20, 20, 20, 3);  rect(1175, 1540, 280, 135, 20, 20, 3, 20);
  strokeWeight(10); stroke(#C0C0C0); rect(1000, 425, 600, 250, 50, 50, 50, 50);
  //Numbers and text for Express Option
  fill(255 ,255, 255);    text("1", 770,880);  text("2", 1000, 880);  text("3", 1215, 880);  text("4", 770, 1050);  text("5", 1000, 1050);
  text("6", 1215, 1050);  text("7", 770, 1220);  text("8", 1000, 1220);  text("9", 1215, 1220);  text("0", 1000, 1390);  
  fill(255 ,0, 0);    text("STOP", 850, 1575);   
  fill(0 ,255, 0);    text("START", 1175, 1575);
  textSize(66);    fill(255 ,255, 255);    text("+30Sec", 775, 1390);    text("Reset", 1235, 1390);
  textFont(font2); if(countLight==0){fill(#414141);}else{fill(255);}   text(total, 1000, 500);  
  }
}
public void mousePressed(){
      if(Home==1 && mouseX >625 && mouseX < 1375 && mouseY >15 && mouseY <1150 ) {
        Quick=0;Express=0;Main=1;Level=0;Temp=0; Home=0; Setting=0;Finished=0;Barcode=0; analogClock=0; digitalClock=0;HOME.show();BARCODE.show();SETTING.show();
        KNOB.hide();EXPRESSSWITCH.hide();QUICKSWITCH.hide(); if(soundOn==1){tts.speak("Main Menu");}}
      if(Express==1 && mouseX >685 && mouseX < 865 && mouseY >790 && mouseY <910 ) { key1="1";  count = count+1;if(count ==1){T1 = key1;} else if(count==2){T2=key1;} 
            else if(count==3){T3=key1;}else if(count==4){T4=key1;}else if(count==5){ count=0;if(soundOn==1){tts.speak("Resetting");}}if(soundOn==1){tts.speak("One");}}
      if(Express==1 && mouseX >915 && mouseX < 1095 && mouseY >790 && mouseY <910 ) { key2="2";  count = count+1;if(count ==1){T1 = key2;} else if(count==2){T2=key2;} 
            else if(count==3){T3=key2;}else if(count==4){T4=key2;}else if(count==5){ count=0;if(soundOn==1){tts.speak("Resetting");}}if(soundOn==1){tts.speak("Two");}}
      if(Express==1 && mouseX >1140 && mouseX < 1320 && mouseY >790 && mouseY <910 ) { key3="3"; count = count+1;if(count ==1){T1 = key3;} else if(count==2){T2=key3;} 
            else if(count==3){T3=key3;}else if(count==4){T4=key3;}else if(count==5){ count=0;if(soundOn==1){tts.speak("Resetting");}}if(soundOn==1){tts.speak("Three");}}
      if(Express==1 && mouseX >685 && mouseX < 865 && mouseY >960 && mouseY <1080 ) { key4="4";  count = count+1;if(count ==1){T1 = key4;} else if(count==2){T2=key4;} 
          else if(count==3){T3=key4;}else if(count==4){T4=key4;}else if(count==5){ count=0;if(soundOn==1){tts.speak("Resetting");}}if(soundOn==1){tts.speak("Four");}}
      if(Express==1 && mouseX >915 && mouseX < 1095 && mouseY >960 && mouseY <1080 ) { key5="5"; count = count+1;if(count ==1){T1 = key5;} else if(count==2){T2=key5;} 
           else if(count==3){T3=key5;}else if(count==4){T4=key5;}else if(count==5){ count=0;if(soundOn==1){tts.speak("Resetting");}}if(soundOn==1){tts.speak("Five");}}
      if(Express==1 && mouseX >1140 && mouseX < 1320 && mouseY >960 && mouseY <1080 ) { key6="6"; count = count+1;if(count ==1){T1 = key6;} else if(count ==2){T2=key6;} 
          else if(count==3){T3=key6;}else if(count==4){T4=key6;}else if(count==5){ count=0;if(soundOn==1){tts.speak("Resetting");}}if(soundOn==1){tts.speak("Six");}}
      if(Express==1 && mouseX >685 && mouseX < 865 && mouseY >1130 && mouseY <1250 ) { key7="7"; count = count+1;if(count ==1){T1 = key7;} else if(count==2){T2=key7;} 
          else if(count==3){T3=key7;}else if(count==4){T4=key7;}else if(count==5){ count=0;if(soundOn==1){tts.speak("Resetting");}}if(soundOn==1){tts.speak("Seven");}}
      if(Express==1 && mouseX >915 && mouseX < 1095 && mouseY >1130 && mouseY <1250 ) { key8="8"; count = count+1;if(count ==1){T1 = key8;} else if(count==2){T2=key8;} 
          else if(count==3){T3=key8;}else if(count==4){T4=key8;}else if(count==5){ count=0;if(soundOn==1){tts.speak("Resetting");}}if(soundOn==1){tts.speak("Eight");}}
      if(Express==1 && mouseX >1140 && mouseX < 1320 && mouseY >1130 && mouseY <1250 ) { key9="9"; count = count+1;if(count ==1){T1 = key9;} else if(count==2){T2=key9;} 
          else if(count==3){T3=key9;}else if(count==4){T4=key9;}else if(count==5){ count=0;if(soundOn==1){tts.speak("Resetting");}}if(soundOn==1){tts.speak("Nine");}}
      if(Express==1 && mouseX >685 && mouseX < 865 && mouseY >1300 && mouseY <1420 ){if(soundOn==1){tts.speak("Thirty seconds more");}
         if(count ==1){count=4; T4=T1;T1="0";T2="0";T3="3";} 
         else if(count ==2){count=4; T4=T2;T3=T1;T1="0";T2="0";int inum = Integer.parseInt(T3); inum= inum +3; if(inum<10){T3 = String.valueOf(inum);} 
         else{T3= String.valueOf(inum-10);T2="1";}} 
         else if(count ==3){count=4; T4=T3;T3=T2;T2=T1;T1="0";int inum = Integer.parseInt(T3); inum= inum +3; if(inum<10){T3 = String.valueOf(inum);} 
            else{T3 = String.valueOf(inum-10);int inum2 = Integer.parseInt(T2); inum2= inum2+1; if(inum2<10){T2 = String.valueOf(inum2);} else{T2 = String.valueOf(inum2-10);T1="1";}}} 
        else{int inum = Integer.parseInt(T3); inum= inum +3; if(inum<10){T3 = String.valueOf(inum);} else{T3 = String.valueOf(inum-10);int inum2 = Integer.parseInt(T2); inum2= inum2+1;
             if(inum2<10){T2 = String.valueOf(inum2);} else{T2 = String.valueOf(inum2-10);int inum1 = Integer.parseInt(T1); inum1= inum1+1; T1 = String.valueOf(inum1);}} }}
      if(Express==1 && mouseX >915 && mouseX < 1095 && mouseY >1300 && mouseY <1420 ) { key11="0"; count = count+1;if(count ==1){T1 = key11;} else if(count==2){T2=key11;}
          else if(count==3){T3=key11;}else if(count==4){T4=key11;}else if(count==5){ count=0;if(soundOn==1){tts.speak("Resetting");}} if(soundOn==1){tts.speak("Zero");}} 
      if(Express==1 && mouseX >1140 && mouseX < 1320 && mouseY >1300 && mouseY <1420 ) { T1="0";T2="0";T3="0";T4="0"; if(soundOn==1){tts.speak("Reset");}}
      if(Express==1 && mouseX >700 && mouseX < 980 && mouseY >1470 && mouseY <1610 ) {T1="0";T2="0";T3="0";T4="0";if(soundOn==1){tts.speak("Stop");}
        Quick=0; Express=0; Main=0; Level=0; Temp=0; Home=0; Setting=0;Finished=1; Barcode=0; analogClock=0; digitalClock=0; 
        QUICKSWITCH.hide();EXPRESSSWITCH.hide();KNOB.hide(); REST.hide(); HOME.hide(); BARCODE.hide();SETTING.hide(); cp5.getController("Knob").setValue(0);  }
      if(Express==1 && mouseX >1035 && mouseX < 1315 && mouseY >1470 && mouseY <1610 ) {if(soundOn==1){tts.speak("Start");}
          Quick=1; Express=0; Main=0; Level=0; Temp=0; Home=0; Setting=0;Finished=0; Barcode=0;  QUICKSWITCH.hide(); KNOB.show(); EXPRESSSWITCH.hide(); 
          HOME.show();BARCODE.show();SETTING.show();REST.hide();
        totalnum= T1+T2;totalnum2= T3+T4;initialTime=Integer.parseInt(totalnum)+(initialTime=Integer.parseInt(totalnum2))/60; cp5.getController("Knob").setValue(initialTime);
        startTimer = new Timer(timeRemaining*60);T1="0";T2="0";T3="0";T4="0"; //tts.speak("cook for" + initialTime + "minutes" );  
      }
      if(count ==0){total="00:00";} 
          else if(count ==1){total="00:0"+T1; countLight=1;} 
          else if(count ==2){total="00:"+T1+T2;countLight=1;}
          else if(count==3){T4=key1;; total="0"+T1+":"+T2+T3;countLight=1;} 
          else if(count ==4){total=T1+T2+":"+T3+T4;countLight=1;}
      if(Quick==1 && mouseX >680 && mouseX < 1320 && mouseY >1425 && mouseY <1750 ) {if(pAUSE==0){pAUSE=1; tts.speak("Pause");}else{pAUSE=0;if(soundOn==1){tts.speak("Resuming heating");} }}
    }
void homeIcon(){
   cp5.getController("Knob").setValue(0); Quick=0; Express=0; Main=1; Level=0; Temp=0; Home=0; Setting=0;Finished=0; Barcode=0; 
  if( quickSwitch==1){ QUICKSWITCH.show();}else{EXPRESSSWITCH.show();};  REST.show(); BARCODE.show();SETTING.show();SOUND.hide();
  KNOB.hide(); QUICKSWITCH.hide(); EXPRESSSWITCH.hide();BUTTON1.hide();BUTTON2.hide();TEMPERATURE.hide();POWER.hide();if(soundOn==1){tts.speak("Home");}
}
public void resting(){
   cp5.getController("Knob").setValue(0); Quick=0; Express=0; Main=0; Level=0; Temp=0; Home=1; Setting=0;Finished=0; Barcode=0; analogClock=clockNum; digitalClock=clockNum;
  if( quickSwitch==1){ QUICKSWITCH.show();}else{EXPRESSSWITCH.show();};
  KNOB.hide(); REST.hide(); HOME.hide();   BARCODE.hide();SETTING.hide(); BUTTON1.hide();BUTTON2.hide();TEMPERATURE.hide();POWER.hide();if(soundOn==1){tts.speak("Microwave Home");}
}  
  public void doorOpen(){
         cp5.getController("Knob").setValue(0); Quick=0; Express=0; Main=0; Level=0; Temp=0; Home=1; Setting=0;Finished=0; Barcode=0; analogClock=clockNum; digitalClock=clockNum;
        if( quickSwitch==1){ QUICKSWITCH.show();}else{EXPRESSSWITCH.show();};
        KNOB.hide(); REST.hide(); HOME.hide();   BARCODE.hide();SETTING.hide(); BUTTON1.hide();BUTTON2.hide();TEMPERATURE.hide();POWER.hide();if(soundOn==1){tts.speak("Microwave Home");}
      }  
public void cookType(){
  if( quickSwitch==1){ quickSwitch=0;if(soundOn==1){tts.speak("Express Switch set as Default");}} else{quickSwitch=1;if(soundOn==1){tts.speak("Quick Switch set as Default");}}
} 

public void soundType(){
  if( soundOn==1){ soundOn=0;tts.speak("Sound is Turned Off");} else{soundOn=1;tts.speak("Sound is Turned On");}
} 
public void clockType(){
  if(clockNum==1){ clockNum=2;}
  else{clockNum=1;if(soundOn==1){tts.speak("Analog Clock set as Default set as Default");} }
}
public void barcodeIcon(){
  Quick=0; Express=0; Main=0; Level=0; Temp=0; Home=0; Setting=0;Finished=0; Barcode=1; if(soundOn==1){tts.speak("Align Barcode to scan");}
  HOME.show(); BARCODE.show(); SETTING.show(); 
  REST.hide(); KNOB.hide(); QUICKSWITCH.hide(); EXPRESSSWITCH.hide();BUTTON1.hide();BUTTON2.hide();TEMPERATURE.hide();POWER.hide();SOUND.hide();
}
public void settingIcon(){
  Quick=0; Express=0; Main=0; Level=0; Temp=0; Home=0; Setting=1;Finished=0; Barcode=0; if(soundOn==1){tts.speak("Settings");}
  HOME.show(); BARCODE.show(); SETTING.show(); BUTTON1.hide();BUTTON2.hide();TEMPERATURE.hide();POWER.hide(); SOUND.hide();
  REST.hide(); KNOB.hide(); QUICKSWITCH.hide(); EXPRESSSWITCH.hide();
}
public void ovenSettings(){
  Quick=0; Express=0; Main=0; Level=0; Temp=1; Home=0; Setting=0;Finished=0; Barcode=0; if(soundOn==1){tts.speak("Adjust Microwave Settings");}
   BUTTON1.show();BUTTON2.show();TEMPERATURE.show();POWER.show(); SOUND.show(); 
  HOME.show(); BARCODE.show(); SETTING.show(); 
  REST.hide(); KNOB.hide(); QUICKSWITCH.hide(); EXPRESSSWITCH.hide();
}
public void Coffee(){
  initialTime=1; cp5.getController("Knob").setValue(initialTime); 
  Quick=1; Express=0; Main=0; Level=0; Temp=0; Home=0; Setting=0;Finished=0; Barcode=0; if(soundOn==1){tts.speak("Heating Coffee for 1 Minute");}
  HOME.show(); BARCODE.show();SETTING.show(); KNOB.show(); 
  REST.hide(); QUICKSWITCH.hide(); EXPRESSSWITCH.hide();
}
void Steak(){
  Quick=0; Express=0; Main=0; Level=1; Temp=0; Home=0; Setting=0;Finished=0; Barcode=0; QUICKSWITCH.hide(); EXPRESSSWITCH.hide();
  HOME.show(); BARCODE.show(); SETTING.show(); if(soundOn==1){tts.speak("Select Steak cook Level");}
  KNOB.hide(); REST.hide();
}
public void quick_Start(){
  initialTime=1.50;cp5.getController("Knob").setValue(initialTime); if(soundOn==1){tts.speak("Heating for one minute and thirty seconds");}
  Quick=1; Express=0; Main=0; Level=0; Temp=0; Home=0; Setting=0;Finished=0; Barcode=0; QUICKSWITCH.hide(); KNOB.show(); EXPRESSSWITCH.hide(); 
  REST.show();BARCODE.show();SETTING.show();
}
public void express_Start(){
  REST.show();BARCODE.show();SETTING.show(); if(soundOn==1){tts.speak("Enter Cooking Time");}Quick=0; Express=1; Main=0; Level=0; Temp=0; Home=0; Setting=0;Finished=0;
  Barcode=0; QUICKSWITCH.hide(); KNOB.hide(); EXPRESSSWITCH.hide();
}
public void Knob(){
  REST.show();BARCODE.show();SETTING.show(); 
  timeRemaining = cp5.getController("Knob").getValue(); timeRemaining = cp5.getController("Knob").getValue(); startTimer = new Timer(timeRemaining*60);
  Quick=1; Express=0; Main=0; Level=0; Temp=0; Home=0; Setting=0;Finished=0; Barcode=0;  QUICKSWITCH.hide(); KNOB.show(); EXPRESSSWITCH.hide();
}
void finished(){ if(soundOn==1){tts.speak("Your Meal is Ready");}
  Quick=0; Express=0; Main=0; Level=0; Temp=0; Home=0; Setting=0;Finished=1; Barcode=0; 
  QUICKSWITCH.hide();REST.show(); BARCODE.show();SETTING.show();  KNOB.hide(); QUICKSWITCH.hide(); EXPRESSSWITCH.hide();
}

public void Blue(){
  initialTime=1.50;cp5.getController("Knob").setValue(initialTime); if(soundOn==1){tts.speak("Heating for one minute and thirty seconds");}
  Quick=1; Express=0; Main=0; Level=0; Temp=0; Home=0; Setting=0;Finished=0; Barcode=0; QUICKSWITCH.hide(); KNOB.show(); EXPRESSSWITCH.hide(); 
  REST.show();BARCODE.show();SETTING.show();}
public void MediumRare(){
  initialTime=3.50;cp5.getController("Knob").setValue(initialTime); if(soundOn==1){tts.speak("Heating for three minutes and thirty seconds");}
  Quick=1; Express=0; Main=0; Level=0; Temp=0; Home=0; Setting=0;Finished=0; Barcode=0; QUICKSWITCH.hide(); KNOB.show(); EXPRESSSWITCH.hide(); 
  REST.show();BARCODE.show();SETTING.show();}
public void Rare(){
  initialTime=5.50;cp5.getController("Knob").setValue(initialTime); if(soundOn==1){tts.speak("Heating for five minutes and thirty seconds");}
  Quick=1; Express=0; Main=0; Level=0; Temp=0; Home=0; Setting=0;Finished=0; Barcode=0; QUICKSWITCH.hide(); KNOB.show(); EXPRESSSWITCH.hide(); 
  REST.show();BARCODE.show();SETTING.show();}
public void Medium(){
  initialTime=7.50;cp5.getController("Knob").setValue(initialTime); if(soundOn==1){tts.speak("Heating for seven minutes and thirty seconds");}
  Quick=1; Express=0; Main=0; Level=0; Temp=0; Home=0; Setting=0;Finished=0; Barcode=0; QUICKSWITCH.hide(); KNOB.show(); EXPRESSSWITCH.hide(); 
  REST.show();BARCODE.show();SETTING.show();}
public void MediumWell(){
  initialTime=9.50;cp5.getController("Knob").setValue(initialTime);if(soundOn==1){tts.speak("Heating for nine minutes and thirty seconds");}
  Quick=1; Express=0; Main=0; Level=0; Temp=0; Home=0; Setting=0;Finished=0; Barcode=0; QUICKSWITCH.hide(); KNOB.show(); EXPRESSSWITCH.hide(); 
  REST.show();BARCODE.show();SETTING.show();}
public void Welldone(){
  initialTime=11.50;cp5.getController("Knob").setValue(initialTime);if(soundOn==1){tts.speak("Heating for Eleven minutes and thirty seconds");}
  Quick=1; Express=0; Main=0; Level=0; Temp=0; Home=0; Setting=0;Finished=0; Barcode=0; QUICKSWITCH.hide(); KNOB.show(); EXPRESSSWITCH.hide(); 
  REST.show();BARCODE.show();SETTING.show();}
