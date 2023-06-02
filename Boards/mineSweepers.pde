double accuracy;
int gamesPlayed;
int sizeSquare;
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
  size(325, 345);
  offsetX = 0;
  offsetY = 20;
  background(66, 179, 139);
  optCollapsed = true;
  drawButton();
  board = new Board(16, 16, 40);
  sizeSquare=20;
}

void draw() {
}

void mouseClicked() {
  //tests if the user clicked on the restart button on the top left
  if (mouseX >= optX && mouseX <= optX+optSizeX && mouseY >= optY && mouseY <= optY+optSizeY) {
    restart();
  }
  //tests if the game is ongoing and if the user didn't click to the left or above the board
  if (!board.gameOver && mouseY>=offsetY && mouseX>=offsetX) {
    int yCor = (mouseY-offsetY)/sizeSquare;
    int xCor = (mouseX-offsetX)/sizeSquare;
    //tests if the user clicked on the board
    if (yCor < board.bHeight && xCor < board.bWidth) {
      Space square = board.returnBoard()[yCor][xCor];
      if (mouseButton == LEFT) {
        //if no square on the board has been clicked yet, place mines on the board
        if (!board.firstSpaceClicked) {
          square.changeType("notMine");
          board.placeMines();
          board.firstSpaceClicked = true;
        }
        /* tests if the user clicked on a covered Space
        if the Space is already uncovered, clicking does not modify the board
        if the Space is covered, it becomes uncovered
        */
        if (square.getCovered()) {
          /*if the Space isn't a mine, count how many mines it's neighboring.
          if it's neighboring 0 mines, uncover Spaces in all directions until a
          mine-adjacent Space is reached.
          reduce the board's count of covered non-mines
          and the game is over is all non-mines are uncovered*/
          if (square.getType().equals("notMine")) {
            board.countAdjacent(xCor, yCor);
            board.coveredSafe--;
            if (board.coveredSafe==0) {
              board.gameOver = true;
              board.gameWon = true;
            }
            if (square.getAdjacent() == 0) {
              //board.uncoverAdjacent(xCor,yCor);
            }
            //if the clicked on Space was a mine, the game is over
          } else {
            board.gameOver = true;
          }
          square.uncover();
        }
      }
      //if a covered Space is right clicked, add or remove a flag
      if (mouseButton == RIGHT) {
        if (square.getCovered()) {
          square.changeFlag();
        }
      }
    }
  }
  /*restarts the game if the game over screen is being shown and the user clicks on the 
  area of the restart button*/
  if (gameOverShown) {
    if (mouseX >= restartX && mouseX <= restartX+restartWidth && mouseY >= restartY && mouseX <= restartY+restartHeight) {
      restart();
    }
  }
  /*if the game is over and the game over screen isn't being shown yet
  display all mines and display the game over screen*/
  if (board.gameOver && !gameOverShown) {
    board.displayMines();
    drawGameOver();
  }
}

//displays the restart button on the top left
void drawButton() {
  optX = 10;
  optY = 0;
  optSizeX = 50;
  optSizeY = 15;
  fill(124);
  rect(optX, optY, optSizeX, optSizeY);
  fill(0);
  textAlign(LEFT);
  textSize(12);
  text("Restart", optX+2, optY+10);
  noFill();
}

//displays the game over screen
void drawGameOver() {
  gameOverShown = true;
  //sets size of the screen and draw its outline
  int widthB = 300;
  int heightB = 300;
  int startX = (board.bWidth*sizeSquare-widthB)/2+offsetX;
  int startY = (board.bHeight*sizeSquare-heightB)/2+offsetY;
  fill(255, 200);
  rect(startX, startY, widthB, heightB);
  fill(0);
  //text displayed changes based on if the game was won or not
  if (board.gameWon) {
    textAlign(CENTER);
    text("Game Won", startX+0.5*widthB, startY+0.5*heightB);
  } else {
    textAlign(CENTER);
    text("Game Lost", startX+0.5*widthB, startY+0.5*heightB);
  }
  //displays the restart button in the screen
  fill(255, 200);
  rectMode(CORNER);
  restartWidth=80;
  restartHeight=30;
  restartX=startX+0.5*widthB-0.5*restartWidth;
  restartY=startY+0.8*heightB-0.5*restartHeight;
  rect(restartX, restartY, restartWidth, restartHeight);
  fill(0);
  text("RESTART", startX+0.5*widthB, startY+0.8*heightB);
  noFill();
  rectMode(CORNER);
}

/*draws a new board with the restart button on the top left and says the game over 
screen is not being shown*/
void restart() {
  background(66, 179, 139);
  optCollapsed = true;
  drawButton();
  board = new Board(16, 16, 40);
  gameOverShown = false;
}

//demo feature to show winning the game
void keyPressed() {
  if (keyCode == 's' || keyCode == 'S') {
    board.showMostSafe();
  }
}
