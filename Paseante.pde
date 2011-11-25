class Paseante {
  
  PVector pos;
  PVector vel;
  PVector velScale;
  
  Paseante() {
    pos = new PVector();
    pos.x = random(width);
    pos.y = height*.5+random(height*.5);
    vel = new PVector();
    velScale = new PVector();
  }
  
  void update() {
    velScale.x = vel.x;
    velScale.y=vel.y;
    velScale.mult(far());
    pos.add(velScale);
    
    vel.mult(.95);    
  }
  
  boolean outOfBonds() {
   return ((pos.y<height*.5)||(pos.y>height)||(pos.x>width)||(pos.x<0));
  }
  
  float alfa() {
    return map(pos.y,height*.5,height,20,255);
  }
  
  float far() {
    return map(pos.y,height*.5,height,.1,1.2);
  }
  
  void display() {
    pushMatrix();
    translate(pos.x,pos.y);
    //stroke(0, alfa);
    noStroke();
    fill(0,alfa());
    scale(far());
    rect(0,0,width/50,height/15);
    popMatrix();
  }
  
  void patina() {
    vel.x = random(-10,10);
    vel.y = random(-10,10);
    vel.limit(width/100);
  }
}
