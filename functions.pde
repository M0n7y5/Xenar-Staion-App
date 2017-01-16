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