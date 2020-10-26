void gameover()
{
  textFont(crazy);
  textSize(100);
  fill(255,0,255);
  textAlign(CENTER,CENTER);
  text("GAMEOVER!", width/2, height/2-150);
  if(lefts == 3)
  {
    fill(255,0,0);
    text("RED WINS", width/2, height/2+150);
  }
  if(rights == 3)
  {
    fill(0,0,255);
    text("BLUE WINS", width/2, height/2+150);
  }
 
}

void gameoverClicks()
{
    mode = INTRO;
    vx = random(-3,3);
    vy = random(-3,3);
    ballx = width/2;
    bally = height/2;
    lefty = height/2;
    righty = height/2;
    lefts = rights = 0;
    timer = 360;
    intro.rewind();
}
