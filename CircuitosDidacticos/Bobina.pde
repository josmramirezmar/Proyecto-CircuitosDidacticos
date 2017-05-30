class Bobina extends Componentes{
  float posX, posY;
  String name = "BOBINA";
  int vis, rot;
  
  Bobina(float x, float y, int v, int r){
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
    beginShape();
    strokeWeight(3);
    vertex(0,0);vertex(20,0);
    quadraticVertex(35,-40,50,0);
    quadraticVertex(65,-40,80,0);
    quadraticVertex(95,-40,110,0);
    quadraticVertex(125,-40,140,0);
    vertex(160,0);
    endShape();
    popMatrix();
  }
}