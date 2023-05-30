//testing
//testing!!!!
double accuracy;
int gamesPlayed;
int sizeSquare;
boolean spaceClicked;
int offsetX;
int offsetY;
boolean gameOver;
Board board;
void setup() {
  size(300, 400);
  board = new Board(15, 20);
  spaceClicked = false;
  offsetX = 100;
  offsetY = 0;
  sizeSquare=20;
}
void draw() {
}
void mouseClicked() {
  int yCor = (mouseY+offsetY)/sizeSquare;
  int xCor = (mouseX+offsetY)/sizeSquare;
  System.out.println("yCor"+yCor+"????");
  System.out.println("xCor"+xCor+"?????");
  if (yCor < board.bHeight && xCor < board.bWidth) {
    Space square = board.returnBoard()[yCor][xCor];
    System.out.println(square.getType());
    if (mouseButton == LEFT) {
      if (!spaceClicked) {
        square.changeType("notMine");
        board.placeMines();
        spaceClicked = true;
      }
      if (square.getUncovered()) {
        System.out.println("it's uncovered!");
        System.out.println("uncovered"+yCor);
        if (square.getType().equals("notMine")) {
          board.countAdjacent(xCor, yCor);
          System.out.println("neighbors"+square.getAdjacent());
          if (square.getAdjacent() == 0) {
            //board.uncoverAdjacent();
            //make uncoveredAjacent have 2 params so that you know where you're starting from
          }
        } else {
          board.displayMines();
          gameOver = true;
        }
        square.uncover();
      } else {
        if (keyPressed == true) {
          if (key == 'f') {
            square.changeFlag();
          }
        }
      }
      if (board.gameOver) {
        //board = new Board(15, 20);
      }
    }
    if (mouseButton == RIGHT){
      if (square.getUncovered()){
        square.changeFlag();
      }
    }
  }
}

void keyPressed() {
  if (key == 'a') {
    System.out.println("!!");
  }
}

void custom() {
}
