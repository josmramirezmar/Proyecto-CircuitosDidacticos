import de.looksgood.ani.*;
import de.looksgood.ani.easing.*;
import controlP5.*;  
import processing.sound.*;

SoundFile mp3;

ControlP5 cp5, cp6, cp7;
PImage Resistencia;
PImage Condensador;
PImage Diodo;
PImage Cable;
PImage Bobina;
PImage Tierra;
PImage FuenteC;
PImage FuenteV;
PImage Transistor;
PImage img;
PImage C;
boolean cua;

RadioButton r;
Textarea myTextarea;
Accordion accordion;
Textlabel myTextlabelA;
Textlabel myTextlabel1;
Textlabel myTextlabel2;
Textlabel myTextlabelP1;
Textlabel myTextlabelP2;
Textlabel myTextlabelP3;
Textarea myTextarea1;

color c = color(0, 160, 100);
int current = 1;

String lvlName, auName,  pista0, pista1, pista2, p1, p2, p3;
String[] ubcp = new String[3];
String[] ubcx = new String[3];
String[] ubps = new String[3];
float difld;

Componentes co;
Cable ca;
boolean dis = false;
int v; 
int[] ro = new int[10];
int n = 0;

PVector[] point = new PVector[10];
PVector[] pointca = new PVector[2];
PVector targetn;

Table tabComp, tabConx, tabPs, tabLvl;
ArrayList<Componentes> comps = new ArrayList<Componentes>();
ArrayList<Cable> cabs = new ArrayList<Cable>();

Table tabCompj, tabConxj, tabTmp, tabPsj;
ArrayList<Componentes> compsj = new ArrayList<Componentes>();
ArrayList<Cable> cabsj = new ArrayList<Cable>();

void setup() {
  size(1000, 700);
  smooth();
  
  Resistencia = loadImage("resistencia.jpg");
  Condensador = loadImage("Condensador.jpg");
  Diodo = loadImage("Diodo.jpg");
  Cable = loadImage("Cable.jpg");
  Bobina = loadImage("Bobina2.jpg");
  Tierra = loadImage("Tierra.jpg");
  FuenteC = loadImage("FuenteC.jpg");
  FuenteV = loadImage("FuenteV.jpg");
  Transistor = loadImage("Transistor.jpg");
  C = loadImage("cuadricula.jpg");
  img = loadImage("circuitofondo.jpg");
  
  tabComp = loadTable("data/tabComp.csv", "header");  
  tabConx = loadTable("data/tabConx.csv", "header");
  tabTmp = loadTable("data/tabComp.csv", "header");
  tabPs = loadTable("data/tabPs.csv", "header");
  tabLvl = loadTable("data/tabLvl.csv", "header");
  tabCompj = loadTable("levels/Circuito1/tabComp.csv", "header");
  tabPsj = loadTable("levels/Circuito1/tabPs.csv", "header");
  tabConxj = loadTable("levels/Circuito1/tabConx.csv", "header");
  
  ubcp[0]="levels";
  ubcx[0]="levels";
  ubps[0]="levels";
  ubcp[2]="tabComp.csv";
  ubcx[2]="tabConx.csv";
  ubps[2]="tabPs.csv";
  
  gui();
  
  
  mp3 = new SoundFile(this, "mFondoDZ.mp3");
  mp3.loop();
  
  for(int i=0; i<10; i++){
    point[i] = new PVector(width/2, height/2); 
    ro[i]=0;
  }
  targetn = new PVector(width/2, height/2);
  
  Ani.init(this);
}

void draw(){  
  imageMode(CORNERS);
  image(img, 0, 0, 1000, 700);
  if(cua == true){
    imageMode(CORNERS);
    image(C, 150, 130, 800, 500);
  }

  if(dis == true){
    for (int i = 0; i < comps.size(); i++) {
      Componentes part = comps.get(i);
      part.figura(point[i].x, point[i].y, ro[i]);  
    }
    for (int i = 0; i < cabs.size(); i++) {
      Cable part = cabs.get(i);
      part.figura(part.getX1(), part.getY1(), part.getX2(), part.getY2());  
    }
  }
}

