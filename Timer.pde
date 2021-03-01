  class Timer
  {
   float Time;

  Timer(float set) //Constructor 
  {
    Time = set;
  }
  float getTime()
  {
    return(Time);
  }
  void setTime(float set)
  {
    Time = set;
  }
  void countDown()
  {
    if(Time > 0){
      Time -= 1/frameRate;
    }
    else {
      cp5.getController("Knob").setValue(0);
      finished();
    }
  }
  void countUp()
  {
    Time += 1/frameRate;
  }
    void pauseTimer()
  {
    countDown();
    countUp();    
  }
}
