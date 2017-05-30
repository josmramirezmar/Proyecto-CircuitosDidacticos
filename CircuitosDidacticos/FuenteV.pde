class FuenteV extends Componentes{
  float posX, posY;
  String name = "FUENTEV";
  int vis, rot;
  
  FuenteV(float x, float y, int v, int r){
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
    ellipse(0, 0, 70, 70);
    strokeWeight(3);
    beginShape(LINES);
    vertex(-10,-10);vertex(10,-10);
    vertex(0,0);vertex(0,-20);
    vertex(-10,15);vertex(10,15);
    vertex(0,-35);vertex(0,-60);
    vertex(0,35);vertex(0,60);
    endShape();
    popMatrix();
  }
}