void mousePressed(){
  targetn.x = mouseX;
  targetn.y = mouseY; 
  v = 0;
  switch(key){   
    case '1':
      Ani.to(point[0], 1.0f, "x", targetn.x);
      Ani.to(point[0], 1.0f, "y", targetn.y);
      break;
    case '2':
      Ani.to(point[1], 1.0f, "x", targetn.x);
      Ani.to(point[1], 1.0f, "y", targetn.y);
      break;
    case '3':
      Ani.to(point[2], 1.0f, "x", targetn.x);
      Ani.to(point[2], 1.0f, "y", targetn.y);
      break;
    case '4':
      Ani.to(point[3], 1.0f, "x", targetn.x);
      Ani.to(point[3], 1.0f, "y", targetn.y);
      break;
    case '5':
      Ani.to(point[4], 1.0f, "x", targetn.x);
      Ani.to(point[4], 1.0f, "y", targetn.y);
      break;
    case '6':
      Ani.to(point[5], 1.0f, "x", targetn.x);
      Ani.to(point[5], 1.0f, "y", targetn.y);
      break;
    case '7':
      Ani.to(point[6], 1.0f, "x", targetn.x);
      Ani.to(point[6], 1.0f, "y", targetn.y);
      break;
    case '8':
      Ani.to(point[7], 1.0f, "x", targetn.x);
      Ani.to(point[7], 1.0f, "y", targetn.y);
      break;
    case '9':
      Ani.to(point[8], 1.0f, "x", targetn.x);
      Ani.to(point[8], 1.0f, "y", targetn.y);
      break;
    case '0':
      Ani.to(point[9], 1.0f, "x", targetn.x);
      Ani.to(point[9], 1.0f, "y", targetn.y);
      break;     
  }
}

void keyPressed(){
  if (keyCode == SHIFT)
    ro[n]++;
  if (keyCode == LEFT){
    ca = new Cable(mouseX, mouseY, -50, 1, 0);
    cabs.add(ca);
    dis = true;
  }
  if (keyCode == RIGHT){
    ca = new Cable(mouseX, mouseY, 50, 1, 0);
    cabs.add(ca);
    dis = true;
  }
   if (keyCode == UP){
    ca = new Cable(mouseX, mouseY, 1, -50, 0);
    cabs.add(ca);
    dis = true;
   }
  if (keyCode == DOWN){
    ca = new Cable(mouseX, mouseY, 1, 50, 0);
    cabs.add(ca);
    dis = true;
  }
}

