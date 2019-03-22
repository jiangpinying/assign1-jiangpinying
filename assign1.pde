
int soldierX,soldierY;
int soldierSoilY;

int robotX,robotY;
int robotSoilY;

int laserHandX,laserHandY;
int laserX,laserEndX;
int laserSpeedX=2;
int laserMoveX;
int laserMax=40;

PImage bg,groundhog,life,robot,soil,soldier;

void setup() {
	size(640, 480, P2D);

  //loadImage
	bg=loadImage("img/bg.jpg");
  groundhog=loadImage("img/groundhog.png");
  life=loadImage("img/life.png");
  robot=loadImage("img/robot.png");
  soil=loadImage("img/soil.png");
  soldier=loadImage("img/soldier.png");
  
  //soldier
  soldierSoilY=floor(random(2,6));
  soldierX=0;
  soldierY=80*soldierSoilY+40;
  
  //robot
  robotX=floor(random(160,560));
  robotSoilY=floor(random(2,6));
  robotY=80*robotSoilY;
  
  //laser
  laserHandX=robotX+25;
  laserHandY=robotY+37;
  

}

void draw() {
  
  //background
  imageMode(CORNER);
  background(bg);
  image(soil,0,160);
  
  //life
  image(life,10,10);
  image(life,80,10);
  image(life,150,10);
  
  //grass
  colorMode(RGB);
  fill(124,204,25);
  noStroke();
  rect(0,145,640,15);
  
  //groundhog
  image(groundhog,280,80);
  
  //sun
  strokeWeight(5);
  stroke(255,255,0);
  fill(253,184,19);
  ellipse(590,50,120,120);
  
  //robot
  image(robot,robotX,robotY);
  
  //laser
  strokeWeight(10);
  stroke(255,0,0);
  laserMoveX=(laserMoveX+laserSpeedX)%160;
  laserX=min(laserHandX,laserHandX-laserMoveX);
  laserEndX=min(laserHandX,laserX+laserMax);
  line(laserX,laserHandY,laserEndX,laserHandY);
  
  //soldier
  imageMode(CENTER);
  image(soldier,soldierX,soldierY);
  soldierX+=3;
  soldierX%=680;
}
