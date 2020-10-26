void intro()
{
  intro.play();
  stroke(255,0,255);
  strokeWeight(5);
  fill(255,0,0);
  rect(0,0,width/2, height);
  fill(0,0,255);
  rect(width/2,0,width/2,height);
  textAlign(CENTER,CENTER);
  textFont(crazy);
  textSize(120);
  fill(255);
  text("PONG GAME", width/2, 150);
  
  fill(0);
  tactile(100,400,200,100);
  rect(100,400,200,100);
  tactile(500,400,200,100);
  rect(500,400,200,100);
  fill(255);
  textFont(crazy);
  textSize(40);
  text("1Player",200,450);
  text("2Player",600,450);
}

void introClicks()
{
  if(mouseX>100 && mouseX<300 && mouseY>400 && mouseY<500)
  {
    AI = true;
    mode = GAME;
  }
  if(mouseX>500 && mouseX<700 && mouseY>400 && mouseY<500)
  {
    AI = false;
    mode = GAME;
  }
}
