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
  float responMid = (width-menuBarW)/2;
  //float upBar = (width/2)+menuBarW;
  //float upBarX = upBar-400;
  float upBarX = responMid-400;
  // left bar
  fill(#DB2C2C);
  rect(0,0,menuBarW,height);
  // Horní lišta

  // String dayTime = "";
  fill(#3F90F0);
  rect(upBarX,0,800,30,0,0,120,120);
  fill(#FFFFFF);
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