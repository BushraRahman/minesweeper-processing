public class Board {
  private Space[][] board;
  private int bWidth;
  private int bHeight;
  private int mineCount;
  private boolean gameOver;
  private boolean gameWon;
  
  public Board(){
    bWidth = 18;
    bHeight = 15;
    board = makeBoard(bWidth, bHeight);
    mineCount = 40;
    gameOver = false;
    gameWon = false;
  }
  
  public Board(int Width, int Height){
    bWidth = Width;
    bHeight = Height;
    board = makeBoard(bWidth, bHeight);
    mineCount = 40;
    gameOver = false;
    gameWon = false;
  }

  private Space[][] makeBoard(int Width, int Height){
    Space[][] board = new Space[Height][Width];
    for (int r = 0; r < board.length; r++){
      for (int c = 0; c < board[r].length; c++){
        board[r][c] = new Space();
        /*if (Math.random() < mineCount) {
            board[r][c].changeType("mine");
          } else {
            board[r][c].changeType("notMine");
          }*/
         
      }
    }
    return board;
  }
  
  
  public void drawBoard(){
    for (int r = 0; r < board.length; r++){
      for (int c = 0; c < board[r].length; c++){
        board[r][c].drawSquare(c * 20,r * 20,20);
      }
    }
  }
  
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
  void displayMines(){
    for (int i = 0; i < board.length; i++){
      for (int j = 0; j < board[0].length; j++){
        if(board[i][j].getType.equals("mine")){
          board[i][j].uncover();
        }
      }
    }
  }
}
