class Condensador extends Componentes{
  float posX, posY;
  String name = "CONDENSADOR";
  int vis, rot;
  
  Condensador(float x, float y, int v, int r){
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
    stroke(0, 0, 255);
    strokeWeight(3);
    pushMatrix();
    translate(x, y);
    rotate(r*PI/2);
    beginShape();
    vertex(0,0);
    vertex(25,0);
    endShape();
    beginShape();
    vertex(25,-25);
    vertex(25,25);
    endShape();
    beginShape();
    vertex(35,-25);
    vertex(35,25);
    endShape();
    beginShape();
    vertex(35,0);
    vertex(60,0);
    endShape();
    popMatrix();
  }
}