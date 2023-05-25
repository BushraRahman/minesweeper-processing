public class Board {
  void placeMines(int x, int y) {
  }
  void countAdjacent(int x, int y) {
    int adj = 0;
    if (x!=0) {
      if (board[y][x-1].getType.equals("mine")) {
        adj++;
      }
      if (y!=board.length-1) {
        if (board[y+1][x-1].getType.equals("mine")) {
          adj++;
        }
      }
      if (y!=0) {
        if (board[y-1][x-1].getType.equals("mine")) {
          adj++;
        }
      }
    }
    if (y!=0){
      if (board[y-1][x].getType.equals("mine")) {
          adj++;
        }
    }
    if (y!=board.length-1) {
        if (board[y+1][x].getType.equals("mine")) {
          adj++;
      }
    }
    if (x!=bWidth) {
      if (board[y][x+1].getType.equals("mine")) {
        adj++;
      }
      if (y!=board.length-1) {
        if (board[y+1][x+1].getType.equals("mine")) {
          adj++;
        }
      }
      if (y!=0) {
        if (board[y-1][x+1].getType.equals("mine")) {
          adj++;
        }
      }
    }
  }
