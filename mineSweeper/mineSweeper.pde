double accuracy;
int gamesPlayed;
int sizeSquare;
boolean spaceClicked;
int offsetX;
int offsetY;
Board board;

void setup(){
  board = new Board(18,15);
  sizeSquare = 10;
  spaceClicked = false;
  offsetX = 100;
  offsetY = 0;
  board.drawBoard();
}

void draw(){
  
}

void mouseClicked(){
  //Space square = board[(mouseY+offsetY)/sizeSquare][(mouseX+offsetX)/sizeSquare];
  Space square = board.getSpace((mouseY+offsetY)/sizeSquare, (mouseX+offsetX)/sizeSquare);
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
      // board.uncoverAdjacent();
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
