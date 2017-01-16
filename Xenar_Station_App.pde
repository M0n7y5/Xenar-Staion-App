import controlP5.*;
import de.looksgood.ani.*;
import http.requests.*;

// Deklarování a inicializace proměnných
float aniMenuDur = 0.5;
float menuBarW = 75;
boolean menuBarClosed = false;
float leftCircleSize = 46;
float cTempSize, cGpsSize, cVoltageSize, cSetup = 46;
float upBarH = 30;
float upBarTextPosY;
boolean setupMenuClosed = false;
float setupButtonS = 50;
float bgBoxW; // sirka pozadi box
float bgBoxH; // vyska pozadi box
float bgBoxY;
float bgBoxX;
// moje cervena rgb(243,123,97)
// bila rgb(236,240,241)
int setupCcolorR = 236;
int setupCcolorG = 240;
int setupCcolorB = 241;

public PShape star;

// Debug helper
boolean debug = true;
// Konstruktory
ControlP5 cp5;
// Inicializace fontů
PFont robRegular;
PFont robLight;

void setup() {
  size(1024, 600, P3D);
  //fullScreen();
  // surface.setResizable(true);
  frameRate(60);
  //textMode(SHAPE);
  initFonts();
  
  Ani.init(this); // Inicializace


  cp5 = new ControlP5(this);

  cp5.addIcon("menu", 5)
  .setPosition(0, -5)
  .setSize(75, 75)
  .setFont(createFont("fontawesome-webfont.ttf", 55))
  .setFontIcons(#00f0c9, #00f0c9)
  //.setScale(0.9,1)
  .setColorActive(color(#f37b61))
  .setSwitch(true)
  .setColorForeground(color(#ECF0F1))
  .setColorBackground(color(#ECF0F1))
  .hideBackground()
  ;

  cp5.addIcon("gps_menu", 10)
  .setPosition(0, height / 2)
  .setSize(45, 45)
  //.setRoundedCorners(20)
  .setFont(createFont("fontawesome-webfont.ttf", 40))
  .setFontIcons(#00f0ac, #00f0ac)
  //.setScale(0.9,1)
  //.setSwitch(true)
  .setColorBackground(color(255, 100))
  .setColorActive(color(#434545))
  .setColorForeground(color(#000000))
  .hideBackground()
  ;

  cp5.addIcon("temp_menu", 5)
  .setPosition(0, height / 2)
  .setSize(45, 45)
  //.setRoundedCorners(20)
  .setFont(createFont("fontawesome-webfont.ttf", 40))
  .setFontIcons(#00f2c7, #00f2c7)
  //.setScale(0.9,1)
  //.setSwitch(true)
  .setColorBackground(color(255, 100))
  .setColorActive(color(#434545))
  .setColorForeground(color(#000000))
  .hideBackground()
  ;

  cp5.addIcon("voltage_menu", 5)
  .setPosition(0, height / 2)
  .setSize(45, 45)
  //.setRoundedCorners(20)
  .setFont(createFont("fontawesome-webfont.ttf", 40))
  .setFontIcons(#00f0e7, #00f0e7)
  //.setScale(0.9,1)
  //.setSwitch(true)
  .setColorBackground(color(255, 100))
  .setColorActive(color(#434545))
  .setColorForeground(color(#000000))
  .hideBackground()
  ;

  cp5.addIcon("setup_menu", 5)
  .setPosition(0, height / 2)
  .setSize(45, 45)
  //.setRoundedCorners(20)
  .setFont(createFont("fontawesome-webfont.ttf", 40))
  .setFontIcons(#00f013, #00f013)
  //.setScale(0.9,1)
  .setSwitch(true)
  .setColorBackground(color(255, 100))
  .setColorActive(color(#ECF0F1))
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

void mouseClicked() {

}

void mouseReleased() {

}

