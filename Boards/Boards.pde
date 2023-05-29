public class Board {
  Space[][] board;
  int bWidth;
  int bHeight;
  int mineCount;
  boolean gameOver;
  public Board(){
    board = new Space[30][10];
    for (int i = 0; i < board.length; i++){
      for (int j = 0; j < board[0].length; j++){
        board[i][j] = new Space();
        board[i][j].drawSquare();
  }
    }
  }
  public Board(int bWidth, int bHeight){
    board = new Space[bHeight][bWidth];
    for (int i = 0; i < board.length; i++){
      for (int j = 0; j < board[0].length; j++){
        board[i][j] = new Space();
        board[i][j].drawSquare(j*10,i*10,10);
  }
    }
  }
  void placeMines() {
    Space space;
    for (int i = 0; i < mineCount; i++){
      space = board[(int)(Math.random()*(bHeight+1))][(int)(Math.random()*(bWidth+1))];
      if(space.getType().equals("undefined")){
        space.changeType("mine");
      }else{
        i--;
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
    if (y!=0){
      if (board[y-1][x].getType().equals("mine")) {
          adj++;
        }
    }
    if (y!=board.length-1) {
        if (board[y+1][x].getType().equals("mine")) {
          adj++;
      }
    }
    if (x!=bWidth) {
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
  void displayMines(){
    for (int i = 0; i < board.length; i++){
      for (int j = 0; j < board[0].length; j++){
        if(board[i][j].getType().equals("mine")){
          board[i][j].uncover();
        }
      }
    }
  }
  Space[][] returnBoard(){
    return board;
  }
}
