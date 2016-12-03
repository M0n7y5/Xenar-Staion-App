import controlP5.*;
import de.looksgood.ani.*;

// Deklarování a inicializace proměnných 
int aniMenuDur = 1;
float menuBarW = 65;
boolean menuBarClosed = false;
// Debug helper
boolean debug = true;
// Konstruktory
ControlP5 cp5;
// Inicializace fontů
PFont robRegular;
PFont robLight;


void setup() {
  size(1024, 600, P3D);
 //surface.setResizable(true);
  frameRate(80);
  //textMode(SHAPE);
  initFonts();
  //fullScreen();
  Ani.init(this);					// Inicializace animací
  cp5 = new ControlP5(this); 
  smooth();
}


void draw() {
  noStroke();
  background(#596976);
  drawGUI();
  
}

void mouseClicked(){

}

void mouseReleased() {
	menuBarControl();
}