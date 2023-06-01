double accuracy;
int gamesPlayed;
int sizeSquare;
boolean spaceClicked;
int offsetX;
int offsetY;
boolean optCollapsed;
int optX;
int optY;
int optSizeX;
int optSizeY;
boolean gameOverShown;
float restartX;
float restartY;
int restartWidth;
int restartHeight;
Board board;
void setup() {
  size(500, 500);
  offsetX = 0;
  offsetY = 20;
  board = new Board(16, 16, 40);
  spaceClicked = false;
  sizeSquare=20;
  optCollapsed = true;
  drawButton();
}
void draw() {
}
void mouseClicked() {
  System.out.println(mouseX);
  if (!board.gameOver) {
    int yCor = (mouseY-offsetY)/sizeSquare;
    int xCor = (mouseX-offsetX)/sizeSquare;
    if (yCor < board.bHeight && xCor < board.bWidth) {
      Space square = board.returnBoard()[yCor][xCor];
      if (mouseButton == LEFT) {
        if (!spaceClicked) {
          square.changeType("notMine");
          board.placeMines();
          spaceClicked = true;
          //board.displayMines();
        }
        if (square.getUncovered()) {
          if (square.getType().equals("notMine")) {
            board.countAdjacent(xCor, yCor);
            board.coveredSafe--;
            if (board.coveredSafe==0) {
              fill(0);
              text("Game Won", 20, 10);
              noFill();
              board.gameOver = true;
              board.gameWon = true;
            }
            if (square.getAdjacent() == 0) {
              //board.uncoverAdjacent(xCor,yCor);
              //make uncoveredAjacent have 2 params so that you know where you're starting from
            }
          } else {
            board.displayMines();
            board.gameOver = true;
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
      if (mouseButton == RIGHT) {
        if (square.getUncovered()) {
          square.changeFlag();
        }
      }
    }
  }
  if (gameOverShown) {
    if (mouseX >= restartX && mouseX <= restartX+restartWidth && mouseY >= restartY && mouseX <= restartY+restartHeight) {
      background(60);
      board = new Board(board.bWidth, board.bHeight, board.mineCount);
      spaceClicked = false;
      gameOverShown = false;
      board.gameOver = false;
    }
  }
  if (board.gameOver && !gameOverShown) {
    delay(500);
    drawGameOver();
  }
}

void keyPressed() {
  if (key == 'a') {
    System.out.println("!!");
  }
}

void custom() {
}
void drawButton() {
  optX = 10;
  optY = 0;
  rect(optX, optY, 50, 15);
  fill(0);
  text("Options", optX+2, optY+10);
  noFill();
}
void drawGameOver() {
  gameOverShown = true;
  int startX = 50;
  int startY = 50;
  int widthB = 300;
  int heightB = 300;
  fill(255);
  rect(startX, startY, widthB, heightB);
  fill(0);
  if (board.gameWon) {
    textAlign(CENTER);
    text("Game Won", startX+0.5*widthB, startY+0.5*heightB);
  } else {
    textAlign(CENTER);
    text("Game Lost", startX+0.5*widthB, startY+0.5*heightB);
  }
  //PImage img = loadImage("restartButton.png");
  fill(255);
  rectMode(CORNER);
  restartX=startX+0.5*widthB-0.5*restartWidth;
  restartY=startY+0.8*heightB-0.5*restartHeight;
  restartWidth=80;
  restartHeight=30;
  rect(restartX, restartY, restartWidth, restartHeight);
  fill(0);
  text("RESTART", startX+0.5*widthB, startY+0.8*heightB);
  noFill();
  rectMode(CORNER);
}
