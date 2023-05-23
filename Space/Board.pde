public class Board{
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
}
      