void gui(){
  cua = true;
  cp5 = new ControlP5(this);
  
  myTextlabelA = cp5.addTextlabel("Titulo")
                    .setText("RED CIRCUIT")
                    .setPosition(210,20)
                    .setColorValue(0xffffff00)
                    .setFont(createFont("Georgia",80))
                    ;
                    
  cp5.addTextfield("Nombre Nivel")
     .setColor(color(0))
     .setPosition(860,380)
     .setSize(120,30)
     .setFont(createFont("arial",15))
     .setAutoClear(false)
     .setColorBackground(color(255))
     ;
     
   r = cp5.addRadioButton("radioButton")
       .setPosition(859,448)
       .setSize(20,20)
       .setColorBackground(color(0,0,200))
       .setColorForeground(color(180,0,0))
       .setColorActive(color(200,0,0))
       .setColorLabel(color(255))
       .setItemsPerRow(3)
       .setSpacingColumn(28)
       .addItem("NOOB",1)
       .addItem("MEDIO",2)
       .addItem("PRO",3)
       ;
  myTextarea = cp5.addTextarea("nivel")
              .setPosition(860,475)
              .setSize(150,25)
              .setFont(createFont("arial",15))
              .setLineHeight(14)
              .setColor(color(255))
              .setColorBackground(color(0,0,0,25))
              .setText("DIFICULTAD");
              ;
              
  cp5.addTextfield("Creador")
     .setColor(color(0))
     .setPosition(860,510)
     .setSize(120,25)
     .setFont(createFont("arial",15))
     .setAutoClear(false)
     .setColorBackground(color(255))
     ;
     
  cp5.addButton("Atras")
     .setValue(0)
     .setPosition(940,20)
     .setSize(50,40)
     .setColorBackground(color(200, 54,150))
     ;
  cp5.addButton("Sonido")
     .setValue(50)
     .setPosition(885,20)
     .setSize(50,40)
     .setColorBackground(color(200, 54,150))
     ;
     
  cp5.addButton("Borrar")
     .setValue(100)
     .setPosition(885,200)
     .setSize(100,40)
     .setColorBackground(color(20, 150,50))
     ;
  cp5.addButton("Guardar")
     .setValue(150)
     .setPosition(885,250)
     .setSize(100,40)
     .setColorBackground(color(20, 150,50))
     ;
     
  myTextarea = cp5.addTextarea("2")
                  .setPosition(0,10)
                  .setSize(150,20)
                  .setFont(createFont("arial",12))
                  .setLineHeight(14)
                  .setColor(color(0))
                  .setColorBackground(color(200,150))
                  .setText("COMPONENTES");
                  ;
     
  cp5.addTextfield("Pista 3")
     .setColor(color(0))
     .setPosition(width/2-200,640)
     .setSize(400,25)
     .setFont(createFont("arial",20))
     .setAutoClear(false)
     .setColorBackground(color(255))
     ;
  cp5.addTextfield("Pista 2")
     .setColor(color(0))
     .setPosition(width/2-200,585)
     .setSize(400,25)
     .setFont(createFont("arial",20))
     .setAutoClear(false)
     .setColorBackground(color(255))
     ;
  cp5.addTextfield("Pista 1")
     .setColor(color(0))
     .setPosition(width/2-200,530)
     .setSize(400,25)
     .setFont(createFont("arial",20))
     .setAutoClear(false)
     .setColorBackground(color(255))
     ;
     
  Group g1 = cp5.addGroup("Diodo")
                .setBackgroundColor(color(0, 54))
                .setBackgroundHeight(100)
                ;   
    cp5.addBang("DID")
        .setPosition(10,0)
        .setSize(100,100)
        .setImage(Diodo)
        .setTriggerEvent(Bang.RELEASE)
        .moveTo(g1)
        .plugTo(this,"DID");
        ;      
  Group g2 = cp5.addGroup("Resistencia")
                .setBackgroundColor(color(0, 64))
                .setBackgroundHeight(100)
                ;              
    cp5.addBang("Rest")
        .setPosition(10,0)
        .setSize(100,100)
        .setImage(Resistencia) 
        .moveTo(g2)
        .plugTo(this,"Rest");
        ;                
  Group g3 = cp5.addGroup("Condensador")
                .setBackgroundColor(color(0, 64))
                .setBackgroundHeight(100)
                ;
    cp5.addBang("Cond")
        .setPosition(10,0)
        .setSize(100,100)
        .setImage(Condensador) 
        .moveTo(g3)
        .plugTo(this,"Cond");
        ;                                       
 Group g5 = cp5.addGroup("Bobina")
                .setBackgroundColor(color(0, 64))
                .setBackgroundHeight(100)
                ;
   cp5.addBang("Bob")
          .setPosition(10,0)
          .setSize(100,100)
          .setImage(Bobina) 
          .moveTo(g5)
          .plugTo(this,"Bob");
          ;     
 Group g6 = cp5.addGroup("Fuente V")
                .setBackgroundColor(color(0, 64))
                .setBackgroundHeight(100)
                ;    
        cp5.addBang("FV")
          .setPosition(10,0)
          .setSize(100,100)
          .setImage(FuenteV) 
          .moveTo(g6)
          .plugTo(this,"FV");
          ;          
 Group g7 = cp5.addGroup("Fuente C")
               .setBackgroundColor(color(0, 64))
               .setBackgroundHeight(100)
               ;
     cp5.addBang("FC")
          .setPosition(10,0)
          .setSize(100,100)
          .setImage(FuenteC) 
          .moveTo(g7)
          .plugTo(this,"FC");
          ;  
 Group g8 = cp5.addGroup("Tierra")
               .setBackgroundColor(color(0, 64))
               .setBackgroundHeight(100)
               ;
  cp5.addBang("Ter")
          .setPosition(10,0)
          .setSize(100,100)
          .setImage(Tierra) 
          .moveTo(g8)
          .plugTo(this,"Ter");
          ;                
  Group g9 = cp5.addGroup("Transistor")
                .setBackgroundColor(color(0, 64))
                .setBackgroundHeight(100)
                ;
        cp5.addBang("Trans")
          .setPosition(10,0)
          .setSize(100,100)
          .setImage(Transistor) 
          .moveTo(g9)
          .plugTo(this,"Trans");
          ;                    
                
                
  accordion = cp5.addAccordion("acc")
                 .setPosition(5,30)
                 .setWidth(120)
                 .setHeight(125)
                 .addItem(g1)
                 .addItem(g2)
                 .addItem(g3)
                 .addItem(g5)
                 .addItem(g6)
                 .addItem(g7)
                 .addItem(g8)
                 .addItem(g9)
                 ;
  cp5.mapKeyFor(new ControlKey() {public void keyEvent() {accordion.open(0,1,2,3,4,5,6,7,8,9);}}, ALT, 'q');
  cp5.mapKeyFor(new ControlKey() {public void keyEvent() {accordion.close(0,1,2,3,4,5,6,7,8,9);}}, ALT, 'w');
  accordion.open(9);
  accordion.setCollapseMode(Accordion.MULTI); 
}

