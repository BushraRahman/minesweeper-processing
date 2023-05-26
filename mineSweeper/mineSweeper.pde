double accuracy;
int gamesPlayed;
int sizeSquare;
boolean spaceClicked;
int offsetX;
int offsetY;
Board board;
void setup(){
  size(400,400);
  board = new Board(15,20);
  spaceClicked = false;
  offsetX = 100;
  offsetY = 0;
  sizeSquare=10;
}
void draw(){}
void mouseClicked(){
  Space square = board.returnBoard()[(mouseY+offsetY)/sizeSquare][(mouseX+offsetX)/sizeSquare];
  if(!spaceClicked){
    square.changeType("notMine");
    board.placeMines();
    //make placeMines have 2 params so that you can tell which square can't be a mine
  }
  if(square.getUncovered()){
    square.uncover();
  }
  if (square.getType().equals("mine")){
    board.displayMines();
  }else{
    board.countAdjacent((mouseY+offsetY)/sizeSquare,(mouseX+offsetX)/sizeSquare);
    if(square.getAdjacent() == 0){
      //board.uncoverAdjacent();
    //make uncoveredAjacent have 2 params so that you know where you're starting from
  }
  }
  if (board.gameOver){
    board = new Board(15,20);
    }
}
    
void keyPressed(){
  if (key == 'a'){
    System.out.println("!!");
}
}

void custom(){}
