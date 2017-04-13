
// Pomucka pro menu

void menuBarControl() {

	if (!menuBarClosed) {
		Ani.to(this, aniMenuDur, "menuBarW", 0, Ani.CUBIC_OUT);
		menuBarClosed = true;
	} else {
		Ani.to(this, aniMenuDur, "menuBarW", 75, Ani.CUBIC_OUT);
		menuBarClosed = false;
	}
}

public void leftCircleAni(String button, String val) {
	Controller c = cp5.getController(button);
	if (c.isMouseOver()) {

		//println("["+millis()+"] "+"Nad tlacitkem "+button+" je mys." );
		Ani.to(this, 0.2f, val, 53, Ani.CUBIC_OUT);
	} else {
		Ani.to(this, 0.35f, val, 46, Ani.CUBIC_OUT);
	}
	if (c.isMousePressed()) {
		Ani.to(this, 0.05f, val, 59, Ani.CUBIC_OUT);
	}
}

void upBarAni(boolean state) {

	if (state) {
		Ani.to(this, 0.2f, "upBarH", height / 2, Ani.CUBIC_OUT);

	} else {
		Ani.to(this, 0.2f, "upBarH", 30, Ani.CUBIC_OUT);

	}
}

// animace přechodu z jedné barvy do druhé
public void colorAni(color hexColor1,
                     String rVar,
                     String gVar,
                     String bVar,
                     float duration) {

	float r1 = red(hexColor1);
	float g1 = green(hexColor1);
	float b1 = blue(hexColor1);

	//float r2 = red(hexColor2);
	//float g2 = green(hexColor2);
	//float b2 = blue(hexColor2);

	Ani.to(this, duration, rVar, r1, Ani.CUBIC_OUT);
	Ani.to(this, duration, gVar, g1, Ani.CUBIC_OUT);
	Ani.to(this, duration, bVar, b1, Ani.CUBIC_OUT);
}

void bgBoxDataAni(boolean menu) {
	if (!menu) {
		Ani.to(this, 0.2f, "bgBoxAniY", 0, Ani.CUBIC_OUT);
		if (bgBoxAniY == 0) {
			//menu = false;
			isBgBoxEmpty = true;
		}

	} else {
		Ani.to(this, 0.2f, "bgBoxAniY", height, Ani.CUBIC_OUT);
		if (bgBoxAniY == height) {
			//menu = true;
			isBgBoxEmpty = true;
		}

	}
}