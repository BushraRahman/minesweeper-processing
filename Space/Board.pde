public class Board {
  void placeMines() {
    Space space;
    for (int i = 0; i < mineCount; i++){
      space = board[Math.random()*(bHeight+1)][Math.random()*(bWidth+1)];
      if(space.getType.equals("undefined")){
        space.changeType("mine");
      }else{
        i--;
      }
    }
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
    board[y][x].changeAdjacent(adj);
  }