public void controlEvent(ControlEvent theEvent){
  if(theEvent.isFrom(r)){
    difld = theEvent.getValue();
  }
}

public void Bob(){
  co = new Bobina(point[n].x, point[n].y, 0, ro[n]);
  comps.add(co);
  dis = true; 
  n++;
}
public void DID(){
  co = new Diodo(point[n].x, point[n].y, 0, ro[n]);
  comps.add(co);
  dis = true; 
  n++;
}
public void Rest(){
  co = new Resistencia(point[n].x, point[n].y, 0, ro[n]);
  comps.add(co);
  dis = true; 
  n++;
}
public void Cond(){
  co = new Condensador(point[n].x, point[n].y, 0, ro[n]);
  comps.add(co);
  dis = true; 
  n++;
}

public void FV(){
  co = new FuenteV(point[n].x, point[n].y, 0, ro[n]);
  comps.add(co);
  dis = true;   
}
public void FC(){
  co = new FuenteC(point[n].x, point[n].y, 0, ro[n]);
  comps.add(co);
  dis = true; 
  
}
public void Ter(){
  co = new Tierra(point[n].x, point[n].y, 0, ro[n]);
  comps.add(co);
  dis = true; 
  n++;
}
public void Trans(){
  co = new Transistor(point[n].x, point[n].y, 0, ro[n]);
  comps.add(co);
  dis = true; 
  n++;
}

public void Atras() {
}
public void Sonido() {
  mp3.stop();
  
}
public void Borrar() {
  comps.clear();
  cabs.clear();
  n = 0;
}
public void Guardar() {
  lvlName = cp5.get(Textfield.class, "Nombre Nivel").getText();
  auName = cp5.get(Textfield.class, "Creador").getText();
  fnivelesd();
  pista0 = cp5.get(Textfield.class, "Pista 1").getText();;
  pista1 = cp5.get(Textfield.class, "Pista 2").getText();;
  pista2 = cp5.get(Textfield.class, "Pista 3").getText();;
  
  ubcp[1]= lvlName;
  ubcx[1]= lvlName;
  ubps[1]= lvlName;

  for (Componentes part : comps)
    fcomponentesd(part.getname(), part.getX(), part.getY(), part.getVis(), part.getRot());
  for (Cable part : cabs)
    fconexionesd(part.getname(), part.getX1(), part.getY1(), part.getX2(), part.getY2());
      
  fpistasd(pista0);
  fpistasd(pista1);
  fpistasd(pista2);
  
  textSize(100);
  fill(0, 102, 153);
  text("GUARDADO", width/4, height/2);
}

void fnivelesd(){
  TableRow newRowLvl = tabLvl.addRow();
  newRowLvl.setInt("id", tabLvl.lastRowIndex());
  newRowLvl.setString("lvl", lvlName);
  newRowLvl.setString("au", auName);
  newRowLvl.setFloat("difld", difld);
  saveTable(tabLvl, "data/tabLvl.csv");
}

