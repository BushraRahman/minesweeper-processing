double accuracy;
int gamesPlayed;
int gamesWon;
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
float customBoardX;
float customBoardY;
int customBoardWidth;
int customBoardHeight;
int unflaggedMines;
int time;
int customBoardMines;
boolean customBoardScreenShown;
Board board;

void setup() {
  size(510, 530);
  offsetX = 0;
  offsetY = 20;
  sizeSquare = 20;
  drawGame();
}

void draw() {
  displayTime();
}

void mouseClicked() {
  //tests if the user clicked on the restart button on the top left
  if (mouseX >= optX && mouseX <= optX+optSizeX && mouseY >= optY && mouseY <= optY+optSizeY) {
    drawGame();
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
              gamesWon++;
            }
            if (square.getAdjacent() == 0) {
              board.uncoverAdjacent(xCor,yCor);
            }
            //if the clicked on Space was a mine, the game is over
          } else {
            board.gameOver = true;
          }
          square.uncover();
        }
      }
      //if a covered Space is right clicked, add or remove a flag and update the mine count
      if (mouseButton == RIGHT) {
        if (square.getCovered()) {
          square.changeFlag();
          if(square.flag){
            unflaggedMines--;
        }else{
          unflaggedMines++;
      }
      displayMineCount();
        }
    }
  }
  }
  /*restarts the game if the game over screen is being shown and the user clicks on the 
  area of the restart button*/
  if (gameOverShown) {
    if (mouseX >= customBoardX && mouseX <= customBoardX+customBoardWidth && mouseY >= customBoardY && mouseX <= customBoardY+customBoardHeight) {
      gameOverShown = false;
      background(66, 179, 139);
      customBoardWidth = 20;
      customBoardHeight = 20;
      customBoardMines = 45;
      drawCustomBoardIntroScreen();
      customBoardScreenShown = true;
    }
    else if (mouseX >= restartX && mouseX <= restartX+restartWidth && mouseY >= restartY && mouseX <= restartY+restartHeight) {
      drawGame();
    }
  }
  if (customBoardScreenShown){
    int widthB = 300;
    int heightB = 300;
    int startX = (board.bWidth*sizeSquare-widthB)/2+offsetX;
    int startY = (board.bHeight*sizeSquare-heightB)/2+offsetY;
    float restartXW = startX+0.5*widthB-0.5*restartWidth;
    float restartYW = startY+0.25*heightB-0.5*restartHeight;
    if (mouseX <= restartXW - 5 && mouseX >= restartXW - 35 && mouseY >= restartYW && mouseY <= restartYW + 30){
      if (customBoardWidth > 16) customBoardWidth -= 1;
      drawCustomBoardIntroScreen();
    }
    if (mouseX >= restartXW + 70 - 5 && mouseX <= restartXW + 70 + 35 && mouseY >= restartYW && mouseY <= restartYW + 30){
      if (customBoardWidth < 25) customBoardWidth += 1;
      drawCustomBoardIntroScreen();
    }
    float restartXH = startX+0.5*widthB-0.5*restartWidth;
    float restartYH = startY+0.5*heightB-0.5*restartHeight;
    if (mouseX <= restartXH - 5 && mouseX >= restartXH - 35 && mouseY >= restartYH && mouseY <= restartYH + 30){
      if (customBoardHeight > 16) customBoardHeight -= 1;
      drawCustomBoardIntroScreen();
    }
    if (mouseX >= restartXH + 70 - 5 && mouseX <= restartXH + 70 + 35 && mouseY >= restartYH && mouseY <= restartYH + 30){
      if (customBoardHeight < 25) customBoardHeight += 1;
      drawCustomBoardIntroScreen();
    }
    float restartXM = startX+0.5*widthB-0.5*restartWidth;
    float restartYM = startY+0.75*heightB-0.5*restartHeight;
    if (mouseX <= restartXM - 5 && mouseX >= restartXM - 35 && mouseY >= restartYM && mouseY <= restartYM + 30){
      if (customBoardMines > 25) customBoardMines -= 1;
      drawCustomBoardIntroScreen();
    }
    if (mouseX >= restartXM + 70 - 5 && mouseX <= restartXM + 70 + 35 && mouseY >= restartYM && mouseY <= restartYM + 30){
      if (customBoardMines < 50) customBoardMines += 1;
      drawCustomBoardIntroScreen();
    }
    if (mouseX >= startX + 215 && mouseX <= startX + 215 + 80 && mouseY >= startY + 265 && mouseY <= startY + 265 + 30){
      drawGame(customBoardWidth, customBoardHeight,customBoardMines);
    }
  }
  /*if the game is over and the game over screen isn't being shown yet
  display all mines and display the game over screen*/
  else if (board.gameOver && !gameOverShown) {
    board.displayMines();
    drawGameOver();
  }
}

//displays the restart button at the top left
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
  text("RESTART", optX+2, optY+10);
  noFill();
}

