public String mySecond() {
	int defaultSecond = second();
	String mySec = "";
	if (defaultSecond < 10) {
		mySec = "0" + defaultSecond;
	} else {
		mySec = str(defaultSecond);
	}
	return mySec;
}

public String myMinute() {
	int defaultMinute = minute();
	String myMin = "";
	if (defaultMinute < 10) {
		myMin = "0" + defaultMinute;
	} else {
		myMin = str(defaultMinute);
	}
	return myMin;
}

public String myHour() {
	int defaultHour = hour();
	String myHour = "";
	if (defaultHour < 10) {
		myHour = "0" + defaultHour;
	} else {
		myHour = str(defaultHour);
	}
	return myHour;
}

void updateSerialPorts() {
	String portName = Serial.list()[0];
	List l = Arrays.asList(portName);
	cp5.get(ScrollableList.class, "serial_port").setItems(l);
}

boolean mouseOverCircle(int x, int y, float diameter) {
	return (dist(mouseX, mouseY, x, y) < diameter * 0.5);
}

boolean mouseOverRect(int x, int y, int w, int h) {
	return (mouseX >= x && mouseX <= x + w && mouseY >= y && mouseY <= y + h);
}