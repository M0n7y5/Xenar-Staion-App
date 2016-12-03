import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import controlP5.*; 
import de.looksgood.ani.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class Xenar_Station extends PApplet {




// Deklarov\u00e1n\u00ed a inicializace prom\u011bnn\u00fdch 
int aniMenuDur = 1;
float menuBarW = 65;
boolean menuBarClosed = false;
// Debug helper
boolean debug = true;
// Konstruktory
ControlP5 cp5;
// Inicializace font\u016f
PFont robRegular;
PFont robLight;


public void setup() {
  
 //surface.setResizable(true);
  frameRate(80);
  //textMode(SHAPE);
  initFonts();
  //fullScreen();
  Ani.init(this);					// Inicializace animac\u00ed
  cp5 = new ControlP5(this); 
  
}


public void draw() {
  noStroke();
  background(0xff596976);
  drawGUI();
  
}

public void mouseClicked(){

}

public void mouseReleased() {
	menuBarControl();
}
public void drawGUI(){
  String programName = "Xenar Station (Beta)";
  int day = day();
  int month = month();
  int year = year();
  int hour = hour();
  int minute = minute();
  String second = mySecond();
  //int second = second();
  String date = day+"/"+month+"/"+year;
  float responMid = (width-menuBarW)/2;
  //float upBar = (width/2)+menuBarW;
  //float upBarX = upBar-400;
  float upBarX = responMid-400;
  // left bar
  fill(0xffDB2C2C);
  rect(0,0,menuBarW,height);
  // Horn\u00ed li\u0161ta

  // String dayTime = "";
  fill(0xff3F90F0);
  rect(upBarX,0,800,30,0,0,120,120);
  fill(0xffFFFFFF);
  // Time
  textFont(robRegular);
  text(hour+":"+minute+":"+second, upBarX+10, 20);
  // Date
  float dateW = textWidth(date);
  text(date, ((upBarX+800)-dateW)-10, 20);

  float programNameW = textWidth(programName);
  textFont(robLight);
  text(programName, responMid-(programNameW/2), 20);


   if(debug){
    helpMe();
  }
  
}

public String mySecond(){
	int defaultSecond = second();
	String mySec = "";
	if (defaultSecond<10) {
		mySec = "0"+defaultSecond;
	}
	else{
		mySec = str(defaultSecond);
	}
	return mySec;


}


public void initFonts() {

	robRegular = createFont("Roboto-Regular.ttf", 20,true);
	robLight = createFont("Roboto-Light.ttf", 20,true);

}

public void helpMe(){
 fill(0xff0BFF00);
 rect(width/2,0,1,height);
 rect(0,height/2,width,1);

 // float fpsTextW = textWidth(str(frameRate));
 textFont(robRegular);
 text(frameRate, width-65, 18); 
}
// Pomucka pro menu

public void menuBarControl(){
  
 
  if(!menuBarClosed){
    Ani.to(this, aniMenuDur, "menuBarW", 0,Ani.CUBIC_OUT);
    menuBarClosed = true;
  }
  else{
    Ani.to(this, aniMenuDur, "menuBarW", 65,Ani.CUBIC_OUT);
    menuBarClosed = false;
  }
}
  public void settings() {  size(1024, 600, P3D);  smooth(); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Xenar_Station" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
