Table tabComp, tabConx, tabTmp, tabPs, tabLvl;
Componentes[] componente;
Conexiones[] conexion;

String lvlName, auName, difld;

int current = 1;
int series = 3;

String[] ubcp = new String[3];
String[] ubcx = new String[3];
String[] ubps = new String[3];

void setup(){
  size(1000, 700);
  ubcp[0]="levels";
  ubcx[0]="levels";
  ubps[0]="levels";
    lvlName = "Hey";
    auName = "Jhower";
    difld = "Dificil";
  ubcp[1]= lvlName;
  ubcx[1]= lvlName;
  ubps[1]= lvlName;
  ubcp[2]="tabComp.csv";
  ubcx[2]="tabConx.csv";
  ubps[2]="tabPs.csv";
  tabComp = loadTable("data/tabComp.csv", "header");  
  tabConx = loadTable("data/tabConx.csv", "header");
  tabTmp = loadTable("data/tabComp.csv", "header");
  tabPs = loadTable("data/tabPs.csv", "header");
  tabLvl = loadTable("data/tabLvl.csv", "header");
}

void draw(){
  switch(current) {
  case 1:
    background(0);
    break;
  case 2:
    background(255);
    break;
  case 3:
    background(127);
    break;
  }
}

void mousePressed() {
  switch(current) {
    //Jugar
    case 1:
      //Componentes
      TableRow newRowTmp = tabTmp.addRow();
      newRowTmp.setInt("id", tabTmp.lastRowIndex());
      newRowTmp.setString("comp", "ji");
      newRowTmp.setFloat("x", mouseX);
      newRowTmp.setFloat("y", mouseY);
      newRowTmp.setInt("rot", 0);
      newRowTmp.setInt("vis", 0);
      saveTable(tabTmp, "data/tabTmp.csv");
      break;
      
    //Diseñar
    case 2:
      //Componentes
      TableRow newRowCp = tabComp.addRow();
      newRowCp.setInt("id", tabComp.lastRowIndex());
      newRowCp.setString("comp", "ji");
      newRowCp.setFloat("x", mouseX);
      newRowCp.setFloat("y", mouseY);
      newRowCp.setInt("rot", 0);
      newRowCp.setInt("vis", 0);
      saveTable(tabComp, join(ubcp, "/"));
      
      //Conexiones
      TableRow newRowCx = tabConx.addRow();
      newRowCx.setInt("id", tabComp.lastRowIndex());
      newRowCx.setString("linea", "ji");
      newRowCx.setFloat("x1", mouseX);
      newRowCx.setFloat("y1", mouseY);
      newRowCx.setFloat("x2", mouseX);
      newRowCx.setFloat("y2", mouseY);
      saveTable(tabConx, join(ubcx, "/"));
      
      //Pistas
      TableRow newRowPs = tabPs.addRow();
      newRowPs.setInt("id", tabComp.lastRowIndex());
      newRowPs.setString("ps", "ji");
      saveTable(tabPs, join(ubps, "/"));
      
      //Niveles
      TableRow newRowLvl = tabLvl.addRow();
      newRowLvl.setInt("id", tabComp.lastRowIndex());
      newRowLvl.setString("lvl", lvlName);
      newRowLvl.setString("au", auName);
      newRowLvl.setString("difld", difld);
      saveTable(tabLvl, "data/tabLvl.csv");
      break;
      
    //Comparar
    case 3:
      int eval = 0;
      for(int i = 0; i<tabComp.getRowCount(); i++){
        TableRow rowCp = tabComp.getRow(i);
          String comp = rowCp.getString("comp");
          float x = rowCp.getFloat("x");
          float y = rowCp.getFloat("y");
          int rot = rowCp.getInt("rot");
        for(int j = 0; j<tabTmp.getRowCount(); j++){
          TableRow rowTmp = tabTmp.getRow(j);
            String compT = rowTmp.getString("comp");
            float xT = rowTmp.getFloat("x");
            float yT = rowTmp.getFloat("y");
            int rotT = rowTmp.getInt("rot");
          if(comp==compT && x==xT && y==yT && rot==rotT)
            eval++;            
        }
        if(eval == i+1){
          //bien
          text("Bien", 10, 15*(i+1));
        }
        else{
          //mal
          text("Mal PERDISTE", 10, 15*(i+1));
          break;
        }
        if(eval == tabComp.getRowCount()){
          text("FELICIDADES", width/2, height/2);
        }
      } 
      break;
  }
}

void keyPressed() {
  if (key == ' ')
    current = current < series ? current+1 : 1;
  }