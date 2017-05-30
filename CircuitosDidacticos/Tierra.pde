class Tierra extends Componentes{
  float posX, posY;
  String name = "TIERRA";
  int vis, rot;
  
  Tierra(float x, float y, int v, int r){
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
    strokeWeight(3);
    beginShape(LINES);
    strokeWeight(3);
    vertex(12.5,0);vertex(12.5,-20);
    vertex(0,0);vertex(25,0);
    vertex(5,5);vertex(20,5);
    vertex(10,10);vertex(15,10);
    endShape();
    popMatrix();
  }
}