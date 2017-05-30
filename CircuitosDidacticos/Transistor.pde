class Transistor extends Componentes{
  float posX, posY;
  String name = "TRANSISTOR";
  int vis, rot;
  
  Transistor(float x, float y, int v, int r){
    setPosX(x);
    setPosY(y);
    setVis(v);
    setRot(r);
  }
  
  String getname(){
    return name;
  }
  
  void setPosX(float x){
    posX = x;
  }
  
  float getX(){
    return posX;
  }
  
  void setPosY(float y){
    posY = y;
  }
  
  float getY(){
    return posY;
  }
  
  void setVis(int v){
    vis = v;
  }
  
  int getVis(){
    return vis;
  }
  
  void setRot(int r){
    rot = r;
  }
  
  int getRot(){
    return rot;
  }
  
  void figura(float x, float y, int r){
    pushMatrix();
    translate(x, y);
    rotate(r*PI/2);
    noFill();
    stroke(0, 0, 255);
    ellipse(0,0,70,70);
    beginShape(LINES);
    strokeWeight(3);
    vertex(-60,0);vertex(-15,0);
    vertex(-15,-18);vertex(-15,18);
    vertex(-15,-5);vertex(15,-25);
    vertex(15,-25);vertex(15,-60);
    vertex(-15,5);vertex(15,25);
    vertex(15,25);vertex(15,60);  
    endShape();
    beginShape();
    fill(0);
    vertex(14,24);
    vertex(12,20);
    vertex(9.75,25);
    endShape(CLOSE);
    popMatrix();
  }
}