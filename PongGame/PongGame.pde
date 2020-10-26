import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;


//mode framework
int mode;
final int INTRO = 1;
final int GAME = 2;
final int PAUSE =  3;
final int GAMEOVER = 4;

//entity variables
float leftx, lefty, leftd, rightx, righty, rightd;//paddles
float ballx, bally, balld;//ball
float vx, vy;//ball moving variables

//keyboard variables
boolean wkey, skey, upkey, downkey;

//scoring
int lefts, rights, timer;

//AI
boolean AI = false;

//sounds
Minim minim;
AudioPlayer intro, leftpaddle, rightpaddle, score, wall, clapping;

//font
PFont crazy;
PFont number;

void setup()
{
  size(800,600);
  mode = INTRO;
  
  //initalize font
  crazy = createFont("Crazy.ttf", 200);
  number = createFont("Chicken.ttf", 200);
  
  //initalize paddle
  leftx = 0;
  lefty= height/2;
  leftd = 200;
  
  rightx = width;
  righty = height/2;
  rightd = 200;
  
  //initalize ball
  ballx = width/2;
  bally= height/2;
  balld = 100;
  
  vx = random(-3,3);
  vy = random(-3,3);
  
  //initalize keyboard
  wkey = skey = upkey= downkey= false;
  
  timer = 360;
  
  //sounds
  minim = new Minim(this);
  intro = minim.loadFile("intro.wav");
  leftpaddle = minim.loadFile("leftpaddle.wav");
  rightpaddle = minim.loadFile("rightpaddle.wav");
  score = minim.loadFile("score.wav");
  wall = minim.loadFile("Bounce.wav");
  clapping = minim.loadFile("clapping.wav");
  
}

void draw()
{
  if(mode == INTRO)
  {
    intro();
  }
  else if(mode == GAME)
  {
    game();
  }
  else if(mode == PAUSE)
  {
    pause();
  }
  else if(mode == GAMEOVER)
  {
    gameover();
  }
  else
    println("Mode error: "+mode);
}

void tactile(int x, int y, int l, int w)
{
  if(mouseX>x && mouseX<x+l && mouseY>y && mouseY<y+w)
  {
    stroke(255,255,0);
  }
  else
  {
    stroke(255,0,255);
  }
}
