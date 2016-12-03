
void helpMe(){
 fill(#0BFF00);
 rect(width/2,0,1,height);
 rect(0,height/2,width,1);

 // float fpsTextW = textWidth(str(frameRate));
 textFont(robRegular);
 text(frameRate, width-65, 18); 
}