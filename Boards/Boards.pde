public class Board {
  Space[][] board;
  int bWidth;
  int bHeight;
  int mineCount;
  boolean gameOver;
  int coveredSafe;
  boolean gameWon;
  public Board() {
    board = new Space[30][10];
    bHeight = 30;
    bWidth = 10;
    for (int i = 0; i < board.length; i++) {
      for (int j = 0; j < board[0].length; j++) {
        board[i][j] = new Space(j*10, i*10, 10);
        //board[i][j].drawSquare();
      }
    }
  }
  public Board(int bWidth, int bHeight, int mineCount) {
    board = new Space[bHeight][bWidth];
    this.bHeight = bHeight;
    this.bWidth = bWidth;
    for (int i = 0; i < board.length; i++) {
      for (int j = 0; j < board[0].length; j++) {
        board[i][j] = new Space(j*20, i*20, 20);
        //board[i][j].drawSquare(j*10,i*10,10);
      }
    }
    this.mineCount = mineCount;
    coveredSafe = bWidth*bHeight-mineCount;
    System.out.println(coveredSafe);
    gameOver = false;
  }
  void placeMines() {
    Space space;
    for (int i = 0; i < mineCount; i++) {
      space = board[(int)(Math.random()*(bHeight))][(int)(Math.random()*(bWidth))];
      if (space.getType().equals("undefined")) {
        space.changeType("mine");
      } else {
        i--;
      }
    }
    for (int i = 0; i < board.length; i++) {
      for (int j = 0; j < board[0].length; j++) {
        space=board[i][j];
        if (space.getType().equals("undefined")) {
          space.changeType("notMine");
        }
      }
    }
  }

  void countAdjacent(int x, int y) {
    int adj = 0;
    if (x!=0) {
      if (board[y][x-1].getType().equals("mine")) {
        adj++;
      }
      if (y!=board.length-1) {
        if (board[y+1][x-1].getType().equals("mine")) {
          adj++;
        }
      }
      if (y!=0) {
        if (board[y-1][x-1].getType().equals("mine")) {
          adj++;
        }
      }
    }
    if (y!=0) {
      if (board[y-1][x].getType().equals("mine")) {
        adj++;
      }
    }
    if (y!=board.length-1) {
      if (board[y+1][x].getType().equals("mine")) {
        adj++;
      }
    }
    if (x!=bWidth-1) {
      if (board[y][x+1].getType().equals("mine")) {
        adj++;
      }
      if (y!=board.length-1) {
        if (board[y+1][x+1].getType().equals("mine")) {
          adj++;
        }
      }
      if (y!=0) {
        if (board[y-1][x+1].getType().equals("mine")) {
          adj++;
        }
      }
    }
    board[y][x].changeAdjacent(adj);
  }
  void displayMines() {
    for (int i = 0; i < board.length; i++) {
      for (int j = 0; j < board[0].length; j++) {
        if (board[i][j].getType().equals("mine") && board[i][j].flag == false) {
          board[i][j].uncover();
        }
      }
    }
  }

  Space[][] returnBoard() {
    return board;
  }
  void showMostSafe(){
    for (int i = 0; i < board.length; i++) {
      for (int j = 0; j < board[0].length; j++) {
        if (board[i][j].getType().equals("notMine") && board[i][j].uncovered == true && coveredSafe>1) {
          countAdjacent(j, i);
            coveredSafe--;
          board[i][j].uncover();
        }
        else if (board[i][j].getType().equals("mine")){
          board[i][j].changeFlag();
      }
    }
  }
  System.out.println(coveredSafe);
}
}
