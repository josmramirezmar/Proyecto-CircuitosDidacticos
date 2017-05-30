class Cable{
  float posX1, posY1, posX2, posY2;
  String name = "CABLE";
  int vis, rot;
  
  Cable(float x1, float y1, float x2, float y2, int v){
    setPosX1(x1);
    setPosY1(y1);
    setPosX2(x2);
    setPosY2(y2);
    setVis(v);
  }
  
  String getname(){
    return name;
  }
  
  void setPosX1(float x){
    posX1 = x;
  }
  
  float getX1(){
    return posX1;
  }
  
  void setPosY1(float y){
    posY1 = y;
  }
  
  float getY1(){
    return posY1;
  }
  //
  void setPosX2(float x){
    posX2 = x;
  }
  
  float getX2(){
    return posX2;
  }
  
  void setPosY2(float y){
    posY2 = y;
  }
  
  float getY2(){
    return posY2;
  }
  
  void setVis(int v){
    vis = v;
  }
  
  int getVis(){
    return vis;
  }
  
  void figura(float x, float y, float w, float h){  
    stroke(0, 0, 255);
    strokeWeight(3);
    rect(x, y, w, h);
  }
}