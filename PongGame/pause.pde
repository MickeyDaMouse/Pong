void pause()
{
  textAlign(CENTER,CENTER);
  textSize(70);
  fill(255,255,0);
  text("GAME IS PAUSED",width/2,height/2);
  text("CLICK TO RESUME",width/2, height/2+100);
}

void pauseClicks()
{
  mode = GAME;
}
