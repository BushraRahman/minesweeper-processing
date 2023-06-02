public class Board {
  Space[][] board;
  int bWidth;
  int bHeight;
  int mineCount;
  boolean gameOver;
  int coveredSafe;
  boolean gameWon;
  boolean firstSpaceClicked;
  public Board() {
    this(16, 16, 40);
  }

  /*initializes board array based on given height and width
   and displays the board*/
  public Board(int bWidth, int bHeight, int mineCount) {
    board = new Space[bHeight][bWidth];
    this.bHeight = bHeight;
    this.bWidth = bWidth;
    for (int i = 0; i < board.length; i++) {
      for (int j = 0; j < board[0].length; j++) {
        board[i][j] = new Space(j*20, i*20, 20);
      }
    }
    this.mineCount = mineCount;
    coveredSafe = bWidth*bHeight-mineCount;
    gameOver = false;
  }

  //changes each Space's type from undefined to a mine or notMine
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
  
  void uncoverAdjacent(int x, int y){
    Space selected = board[y][x];
    countAdjacent(x,y);
    if (selected.getAdjacent() > 0 && !selected.getType().equals("mine")){
      selected.uncover();
      selected.drawSquare();
    }
    else if (selected.unchecked==false){
      if (!selected.getType().equals("mine")) selected.uncover();
      //countAdjacent(x,y);
      selected.drawSquare();
      selected.unchecked=true;
      if (x > 0 && selected.getType().equals("notMine")) uncoverAdjacent(x - 1,y);
      if (y > 0 && selected.getType().equals("notMine")) uncoverAdjacent(x,y - 1);
      if (x < bWidth - 1 && selected.getType().equals("notMine")) uncoverAdjacent(x + 1,y);
      if (y < bHeight - 1 && selected.getType().equals("notMine")) uncoverAdjacent(x,y + 1);
      /*selected.uncover();
      selected.drawSquare();
      if (x > 0) uncoverAdjacent(x - 1,y);
      if (y > 0) uncoverAdjacent(x,y - 1);
      if (x < bWidth - 1) uncoverAdjacent(x + 1,y);
      if (y < bHeight - 1) uncoverAdjacent(x,y + 1);*/
    }
  }

  //counts how many mines the Space that matches the parameters neighbors
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

  //displays all mines that aren't flagged
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

  //demo feature: uncovers all Spaces except one notMine
  void showMostSafe() {
    for (int i = 0; i < board.length; i++) {
      for (int j = 0; j < board[0].length; j++) {
        if (board[i][j].getType().equals("notMine") && board[i][j].covered == true && coveredSafe>1) {
          countAdjacent(j, i);
          coveredSafe--;
          board[i][j].uncover();
        } else if (board[i][j].getType().equals("mine")) {
          board[i][j].changeFlag();
        }
      }
    }
  }
  void uncoverAdjacent(int x, int y) {
    board[y][x].uncover();
    if (x!=0) {
      if (board[y][x-1].covered) {
        countAdjacent(x-1, y);
        board[y][x-1].uncover();
        coveredSafe--;
        if (board[y][x-1].adjacent==0) {
          uncoverAdjacent(x-1, y);
        }
      }
      if (y!=board.length-1) {
        if (board[y+1][x-1].covered) {
          countAdjacent(x-1, y+1);
          board[y+1][x-1].uncover();
          coveredSafe--;
          if (board[y+1][x-1].adjacent==0) {
            uncoverAdjacent(x-1, y+1);
          }
        }
      }
      if (y!=0) {
        if (board[y-1][x-1].covered) {
          this.countAdjacent(x-1, y-1);
          board[y-1][x-1].uncover();
          coveredSafe--;
          if (board[y-1][x-1].adjacent==0) {
            uncoverAdjacent(x-1, y-1);
          }
        }
      }
      if (y!=board.length-1) {
        if (board[y+1][x-1].covered) {
          this.countAdjacent(x-1, y+1);
          board[y+1][x-1].uncover();
          coveredSafe--;
          if (board[y+1][x-1].adjacent==0) {
            uncoverAdjacent(x-1, y+1);
          }
        }
      }
    }
    if (y!=0){
        if (board[y-1][x].covered) {
          this.countAdjacent(x, y-1);
          board[y-1][x].uncover();
          coveredSafe--;
          if (board[y-1][x].adjacent==0) {
            uncoverAdjacent(x, y-1);
          }
        }
      }
      if (y!=board.length-1){
        if (board[y+1][x].covered) {
          this.countAdjacent(x, y+1);
          board[y+1][x].uncover();
          coveredSafe--;
          if (board[y+1][x].adjacent==0) {
            uncoverAdjacent(x, y+1);
          }
        }
      }
      
    if (x!=bWidth-1) {
      if (board[y][x+1].covered) {
        this.countAdjacent(x+1, y);
        board[y][x+1].uncover();
        coveredSafe--;
        if (board[y][x+1].adjacent==0) {
          uncoverAdjacent(x+1, y);
        }
      }
      if (y!=board.length-1) {
        if (board[y+1][x+1].covered) {
          this.countAdjacent(x+1, y+1);
          board[y+1][x+1].uncover();
          coveredSafe--;
          if (board[y+1][x+1].adjacent==0) {
            uncoverAdjacent(x+1, y+1);
          }
        }
      }
      if (y!=0) {
        if (board[y-1][x+1].covered) {
          this.countAdjacent(x+1, y-1);
          board[y-1][x+1].uncover();
          coveredSafe--;
          if (board[y-1][x+1].adjacent==0) {
            uncoverAdjacent(x+1, y-1);
          }
        }
      }
    }
  }
}
