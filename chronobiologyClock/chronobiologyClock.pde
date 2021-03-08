import processing.video.*;
Movie myMovie;
int savedTime;
boolean playSpeed;

//initilize movie and variables
void setup(){
  size(1920,1080);
  frameRate(60);
  myMovie = new Movie(this, "road.mp4");
  myMovie.loop();
  savedTime = millis(); //the time when the program started
  playSpeed = true;
}

void draw(){
  image(myMovie, 0, 0);
  //get the current time
  int passedTime = millis() - savedTime;
  //if more than 11.6 seconds have passed
  //flip the play back speed and reset the time sense the last flip
  if(passedTime > 11600){ //23.2 / 2 = 11.6
    playSpeed = !playSpeed; 
    savedTime = millis();
  }
  //alternate between slow and fast video speeds
  if(playSpeed == true){
    myMovie.speed(.5);
  }else{
    myMovie.speed(2);
  }
}

void movieEvent(Movie m){
   m.read(); 
}
