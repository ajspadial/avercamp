ArrayList al;
float lastOne;

void setup() {
  size(750,440);
  al = new ArrayList();
  lastOne = millis();
}

void draw() {
  background(202);
  stroke(0,20);
  line(0,height*.5,width,height*.5);
  
   for(int i=al.size(); i>0; i--) {
    Paseante p =(Paseante)al.get(i-1);
    p.update();
    if (p.outOfBonds()) al.remove(i-1);
  }
  
  for(int i=0; i<al.size(); i++) {
    Paseante p =(Paseante)al.get(i);
    p.display();
  }
  
  if (millis()-lastOne>1000) addPeople();
}

void mouseClicked() {
 addPeople();
 int tio = floor(random(al.size()));
  Paseante p = (Paseante)al.get(tio);
  p.patina();
}

void addPeople() {
  if (al.size()<120) {
   al.add(new Paseante());
  lastOne = millis();
  println(al.size());
  }
  
}
