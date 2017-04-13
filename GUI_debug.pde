void helpMe() {
	fill(#0BFF00);
	rect(width / 2, 0, 1, height);
	rect(0, height / 2, width, 1);
	pushStyle();
	fill(#0000FF);
	rect(inBgBoxMidX, 0, 1, height);
	rect(0, inBgBoxMidY, width, 1);
	popStyle();

// float fpsTextW = textWidth(str(frameRate));
	textFont(robRegular);
	text(frameRate, width - 65, 25);
}