void fconexionesd(String n, float x1, float y1, float x2, float y2){
  TableRow newRowCx = tabConx.addRow();
  newRowCx.setInt("id", tabConx.lastRowIndex());
  newRowCx.setString("linea", n);
  newRowCx.setFloat("x1", x1);
  newRowCx.setFloat("y1", y1);
  newRowCx.setFloat("x2", x2);
  newRowCx.setFloat("y2", y2);
  saveTable(tabConx, join(ubcx, "/"));
}

void fcomponentesd(String n, float x, float y, int v, int r){
  TableRow newRowCp = tabComp.addRow();
  newRowCp.setInt("id", tabComp.lastRowIndex());
  newRowCp.setString("comp", n);
  newRowCp.setFloat("x", x);
  newRowCp.setFloat("y", y);
  newRowCp.setInt("vis", v);
  newRowCp.setInt("rot", r);
  saveTable(tabComp, join(ubcp, "/"));
}
void fpistasd(String s){
  TableRow newRowPs = tabPs.addRow();
  newRowPs.setInt("id", tabPs.lastRowIndex());
  newRowPs.setString("ps", s);
  saveTable(tabPs, join(ubps, "/"));  
}

void principal(){
  cua = false;
  cp6 = new ControlP5(this);
  
  myTextlabel1 = cp6.addTextlabel("label")
                    .setText("INTERACTIVE")                 
                    .setPosition(170,80)
                    .setColorValue(0xffffff00)
                    .setFont(createFont("Georgia",90))
                    ;
   myTextlabel2 = cp6.addTextlabel("label2")
                    .setText("  CIRCUITS")
                    .setPosition(230,180)
                    .setColorValue(0xffffff00)
                    .setFont(createFont("Georgia",90))
                    ;                 

 cp6.addButton("Sonidop")
     .setValue(0)
     .setPosition(910,20)
     .setSize(50,40)
     .setColorBackground(color(0,0,150))
     ;

cp6.addButton("JUGAR")
     .setValue(1)
     .setPosition(280,400)
     .setSize(120,90)
     .setColorBackground(color(0,0,150))
     ;
cp6.addButton("CREAR_NIVEL")
     .setValue(2)
     .setPosition(450,400)
     .setSize(120,90)
     .setColorBackground(color(0,0,150))
     ;
cp6.addButton("COMO JUGAR")
     .setValue(3)
     .setPosition(620,400)
     .setSize(120,90)
     .setColorBackground(color(0,0,150))
     ;     
     
     
     myTextarea1 = cp6.addTextarea("txt")
                  .setPosition(780,610)
                  .setSize(220,90)
                  .setFont(createFont("arial",20))
                  .setLineHeight(15)
                  .setColor(color(255))
                  .setColorBackground(color(255,100))
                  .setColorForeground(color(255,100));
                  ;
  myTextarea1.setText("Creado por:"
                    + "       "
                    +" Cortes Santiago"
                    +" "
                    +" Ramirez Jose Manuel"
                    +" Ramirez Juan Esteban"
                    );
}
//Table tabCompj, tabConxj, tabTmp, tabPsj;
//ArrayList<Componentes> compsj = new ArrayList<Componentes>();
//ArrayList<Cable> cabsj = new ArrayList<Cable>();
void guij() {
  cua = true;
  cp7 = new ControlP5(this);
  cargarCx();
  cargarP();
  
  myTextlabelA = cp7.addTextlabel("Titulo")
                    .setText("RED CIRCUIT")
                    .setPosition(210,20)
                    .setColorValue(0xffffff00)
                    .setFont(createFont("Georgia",80))
                    ;

  cp7.addButton("Atrasj")
     .setValue(0)
     .setPosition(940,20)
     .setSize(50,40)
     .setColorBackground(color(200, 54,150))
     ;
  cp7.addButton("Sonidoj")
     .setValue(50)
     .setPosition(885,20)
     .setSize(50,40)
     .setColorBackground(color(200, 54,150))
     ;
     
  cp7.addButton("Borrarj")
     .setValue(100)
     .setPosition(885,200)
     .setSize(100,40)
     .setColorBackground(color(20, 150,50))
     ;
  cp7.addButton("Revisar")
     .setValue(150)
     .setPosition(885,250)
     .setSize(100,40)
     .setColorBackground(color(20, 150,50))
     ;
     
  myTextarea = cp7.addTextarea("2")
                  .setPosition(0,10)
                  .setSize(150,20)
                  .setFont(createFont("arial",12))
                  .setLineHeight(14)
                  .setColor(color(0))
                  .setColorBackground(color(200,150))
                  .setText("COMPONENTES");
                  ;
                  
  myTextlabelP1 = cp7.addTextlabel("P1")
                    .setText("PISTA 1: " + p1)
                    .setPosition(width/2-320,520)
                    .setColorValue(0xffffff00)
                    .setFont(createFont("arial",25))
                    ;
  myTextlabelP2 = cp7.addTextlabel("P2")
                    .setText("PISTA 2: "  + p2)
                    .setPosition(width/2-320,570)
                    .setColorValue(0xffffff00)
                    .setFont(createFont("arial",25))
                    ;                  
   myTextlabelP3 = cp7.addTextlabel("P3")
                    .setText("PISTA 3: " + p3)
                    .setPosition(width/2-320,620)
                    .setColorValue(0xffffff00)
                    .setFont(createFont("arial",25))
                    ;     
     
  Group g1 = cp7.addGroup("Diodo")
                .setBackgroundColor(color(0, 54))
                .setBackgroundHeight(100)
                ;   
    cp7.addBang("DID")
        .setPosition(10,0)
        .setSize(100,100)
        .setImage(Diodo)
        .setTriggerEvent(Bang.RELEASE)
        .moveTo(g1)
        .plugTo(this,"DIDj");
        ;      
  Group g2 = cp7.addGroup("Resistencia")
                .setBackgroundColor(color(0, 64))
                .setBackgroundHeight(100)
                ;              
    cp7.addBang("Rest")
        .setPosition(10,0)
        .setSize(100,100)
        .setImage(Resistencia) 
        .moveTo(g2)
        .plugTo(this,"Restj");
        ;                
  Group g3 = cp7.addGroup("Condensador")
                .setBackgroundColor(color(0, 64))
                .setBackgroundHeight(100)
                ;
    cp7.addBang("Cond")
        .setPosition(10,0)
        .setSize(100,100)
        .setImage(Condensador) 
        .moveTo(g3)
        .plugTo(this,"Condj");
        ;                                       
 Group g5 = cp7.addGroup("Bobina")
                .setBackgroundColor(color(0, 64))
                .setBackgroundHeight(100)
                ;
   cp7.addBang("Bob")
          .setPosition(10,0)
          .setSize(100,100)
          .setImage(Bobina) 
          .moveTo(g5)
          .plugTo(this,"Bobj");
          ;     
 Group g6 = cp7.addGroup("Fuente V")
                .setBackgroundColor(color(0, 64))
                .setBackgroundHeight(100)
                ;    
        cp7.addBang("FV")
          .setPosition(10,0)
          .setSize(100,100)
          .setImage(FuenteV) 
          .moveTo(g6)
          .plugTo(this,"FVj");
          ;          
 Group g7 = cp7.addGroup("Fuente C")
               .setBackgroundColor(color(0, 64))
               .setBackgroundHeight(100)
               ;
     cp7.addBang("FC")
          .setPosition(10,0)
          .setSize(100,100)
          .setImage(FuenteC) 
          .moveTo(g7)
          .plugTo(this,"FCj");
          ;  
 Group g8 = cp7.addGroup("Tierra")
               .setBackgroundColor(color(0, 64))
               .setBackgroundHeight(100)
               ;
  cp7.addBang("Ter")
          .setPosition(10,0)
          .setSize(100,100)
          .setImage(Tierra) 
          .moveTo(g8)
          .plugTo(this,"Terj");
          ;                
  Group g9 = cp7.addGroup("Transistor")
                .setBackgroundColor(color(0, 64))
                .setBackgroundHeight(100)
                ;
        cp7.addBang("Trans")
          .setPosition(10,0)
          .setSize(100,100)
          .setImage(Transistor) 
          .moveTo(g9)
          .plugTo(this,"Transj");
          ;                    
                
                
  accordion = cp7.addAccordion("acc")
                 .setPosition(5,30)
                 .setWidth(120)
                 .setHeight(125)
                 .addItem(g1)
                 .addItem(g2)
                 .addItem(g3)
                 .addItem(g5)
                 .addItem(g6)
                 .addItem(g7)
                 .addItem(g8)
                 .addItem(g9)
                 ;
  cp7.mapKeyFor(new ControlKey() {public void keyEvent() {accordion.open(0,1,2,3,4,5,6,7,8,9);}}, ALT, 'q');
  cp7.mapKeyFor(new ControlKey() {public void keyEvent() {accordion.close(0,1,2,3,4,5,6,7,8,9);}}, ALT, 'w');
 

  accordion.open(9);

  accordion.setCollapseMode(Accordion.MULTI);
  
}

