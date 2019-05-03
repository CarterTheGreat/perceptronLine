class Perceptron{
  
  float weights[];
  float c;
  
  Perceptron(int n, float c_){
    weights = new float[n];
    
    for(int i = 0; i < weights.length;i++){
      weights[i] = random(-1,1);
    }
    
    c = c_;
  }
  
  void train(float[] inputs, float correct){
    
    int guess = feedForward(inputs);
    
    float error = correct - guess;
    
    for(int i = 0; i < weights.length;i++){
      weights[i] +=  c * error * inputs[i];
    }
  }
  
  int feedForward(float[] inputs){
    float sum = 0;
    for(int i = 0; i < inputs.length;i++){
       sum += inputs[i]*weights[i];
    }
    
    return activate(sum);
  }
  
  int activate(float sum){
    if(sum > 0)
      return 1;
    else
      return -1;
  }
  
  float[] getWeights(){
    return weights;
  }
  
  float guessY(float x){
    float m = weights[2] / weights[1];
    float b = (weights[0]/weights[1]) * x;
    return -m - b;
  }
  
}
