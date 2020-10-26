void game()

{
  background(0);
  
  //paddles
  stroke(255);
  strokeWeight(5);
  line(width/2, 0, width/2, height);
  fill(255,0,0);
  circle(leftx, lefty, leftd);
  fill(0,0,255);
  circle(rightx, righty, rightd);
  
  if(wkey == true && lefty > leftd/2) lefty -= 5;
  if(skey == true && lefty < height-leftd/2) lefty += 5;
  
  //AI
  if(AI)
  {
    if(ballx > width/2)
    {
      if(bally<righty && righty>rightd/2)
      {
      righty -= 3;
      }
      else if(bally > righty && righty < height-rightd/2)
      {
      righty += 3;
      }
    }

  }
  else
  {
    if(upkey == true && righty > rightd/2) righty -= 5;
    if(downkey == true && righty < height-rightd/2) righty += 5;
  }

  
  //ball
  fill(255,0,255);
  circle(ballx, bally, balld);
  if(timer < 0)
  {
    ballx += vx;
    bally += vy;
  }
  
  if(bally < balld/2)
  {
    bally = balld/2;
    vy *= -1;
    wall.rewind();
    wall.play();
  }
  if(bally > height - balld/2)
   {
     bally = height - balld/2;
     vy *= -1;
     wall.rewind();
     wall.play();
   }
   
  
  //scoring
  if(ballx<-balld/2)
  {
    score.rewind();
    score.play();
    rights++;
    if(rights == 3)
    {
      clapping.rewind();
      clapping.play();
      mode = GAMEOVER;
    }
    ballx= width/2;
    bally = height/2;
    timer = 240;
    vx = random(-3,3);
    vy = random(-3,3);

  }  
  if(ballx>width+balld/2)
  {
    score.rewind();
    score.play();
    lefts++;
    if(lefts == 3)
    {
      clapping.rewind();
      clapping.play();
      mode = GAMEOVER;
    }
    ballx= width/2;
    bally = height/2;
    timer = 240;
    vx = random(-3,3);
    vy = random(-3,3);

  }
  
  //bouncing
  if(bally < balld/2 || bally > height-balld/2)
  {
    vy = vy * -1;
    wall.rewind();
    wall.play();
  }
    
  if(dist(ballx, bally, leftx, lefty) <= balld/2 + leftd/2)
  {
    vx = (ballx - leftx)/15;
    vy = (bally - lefty)/15;  
    leftpaddle.rewind();
    leftpaddle.play();
  }
    
  if(dist(ballx, bally, rightx, righty) <= balld/2 + rightd/2)
  {
    vx = (ballx - rightx)/15;
    vy = (bally - righty)/15;
    rightpaddle.rewind();
    rightpaddle.play();
  }
  
  //scores
  textFont(number);
  textSize(50);
  textAlign(CENTER,CENTER);
  fill(255,0,0);
  text(lefts, width/4, 100);
  fill(0,0,255);
  text(rights, 3*(width/4), 100);
  if(timer >= 0)
  {
    fill(0);
    text(timer/60, width/2, height/2);
    timer -= 1;
  }
}

void gameClicks()
{
  mode = PAUSE;
}
