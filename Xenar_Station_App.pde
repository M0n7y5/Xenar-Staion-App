import controlP5.*;
import de.looksgood.ani.*;

// Deklarování a inicializace proměnných 
int aniMenuDur = 1;
float menuBarW = 75;
boolean menuBarClosed = false;
float leftCircleSize = 46;
float cTempSize, cGpsSize, cVoltageSize = 46;
float upBarH = 30;
float setupButtonS = 50;
// Debug helper
boolean debug = true;
// Konstruktory
ControlP5 cp5;
// Inicializace fontů
PFont robRegular;
PFont robLight;


Controller tempM;

void setup() {
  size(1024, 600, P3D);
  //surface.setResizable(true);
  frameRate(60);
  //textMode(SHAPE);
  initFonts();
  //fullScreen();
  Ani.init(this);	// Inicializace animací
  cp5 = new ControlP5(this); 

  cp5.addIcon("menu",5)
     .setPosition(0,-5)
     .setSize(75,75)
     .setFont(createFont("fontawesome-webfont.ttf", 55))
     .setFontIcons(#00f0c9, #00f0c9)
     //.setScale(0.9,1)
     .setColorActive(color(#3498DB))
     .setSwitch(true)
     .setColorForeground(color(#ECF0F1))
     .setColorBackground(color(#ECF0F1))
     .hideBackground()
     ;  

  cp5.addIcon("gps_menu",10)
     .setPosition(0,height/2)
     .setSize(45,45)
     //.setRoundedCorners(20)
     .setFont(createFont("fontawesome-webfont.ttf", 40))
     .setFontIcons(#00f0ac, #00f0ac)
     //.setScale(0.9,1)
     //.setSwitch(true)
     .setColorBackground(color(255,100))
     .setColorActive(color(#434545))
     .setColorForeground(color(#000000))
     .hideBackground()  
     ;  

  cp5.addIcon("temp_menu",5)
     .setPosition(0,height/2)
     .setSize(45,45)
     //.setRoundedCorners(20)
     .setFont(createFont("fontawesome-webfont.ttf", 40))
     .setFontIcons(#00f2c7, #00f2c7)
     //.setScale(0.9,1)
     //.setSwitch(true)
     .setColorBackground(color(255,100))
     .setColorActive(color(#434545))
     .setColorForeground(color(#000000))
     .hideBackground()
     ;  

  cp5.addIcon("voltage_menu",5)
     .setPosition(0,height/2)
     .setSize(45,45)
     //.setRoundedCorners(20)
     .setFont(createFont("fontawesome-webfont.ttf", 40))
     .setFontIcons(#00f0e7, #00f0e7)
     //.setScale(0.9,1)
     //.setSwitch(true)
     .setColorBackground(color(255,100))
     .setColorActive(color(#434545))
     .setColorForeground(color(#000000))
     .hideBackground()
     ;  

  cp5.addIcon("setup_menu",5)
     .setPosition(0,height/2)
     .setSize(25,25)
     //.setRoundedCorners(20)
     .setFont(createFont("fontawesome-webfont.ttf", 20))
     .setFontIcons(#00f013, #00f013)
     //.setScale(0.9,1)
     //.setSwitch(true)
     .setColorBackground(color(255,100))
     .setColorActive(color(#434545))
     .setColorForeground(color(#000000))
     .hideBackground()
     ;  
  
  smooth();
}


void draw() {


  noStroke();
  background(#404040);

  drawGUI();

  
}




void mouseClicked(){

}

void mouseReleased() {
	
}