import controlP5.*;
import processing.core.*;



public class Timer {
ControlP5 cp5;
MainClass mainClass = new MainClass();

 double Time;

Timer(double set) //Constructor 
{
  Time = set;
}
double getTime()
{
  return(Time);
}
void setTime(double set)
{
  Time = set;
}
void countDown()
{
  if(Time > 0){
    Time -= 1/mainClass.frameRate;
  }
  else {
    cp5.getController("Knob").setValue(0);
  
    
    mainClass.finished();
  
  }
}
void countUp()
{
  Time += 1/mainClass.frameRate;
}
  void pauseTimer()
{
  countDown();
  countUp();    
}
}