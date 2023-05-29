public class Board {
  Space[][] board;
  int bWidth;
  int bHeight;
  int mineCount;
  boolean gameOver;
  public Board(){
    board = new Space[30][10];
    bHeight = 30;
    bWidth = 10;
    for (int i = 0; i < board.length; i++){
      for (int j = 0; j < board[0].length; j++){
        board[i][j] = new Space(j*10,i*10,10);
        //board[i][j].drawSquare();
  }
    }
  }
  public Board(int bWidth, int bHeight){
    board = new Space[bHeight][bWidth];
    this.bHeight = bHeight;
    this.bWidth = bWidth;
    for (int i = 0; i < board.length; i++){
      for (int j = 0; j < board[0].length; j++){
        board[i][j] = new Space(j*10,i*10,10);
        //board[i][j].drawSquare(j*10,i*10,10);
  }
    }
    mineCount = 25;
  }
  void placeMines() {
    Space space;
    for (int i = 0; i < mineCount; i++){
      space = board[(int)(Math.random()*(bHeight))][(int)(Math.random()*(bWidth))];
      if(space.getType().equals("undefined")){
        space.changeType("mine");
      }else{
        i--;
      }
    }
    for (int i = 0; i < board.length; i++){
      for (int j = 0; j < board[0].length; j++){
        space=board[i][j];
        if(space.getType().equals("undefined")){
        space.changeType("notMine");
      }
        System.out.println(space.getType());
      }
    }
  }
    
  void countAdjacent(int x, int y) {
    System.out.println(y);
    System.out.println(x);
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
  void displayMines(){
    for (int i = 0; i < board.length; i++){
      for (int j = 0; j < board[0].length; j++){
        if(board[i][j].getType().equals("mine")){
          //board[i][j].uncover();
        }
      }
    }
  }
  Space[][] returnBoard(){
    return board;
  }
}
