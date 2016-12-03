// Pomucka pro menu

void menuBarControl(){
  
 
  if(!menuBarClosed){
    Ani.to(this, aniMenuDur, "menuBarW", 0,Ani.CUBIC_OUT);
    menuBarClosed = true;
  }
  else{
    Ani.to(this, aniMenuDur, "menuBarW", 65,Ani.CUBIC_OUT);
    menuBarClosed = false;
  }
}