//displays the game over screen
void drawGameOver() {
  time = millis();
  gamesPlayed++;
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
    text("Game Lost", startX+0.5*widthB, startY+0.25*heightB);
  }
  //displays the restart button in the screen
  fill(255, 200);
  rectMode(CORNER);
  restartWidth=80;
  restartHeight=30;
  restartX=startX+0.5*widthB-0.5*restartWidth;
  restartY=startY+0.575*heightB-0.5*restartHeight;
  rect(restartX, restartY, restartWidth, restartHeight);
  fill(0);
  text("RESTART", startX+0.5*widthB, startY+0.6*heightB);
  noFill();
  rectMode(CORNER);
  
  //displays the custom game button in the screen
  fill(255, 200);
  rectMode(CORNER);
  customBoardWidth=180;
  customBoardHeight=30;
  customBoardX=startX+0.5*widthB-0.5*customBoardWidth;
  customBoardY=startY+0.725*heightB-0.5*customBoardHeight;
  rect(customBoardX, customBoardY, customBoardWidth, customBoardHeight);
  fill(0);
  text("NEW CUSTOM GAME", startX+0.5*widthB, startY+0.75*heightB);
  noFill();
  rectMode(CORNER);
  
  //displays the game statistics
  text("Games played: " + gamesPlayed, startX+0.5*widthB, startY+0.35*heightB);
  text("Games won: " + gamesWon, startX+0.5*widthB, startY+0.3*heightB);
}
/*displays the pre-custom game screen asking for the measurements and number 
of mines for the custom board*/
void drawCustomBoardIntroScreen(){
  int widthB = 300;
  int heightB = 300;
  int startX = (board.bWidth*sizeSquare-widthB)/2+offsetX;
  int startY = (board.bHeight*sizeSquare-heightB)/2+offsetY;
  fill(255, 200);
  rect(startX, startY, widthB, heightB);
  fill(0);
  
  //box showing width of new board
  fill(255, 200);
  rectMode(CORNER);
  restartX=startX+0.5*widthB-0.5*restartWidth;
  restartY=startY+0.25*heightB-0.5*restartHeight;
  rect(restartX, restartY, 70, 30);
  fill(0);
  text("Width: " + customBoardWidth, startX+0.4*widthB, startY+0.27*heightB);
  noFill();
  rectMode(CORNER);
  
  //Arrows to shift numbers up and down
  fill(0);
  triangle(restartX - 5,restartY,restartX - 5, restartY + 30, restartX - 35, restartY + 15);
  triangle(restartX + 70 + 5,restartY,restartX + 70 + 5, restartY + 30, restartX + 70 + 35, restartY + 15);
  noFill();
  
  //box showing height of new board
  fill(255, 200);
  rectMode(CORNER);
  restartX=startX+0.5*widthB-0.5*restartWidth;
  restartY=startY+0.50*heightB-0.5*restartHeight;
  rect(restartX, restartY, 70, 30);
  fill(0);
  text("Height: " + customBoardHeight, startX+0.4*widthB, startY+0.52*heightB);
  noFill();
  rectMode(CORNER);
  
  fill(0);
  triangle(restartX - 5,restartY,restartX - 5, restartY + 30, restartX - 35, restartY + 15);
  triangle(restartX + 70 + 5,restartY,restartX + 70 + 5, restartY + 30, restartX + 70 + 35, restartY + 15);
  noFill();
  
  //box showing mines of new board
  fill(255, 200);
  rectMode(CORNER);
  restartX=startX+0.5*widthB-0.5*restartWidth;
  restartY=startY+0.75*heightB-0.5*restartHeight;
  rect(restartX, restartY, 70, 30);
  fill(0);
  text("Mines: " + customBoardMines, startX+0.4*widthB, startY+0.77*heightB);
  noFill();
  rectMode(CORNER);
  
  fill(0);
  triangle(restartX - 5,restartY,restartX - 5, restartY + 30, restartX - 35, restartY + 15);
  triangle(restartX + 70 + 5,restartY,restartX + 70 + 5, restartY + 30, restartX + 70 + 35, restartY + 15);
  noFill();
  
  //Create Game Button
  fill(255,200);
  rectMode(CORNER);
  rect(startX + 215, startY + 265, 80,30);
  fill(0);
  text("Create Game", startX + 220, startY + 285);
  noFill();
  rectMode(CORNER);
}

/*draws a board with the restart button on the top left and says the game over 
screen is not being shown*/
void drawGame() {
  background(66, 179, 139);
  optCollapsed = true;
  drawButton();
  board = new Board(16, 16, 40);
  gameOverShown = false;
  unflaggedMines = 40;
  displayMineCount();
  time = millis();
  displayTime();
}

/*draws a custom board with the restart button on the top left and says the game over 
screen is not being shown*/
void drawGame(int W, int H, int M) {
  background(66, 179, 139);
  optCollapsed = true;
  drawButton();
  board = new Board(W, H, M);
  gameOverShown = false;
  unflaggedMines = M;
  displayMineCount();
  time = millis();
  displayTime();
}

//demo feature to show winning the game
void keyPressed() {
  if (keyCode == 's' || keyCode == 'S') {
    board.showMostSafe();
    unflaggedMines = 0;
    displayMineCount();
  }
}

//shows number of mines minus the number of flags
void displayMineCount(){
  noStroke();
  fill(66, 179, 139);
  rectMode(CORNER);
  rect(optX+optSizeX+10,optY,70,10);
  stroke(0);
  textAlign(LEFT);
  textSize(13);
  fill(0);
  text("Mines: " + unflaggedMines,optX+optSizeX+10,optY+10);
  noFill();
}

void displayTime(){
  noStroke();
  fill(66, 179, 139);
  rectMode(CORNER);
  rect(optX+optSizeX+100,optY,30,10);
  stroke(0);
  textAlign(LEFT);
  textSize(13);
  fill(0);
  String sec = ((millis()-time)%60000/1000)+"";
  if (Integer.parseInt(sec) < 10){
    sec = 0 + sec;
  }
  text((millis()-time)%(60000*60)/60000 + ":" + sec,optX+optSizeX+100,optY+10);
  noFill();
}
  
