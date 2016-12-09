void drawGUI(){


  String programName = "Xenar Station (Beta)";
  int day = day();
  int month = month();
  int year = year();
  int hour = hour();
  int minute = minute();
  String second = mySecond();
  //int second = second();
  String date = day+"/"+month+"/"+year;
  String myTime = hour+":"+minute+":"+second;

  float responMid = ((width+menuBarW)/2);
  //float upBar = (width/2)+menuBarW;
  //float upBarX = upBar-400;
  float upBarX = responMid-400;

  int padding = 25;

  
  //translate(width-menuBarW, 50);

  fill(#38393B);
  rect(menuBarW+padding, 75, 
    (width-2*padding)-menuBarW, 
    (height-50)-(padding+10),15);


  // left bar
  fill(#595F63);
  rect(0,0,menuBarW,height);

  // menu kruhy, pozadí, left bar
  fill(#ECF0F1);
  Controller tempM = cp5.getController("temp_menu");
  tempM.setPosition(menuBarW-75/2-45/2, (height/2)-(45/2)-90);
  tempM.update();
  leftCircleAni("temp_menu", "cTempSize");
  ellipse(menuBarW-75/2, (height/2)-90, cTempSize, cTempSize);

  Controller gpsM = cp5.getController("gps_menu");
  gpsM.setPosition(menuBarW-75/2-45/2,(height/2)-(45)/2);
  gpsM.update();
  leftCircleAni("gps_menu", "cGpsSize");
  ellipse(menuBarW-75/2, (height/2), cGpsSize, cGpsSize);
  

  Controller voltageM = cp5.getController("voltage_menu");
  voltageM.setPosition(menuBarW-75/2-45/2,((height/2)-(45)/2)+90);
  voltageM.update();
  leftCircleAni("voltage_menu", "cVoltageSize");
  ellipse(menuBarW-75/2, (height/2)+90, cVoltageSize, cVoltageSize);

  // Horní lišta a nastavení
  fill(#595F63);
  rect(upBarX,0,800,30,0,0,90,90);
  triangle(width-setupButtonS, 0, width, 0, width, setupButtonS);
  Controller setupM = cp5.getController("setup_menu");
  setupM.setPosition(width-27, 2);
  setupM.update();

  fill(#ECF0F1);

// Vypsání textu, datumu a času na horní lištu
  // Time
  textFont(robRegular);
  text(myTime, upBarX+10, 20);
  // Date
  float dateW = textWidth(date);
  text(date, ((upBarX+800)-dateW)-10, 20);
  // Nazev programu
  float programNameW = textWidth(programName);
  textFont(robLight);
  text(programName, responMid-(programNameW/2), 20);

   if(debug){
    helpMe();
  }
  
}

String mySecond(){
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



void menu(boolean theValue) {
  println("Je menu zavrene? ", theValue);
  menuBarControl();
}

void gps_menu(boolean theValue){

}

boolean mouseOverCircle(int x, int y, float diameter) {
  return (dist(mouseX, mouseY, x, y) < diameter*0.5);
}
 
boolean mouseOverRect(int x, int y, int w, int h) {
  return (mouseX >= x && mouseX <= x+w && mouseY >= y && mouseY <= y+h);
}