public void Bobj(){
  co = new Bobina(point[n].x, point[n].y, 0, ro[n]);
  comps.add(co);
  dis = true; 
  n++;
}
public void DIDj(){
  co = new Diodo(point[n].x, point[n].y, 0, ro[n]);
  comps.add(co);
  dis = true; 
  n++;
}
public void Restj(){
  co = new Resistencia(point[n].x, point[n].y, 0, ro[n]);
  comps.add(co);
  dis = true; 
  n++;
}
public void Condj(){
  co = new Condensador(point[n].x, point[n].y, 0, ro[n]);
  comps.add(co);
  dis = true; 
  n++;
}

public void FVj(){
  co = new FuenteV(point[n].x, point[n].y, 0, ro[n]);
  comps.add(co);
  dis = true;   
}
public void FCj(){
  co = new FuenteC(point[n].x, point[n].y, 0, ro[n]);
  comps.add(co);
  dis = true; 
  
}
public void Terj(){
  co = new Tierra(point[n].x, point[n].y, 0, ro[n]);
  comps.add(co);
  dis = true; 
  n++;
}
public void Transj(){
  co = new Transistor(point[n].x, point[n].y, 0, ro[n]);
  comps.add(co);
  dis = true; 
  n++;
}

public void Atrasj() {
}
public void Sonidoj() {
  mp3.stop();  
}
public void Borrarj() {
  comps.clear();
  n = 0;
}
public void Revisar() {
  for (Componentes part : comps)
    fcomponentesj(part.getname(), part.getX(), part.getY(), part.getVis(), part.getRot());
  comparar();
}

