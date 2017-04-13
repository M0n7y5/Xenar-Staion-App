import controlP5.*;
import de.looksgood.ani.*;
import http.requests.*;
import processing.serial.*;
import java.util.*;

// Deklarování a inicializace proměnných
float aniMenuDur = 0.5;
float menuBarW = 75;
boolean menuBarClosed = false;
float leftCircleSize = 46;
float cTempSize, cGpsSize, cVoltageSize, cSetup = 46;
float upBarH = 30;
float upBarTextPosY;
float responMid, upBarX;
boolean setupMenuClosed = false;
float setupButtonS = 50;
float bgBoxW, bgBoxH, bgBoxY, bgBoxX; // ctverec na pozadi
int inBoxPadding = 10;
float inBgBoxX, inBgBoxY, inBgBoxW, inBgBoxH, inBgBoxMidX;
float inBgBoxMidY;
float kvadrantSizeW, kvadrantSizeH;
int padding = 25;
float chartData;
boolean isBgBoxEmpty;
boolean isTempMenuOpen, isGpsMenuOpen, isVoltageMenuOpen;
float bgBoxAniY;
float setupMenuX, setupMenuY;
//float chartSizeW, chartSizeH;
// moje cervena rgb(243,123,97)
// bila rgb(236,240,241)
int setupCcolorR = 236;
int setupCcolorG = 240;
int setupCcolorB = 241;
// Debug helper
boolean debug = true;
// Konstruktory
XGui xgui = new XGui();
ControlP5 cp5;
Chart temp;
Serial myPort;// Vytvoření objektu pro serialovou komunikaci
// Inicializace fontů
PFont robRegular;
PFont robLight;
PFont robMedium;

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
  .setSwitch(true)
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
  cp5.addScrollableList("serial_port")
  //.setPosition(100, 100)
  .setSize(300, 150)
  .setBarHeight(30)
  .setItemHeight(30)
  //.addItems(l)
  // .setType(ScrollableList.LIST) // currently supported DROPDOWN and LIST
  ;
  temp = cp5.addChart("dataflow")
         //.setPosition(50, 50)
         //.setSize(200, 100)
         .setRange(-20, 20)
         .setView(Chart.AREA) // use Chart.LINE, Chart.PIE, Chart.AREA, Chart.BAR_CENTERED
         .setStrokeWeight(8)
         .setColorCaptionLabel(#ECF0F1)
         .setColorBackground(#38393B)
         ;

  temp.addDataSet("incoming");
  temp.setData("incoming", new float[100]);
  smooth();
  isBgBoxEmpty = true;
}

void draw() {

  noStroke();
  background(#404040);
  //drawGUI();
  xgui.display();

  if (debug) {
    helpMe();
  }
}

void mouseClicked() {

}

void mouseReleased() {

}

