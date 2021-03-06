class Resistencia extends Componentes{
  float posX, posY;
  String name = "RESISTENCIA";
  int vis, rot;
  
  Resistencia(float x, float y, int v, int r){
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
    beginShape();
    vertex(0,0);
    vertex(10,0);
    vertex(20,-20);
    vertex(30,20);
    vertex(40,-20);
    vertex(50,20);
    vertex(60,0);
    vertex(70,0);
    endShape();
    popMatrix();
  }
}