void fcomponentesj(String n, float x, float y, int v, int r){
  TableRow newRowTmp = tabTmp.addRow();
  newRowTmp.setInt("id", tabTmp.lastRowIndex());
  newRowTmp.setString("comp", n);
  newRowTmp.setFloat("x", x);
  newRowTmp.setFloat("y", y);
  newRowTmp.setInt("vis", v);
  newRowTmp.setInt("rot", r);
  saveTable(tabTmp, "data/tabTmp.csv");
}

void comparar(){
  int eval = 0;
  for(int i = 0; i<tabCompj.getRowCount(); i++){
    TableRow rowCpj = tabCompj.getRow(i);
      String compj = rowCpj.getString("comp");
      float x = rowCpj.getFloat("x");
      float y = rowCpj.getFloat("y");
    for(int j = 0; j<tabTmp.getRowCount(); j++){
      TableRow rowTmp = tabTmp.getRow(j);
        String compT = rowTmp.getString("comp");
        float xT = rowTmp.getFloat("x");
        float yT = rowTmp.getFloat("y");
      if(compj == compT && x-20<xT && x+20>xT && y-20<yT && y+20>yT)
        eval++;           
    }  
    println(eval);
    println(tabComp.getRowCount());
    if(eval == tabComp.getRowCount()){
      textSize(100);
      fill(0, 102, 153);
      text("GANASTE", width/4, height/2);
    }
    else{
      //mal
      textSize(100);
      fill(0, 102, 153);
      text("PERDISTE", width/4, height/2);
      break;
    }
  }
}

