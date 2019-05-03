Perceptron per = new Perceptron(3, .8);
Point[] points;

void setup(){
  size(400,400);
  points = new Point[350];
  
  for(int i = 0; i < points.length; i++){
    points[i] = new Point();
  }
  
}

void draw(){
  
  //setup
  clear();
  background(169);
  for(int i = 0; i < points.length; i++){
    //Draw points
    if(points[i].y > f( points[i].x ) )
      fill(255);
    else
      fill(0);
    ellipse(points[i].pX(), points[i].pY(), 8, 8);
    
    //Train on points
    float[] inputs = {points[i].x, points[i].y, points[i].bias};
    per.train(inputs, points[i].val);
    
  }
  drawLine();
  for(int i = 0; i < points.length; i++){
    //Evaluate
    float[] inputs = {points[i].x, points[i].y, points[i].bias};
    int guess = per.feedForward(inputs);
    
    //Draw guess correctness
    if(guess == points[i].val)
      fill(0,255,0);
    else
      fill(255,0,0);
    
    ellipse(points[i].pX(),points[i].pY(), 4, 4);
    delay(3);
  }
  
}

void drawLine(){
  
  //f(x) = 2x -3
  Point p0 = new Point(-1, f(-1));
  Point p1 = new Point(1, f(1));
  
  stroke(4);
  fill(255);
  line(p0.pX(), p0.pY(), p1.pX(), p1.pY());
  
  Point p2 = new Point(-1, per.guessY(-1));
  Point p3 = new Point(1, per.guessY(1));
  line(p2.pX(), p2.pY(), p3.pX(), p3.pY());
}

float f(float x){
  
  float result = -.4*x + .1;
  return result;
  
}
