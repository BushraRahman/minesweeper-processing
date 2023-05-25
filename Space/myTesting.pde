
/*
Space a = new Space();
a.drawSquare(0,0,10);
*/
 
void test(){
//Space a = new Space();
//a.drawSquare(0,0,10);
for(int i = 0; i < 1; i++){
  for(int j = 0; j < 2; j++){
    rapid(i*30,j*30,30);
}
}
}
void rapid(int x, int y, int size){
  Space a = new Space();
  a.changeAdjacent(8);
a.changeType("notMine");
a.changeFlag();
//a.changeFlag();
//a.uncover();
a.drawSquare(x,y,size);
}