void cargarCx(){
  for(int i = 0; i<tabConxj.getRowCount(); i++){
    println(tabConxj.getFloat(i, "x1"));
    println(tabConxj.getFloat(i, "y1"));
    println(tabConxj.getFloat(i, "x2"));
    println(tabConxj.getFloat(i, "y2"));
    ca = new Cable(tabConxj.getFloat(i, "x1"), tabConxj.getFloat(i, "y1"), tabConxj.getFloat(i, "x2"), tabConxj.getFloat(i, "y2"), 0);
    cabs.add(ca);
  }
  dis = true;
}
void cargarP(){
  p1 = tabPsj.getString(0, "ps");
  p2 = tabPsj.getString(1, "ps");
  p3 = tabPsj.getString(2, "ps");
}
void cJ(){
  cua = false;
  size(1000,700);
  cp5 = new ControlP5(this);
img = loadImage("circuitofondo.jpg");
  myTextlabel1 = cp5.addTextlabel("label")
                    .setText("COMO")                 
                    .setPosition(110,80)
                    .setColorValue(0xffffff00)
                    .setFont(createFont("Georgia",110))
                    ;
   myTextlabel2 = cp5.addTextlabel("label2")
                    .setText("JUGAR")
                    .setPosition(480,80)
                    .setColorValue(0xffffff00)
                    .setFont(createFont("Georgia",110))
                    ;                 

  cp5.addButton("Atras")
     .setValue(0)
     .setPosition(940,20)
     .setSize(50,40)
     .setColorBackground(color(200, 54,150))
     ;
  
  
  cp5.addButton("Sonidoc")
     .setValue(50)
     .setPosition(885,20)
     .setSize(50,40)
     .setColorBackground(color(200, 54,150))
     ;


     myTextarea1 = cp5.addTextarea("txt1")
                  .setPosition(100,200)
                  .setSize(800,400)
                  .setFont(createFont("arial",19))
                  .setLineHeight(15)
                  .setColor(color(255))
                  .setColorBackground(color(255,100))
                  .setColorForeground(color(255,100));
                  ;
  myTextarea1.setText("*El juego consiste en completar el circuito  que aparece en pantalla"
                    +" colocando los diferentes componentes en los espacios correspondientes."
                    +"                                                                                                             "
                    +"                                                                                                             "
                    +"*Hay dos modos de juego, jugar y crear nivel. Crear nivel permite diseñar un nuevo circuito y guardarlo. Jugar permite jugar niveles creados."
                    +"                                                                                                              "
                    +"                                                                                                              "
                    +"*Para colocar los componentes haga click en el componente que necesite, (siempre comenzado por la fuente) este aparecera dentro de la pantalla, maximo se pueden poner 10 componentes."
                    +"                                                                                                                                      "
                    +"                                                                                                                                      "
                    +"*Para mover los componentes  presione un numero dependiendo del orden en que aparecieron los componentes (1-0) y muevalo con el click del mouse, para dejar de mover el componente oprima otra tecla."
                    +"                                                                                                                             "
                    +"                                                                                                                             "
                    +"*Para rotar los componentes se rota el ultimo componente colocado y se oprime SHIFT para girarlo 90 grados."
                    +"                                                                                                                                   "
                    +"                                                                                                                                   "
                    +"*Para abrir y cerrar el acordeon oprima ALT q y ALT w respectivamente."
                    +"                                                                                           "
                    +"                                                                                           "
                    +"*Para añadir cable utilice las flechas para ubicar el cable la posicion del mouse"
                    );
     
     myTextarea = cp5.addTextarea("txt")
                  .setPosition(750,610)
                  .setSize(300,90)
                  .setFont(createFont("arial",19))
                   .setBorderColor(155)
                  .setColor(color(255))
                  .setColorBackground(color(255,100))
                  .setColorForeground(color(255,100));
                  ;
  myTextarea.setText("Creado por:"
                    + "                               "
                    +" Cortes Santiago"
                    +" "
                    +"                        Ramirez Jose Manuel"
                    +"                  Ramirez Juan Esteban"
                    );
}
void Sonidoc(){
  mp3.stop();
}
void Sonidop(){
  mp3.stop();
}
