void drawGUI() {


	String programName = "Xenar Station Dasboard (Pre-Alpha v01)";
	int day = day();
	int month = month();
	int year = year();
	String hour = myHour();
	String minute = myMinute();
	String second = mySecond();
	//int second = second();
	String date = day + "/" + month + "/" + year;
	String myTime = hour + ":" + minute + ":" + second;

	float responMid = ((width + menuBarW) / 2);
	//float upBar = (width/2)+menuBarW;
	//float upBarX = upBar-400;
	float upBarX = responMid - 400;

	int padding = 25;
	int inBoxPadding = 10;
// test streamu ... nevím jak to dopadne :D
	//translate(width-menuBarW, 50);

	// bg box

	fill(#38393B);
	bgBoxX = menuBarW + padding;
	bgBoxY = upBarH + 2 * padding;
	bgBoxW = (width - 2 * padding) - menuBarW;
	bgBoxH = (height - 50) - (padding + 10);
	rect(bgBoxX, bgBoxY, bgBoxW, bgBoxH, 15);

	// left bar
	fill(#595F63);
	rect(0, 0, menuBarW, height);

	// menu kruhy, pozadí, left bar
	fill(#ECF0F1);
	Controller tempM = cp5.getController("temp_menu");
	tempM.setPosition(menuBarW - 75 / 2 - 45 / 2,
	                  height / 2 - 45 / 2 - 90);
	tempM.update();
	leftCircleAni("temp_menu", "cTempSize");
	ellipse(menuBarW - 75 / 2,
	        (height / 2) - 90, cTempSize, cTempSize);

	Controller gpsM = cp5.getController("gps_menu");
	gpsM.setPosition(menuBarW - 75 / 2 - 45 / 2 ,
	                 height / 2 - 45 / 2);
	gpsM.update();
	leftCircleAni("gps_menu", "cGpsSize");
	ellipse(menuBarW - 75 / 2, (height / 2), cGpsSize, cGpsSize);


	Controller voltageM = cp5.getController("voltage_menu");
	voltageM.setPosition(menuBarW - 75 / 2 - 45 / 2,
	                     height / 2 - 45 / 2 + 90);
	voltageM.update();
	leftCircleAni("voltage_menu", "cVoltageSize");
	ellipse(menuBarW - 75 / 2, (height / 2) + 90,
	        cVoltageSize, cVoltageSize);

	pushStyle();
	fill(setupCcolorR, setupCcolorG, setupCcolorB);
	Controller setupM = cp5.getController("setup_menu");
	setupM.setPosition(menuBarW - 75 / 2 - 45 / 2,
	                   height / 2 - 45 / 2 + 180);
	leftCircleAni("setup_menu", "cSetup");
	ellipse(menuBarW - 75 / 2, (height / 2) + 180, cSetup, cSetup);
	setupM.update();
	popStyle();

	// Horní lišta a nastavení
	fill(#595F63);
	rect(upBarX, 0, 800, upBarH, 0, 0, 10, 10);


	/*if (setupM.isPressed()) {
	  println(millis()+"-WTF?");
	}
	*/
	fill(#ECF0F1);

// Vypsání textu, datumu a času na horní lištu
	// Time
	upBarTextPosY = upBarH / 2;
	textFont(robRegular);
	text(myTime, upBarX + 10, upBarH - 20 / 2);
	// Date
	float dateW = textWidth(date);
	text(date, ((upBarX + 800) - dateW) - 10, upBarH - 20 / 2);
	// Nazev programu
	float programNameW = textWidth(programName);
	textFont(robLight);
	text(programName, responMid - (programNameW / 2),
	     upBarH - 20 / 2);

	if (debug) {
		helpMe();
	}

}

void menu(boolean theValue) {
	println("Je menu zavrene? ", theValue);
	menuBarControl();
}

void setup_menu(boolean theValue) {
	//println("Je horni lista zavrena? : ", theValue);
	upBarAni(theValue);
	if (theValue) {
		colorAni(#f37b61, "setupCcolorR", "setupCcolorG", "setupCcolorB", 0.5);
	} else {
		colorAni(#ECF0F1, "setupCcolorR", "setupCcolorG", "setupCcolorB", 0.5);

	}
}

void gps_menu(boolean theValue) {

}

boolean mouseOverCircle(int x, int y, float diameter) {
	return (dist(mouseX, mouseY, x, y) < diameter * 0.5);
}

boolean mouseOverRect(int x, int y, int w, int h) {
	return (mouseX >= x && mouseX <= x + w && mouseY >= y && mouseY <= y + h);
}