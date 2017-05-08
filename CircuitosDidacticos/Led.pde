class Led extends Componentes{
  void figura(){
    background(0);
    float posx=0,posy=0;
    if(mousePressed){
      posx=mouseX;
      posy=mouseY;
    }
    pushMatrix();
    translate(posx,posy);  
    beginShape(TRIANGLES);
    vertex(30, 75);
    vertex(40, 20);
    vertex(50, 75);
    
    popMatrix();
  }
}