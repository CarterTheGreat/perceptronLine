class Point{
  float x;
  float y;
  float bias;
  float val;
  
  Point(float x_, float y_){
    x = x_;
    y = y_;
    bias = 1;
  }
  
  Point(){
    x = random(-1,1);
    y = random(-1,1);
    bias = 1;
    
    //TODO: Make this line equation
    //point y > line y @ point x 
    if(y > f(x))
      val = 1;
    else
      val = -1;
    
  }
  
  float pX(){
    return map(x,-1,1,0,width);
  }
  
  float pY(){
    return map(y,-1,1,0,height);
  }
  
}
