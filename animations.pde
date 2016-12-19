// Pomucka pro menu

void menuBarControl(){
 
  if(!menuBarClosed){
    Ani.to(this, aniMenuDur, "menuBarW", 0, Ani.CUBIC_OUT);
    menuBarClosed = true;
  }
  else{
    Ani.to(this, aniMenuDur, "menuBarW", 75, Ani.CUBIC_OUT);
    menuBarClosed = false;
  }
}

public void leftCircleAni(String button, String val){
  Controller c = cp5.getController(button);
  if (c.isMouseOver()) {
    
    //println("["+millis()+"] "+"Nad tlacitkem "+button+" je mys." );
    Ani.to(this, 0.2, val, 53, Ani.CUBIC_OUT);
  }
  else {
    Ani.to(this, 0.35, val, 46, Ani.CUBIC_OUT);
  }
  if (c.isMousePressed()) {
    Ani.to(this, 0.05, val, 59, Ani.CUBIC_OUT);
  }
}

void upBarAni(boolean state){

		if(state){
			Ani.to(this, 1.5, "upBarW", height/2, Ani.CUBIC_OUT);
			
		}
		else {
			Ani.to(this, 1.5, "upBarW", 30, Ani.CUBIC_OUT);
			
		}

}