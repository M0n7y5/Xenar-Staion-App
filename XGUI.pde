public class XGui {
	//XGui parrent;

	String programName = "Xenar Station Dasboard (Pre-Alpha v03)";
	int day, month, year;
	String hour, minute, second;
	//int second = second();
	String date = day + "/" + month + "/" + year;
	String myTime = hour + ":" + minute + ":" + second;
	XGui () {
	}

	void display() {
		day = day();
		month = month();
		year = year();
		hour = myHour();
		minute = myMinute();
		second = mySecond();
		date = day + "/" + month + "/" + year;
		myTime = hour + ":" + minute + ":" + second;

		responMid = ((width + menuBarW) / 2);
		//float upBar = (width/2)+menuBarW;
		//float upBarX = upBar-400;
		upBarX = responMid - 400;

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
	}

	void displayTemp(boolean yesNo) {
		//inBgBoxX = bgBoxX + inBoxPadding;
		//inBgBoxY = bgBoxY + inBoxPadding;
		if (yesNo) {
			pushStyle();
			textAlign(LEFT, TOP);
			pushMatrix();
			fill(#ECF0F1);
			//translate(bgBoxX+inBoxPadding, bgBoxY+inBoxPadding);
			inBoxKvadrant(1);
			textFont(robMedium);
			//text("Test", 0, 0);
			//rect(0, 0, 100, 100);
			int chartSizeW = int(inBgBoxW / 2 - 2 * inBoxPadding);
			int chartSizeH = int(inBgBoxH / 2 - 2 * inBoxPadding);
			temp.show()
			.setPosition(inBgBoxX, inBgBoxY)
			.setSize(chartSizeW, chartSizeH)
			.update();
			popMatrix();
			pushMatrix();
			fill(#ECF0F1);
			//translate(bgBoxX+inBoxPadding, bgBoxY+inBoxPadding);
			inBoxKvadrant(2);
			textFont(robMedium);
			text("Test: " + chartData, 0, 0);
			text("Test2: " + int(2 * chartData), 0, 30);
			//rect(0, 0, 100, 100);
			popMatrix();
			pushMatrix();
			fill(#ECF0F1);
			//translate(bgBoxX+inBoxPadding, bgBoxY+inBoxPadding);
			inBoxKvadrant(3);
			textFont(robMedium);
			//text("Test", 0, 0);
			rect(0, 0, 100, 100);
			popMatrix();
			pushMatrix();
			fill(#ECF0F1);
			//translate(bgBoxX+inBoxPadding, bgBoxY+inBoxPadding);
			inBoxKvadrant(4);
			textFont(robMedium);
			//text("Test", 0, 0);
			rect(0, 0, 100, 100);
			popMatrix();
			popStyle();
		} else {
			temp.hide();
		}
	}

	void inBoxKvadrant(int kvadrant) {
		inBgBoxX = bgBoxX + inBoxPadding;
		inBgBoxY = bgBoxY + inBoxPadding;
		inBgBoxW = bgBoxW;
		inBgBoxH = bgBoxH;
		inBgBoxMidX = inBgBoxW / 2 + menuBarW + padding;
		inBgBoxMidY = inBgBoxH / 2 + 50 + padding;
		if (kvadrant == 1) {
			translate(inBgBoxX, inBgBoxY);
		}
		if (kvadrant == 2) {
			translate(inBgBoxMidX, inBgBoxY);
		}
		if (kvadrant == 3) {
			translate(inBgBoxX, inBgBoxMidY + upBarH - 2 * inBoxPadding);
		}
		if (kvadrant == 4) {
			translate(inBgBoxMidX,
			          inBgBoxMidY + upBarH - 2 * inBoxPadding);
		}
	}
}

void menu(boolean theValue) {
	println("Je menu zavrene? ", theValue);
	menuBarControl();
}

void setup_menu(boolean theValue) {
	setupMenuX = upBarX + 10;
	setupMenuY = upBarH - 100; 
	//println("Je horni lista zavrena? : ", theValue);
	Controller portList = cp5.getController("serial_port");
	portList.setPosition(setupMenuX, setupMenuY);
	upBarAni(theValue);
	if (theValue) {
		colorAni(#f37b61, "setupCcolorR", "setupCcolorG", "setupCcolorB", 0.5);
	} else {
		colorAni(#ECF0F1, "setupCcolorR", "setupCcolorG", "setupCcolorB", 0.5);
	}
}

void gps_menu(boolean theValue) {
 //updateSerialPorts();
}

void temp_menu(boolean theValue) {
	if (theValue) {
		if (isBgBoxEmpty) {
			chartData = sin(frameCount * 0.05) * 20;
			temp.push("incoming", chartData);
			xgui.displayTemp(true);
			isTempMenuOpen = true;
		}
	} else {
		xgui.displayTemp(false);
		isTempMenuOpen = false;
	}
	println("Je temp menu zavrene: " + theValue);
}