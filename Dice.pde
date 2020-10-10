PImage faceOne, faceTwo, faceThree, faceFour, faceFive, faceSix, scaryFace;
int dSum = 0;  
int shuffleT = 0;
int opacity = 0; //scary face opacity
void setup()
{
  noLoop();
  size(1280, 650);
  faceOne = loadImage("Face1.jpg");
  faceTwo = loadImage("Face2.jpg");
  faceThree = loadImage("Face3.jpg");
  faceFour = loadImage("Face4.jpg");
  faceFive = loadImage("Face5.jpg");
  faceSix = loadImage("Face6.jpg");
  scaryFace = loadImage("scarypumpkin.jpg");
  scaryFace.resize(600,600);
  
}
void draw()
{
  //your code here
  if(shuffleT == 0){
  background(0);
  }
  if(shuffleT > 0 && shuffleT <16){
    loop();
    shuffleT++;
    
  }
  background(0);
  for(int x = 1; x <= 17; x+=1) {
    for(int y = 1; y <= 8; y+=1) {
      Die wdohwan = new Die(x*70, y*70+20);
      wdohwan.show();
    }
   if((shuffleT > 0 && shuffleT <= 4)||(shuffleT > 8 && shuffleT <= 12)){
      tint(255, opacity);  
      image(scaryFace, 340, 30);
      noTint();
      opacity++;
    }
    else if((shuffleT > 4 && shuffleT <= 8)||(shuffleT > 12 && shuffleT < 16)){
      tint(255, opacity);  
      image(scaryFace, 340, 30);
      noTint();
      opacity--;
  }
  if(shuffleT == 16){
    noLoop();
    fill(255);
    textSize(32);
    text("Sum: "+dSum, 580, 50);
    shuffleT = 0;
  
  }
  }
  
  
}
void mousePressed()
{
  noFill();
  dSum = 0;
  for(int x = 1; x <= 17; x+=1) {
    for(int y = 1; y <= 17; y+=1) {
      Die wdohwan = new Die(x*70, y*70);
      wdohwan.roll();
      //wdohwan.show();
    }
  }
  shuffleT++;
  redraw();
}
class Die //models one single dice cube
{
  //variable declarations here
  int dX, dY, dSize, dSide;
  
  Die(int x, int y) //constructor
  {
    dX = x;
    dY = y;
    dSize = 55;
    dSide = (int)(Math.random()*6+1);
    
  }
  void roll()
  {
    dSide = (int)(Math.random()*6+1);
    dSum = dSum+dSide;
  }
  void show()
  {
    //fill(255);
    //rect(dX-dSize*0.5, dY-dSize*0.5, dSize, dSize);
    fill(0);
    if(dSide == 1) {
    image(faceOne, dX-dSize*0.5, dY-dSize*0.5, dSize, dSize);
    }
    else if(dSide == 2) {
    image(faceTwo, dX-dSize*0.5, dY-dSize*0.5, dSize, dSize);
    }
    if(dSide == 3) {
    image(faceThree, dX-dSize*0.5, dY-dSize*0.5, dSize, dSize);
    }
    if(dSide == 4) {
    image(faceFour, dX-dSize*0.5, dY-dSize*0.5, dSize, dSize);
    }
    if(dSide == 5) {
    image(faceFive, dX-dSize*0.5, dY-dSize*0.5, dSize, dSize);
    }
    if(dSide == 6) {
    image(faceSix, dX-dSize*0.5, dY-dSize*0.5, dSize, dSize);
    }
    
  }
  
}
