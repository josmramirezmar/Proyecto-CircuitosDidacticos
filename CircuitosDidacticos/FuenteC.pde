class FuenteC extends Componentes{
  float posX, posY;
  String name = "FUENTEC";
  int vis, rot;
  
  FuenteC(float x, float y, int v, int r){
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
    vertex(0,20);vertex(0,-10);
    vertex(0,35);vertex(0,60);
    vertex(0,-35);vertex(0,-60);
    endShape();
    beginShape();
    fill(0, 0, 255);
    vertex(-8,-10);
    vertex(8,-10);
    vertex(0,-21);
    endShape(CLOSE);
    popMatrix();
  }
}