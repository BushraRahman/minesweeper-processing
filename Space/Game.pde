double accuracy;
int gamesPlayed;
int sizeSquare;
boolean squareClicked;
void setup(){
  size(400,400);
  Board board = new Board(15,20);
  squareClicked = false;
}
void draw(){}
void mouseClicked(){
  Spaces square = board[mouseY/sizeSquare][mouseX/sizeSquare];
  if(!squareClicked){
    board.placeMines();
    //make placeMines have 2 params so that you can tell which square can't be a mine
  }
  if(square.getCovered()){
    square.uncover();
  }
  if (square.getType.equals("mine")){
    board.displayMines();
  }else{
    board.countAdjacent();
    if(square.getAdjacent() == 0){
      board.uncoverAdjacent();
    //make placeMines have 2 params so that you can tell which square can't be a mine
  }
  }
}
    
void keyPressed(){}
