//testing
//testing!!!!
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
  int yCor = (mouseY+offsetY)/sizeSquare;
  int xCor = (mouseX+offsetY)/sizeSquare;
  System.out.println(yCor);
  System.out.println(xCor);
  Space square = board.returnBoard()[yCor][xCor];
  if(!spaceClicked){
    square.changeType("notMine");
    board.placeMines();
    //make placeMines have 2 params so that you can tell which square can't be a mine
  }
  if(square.getUncovered()){
    System.out.println("it's uncovered!");
    board.countAdjacent((mouseY+offsetY)/sizeSquare,(mouseX+offsetX)/sizeSquare);
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
