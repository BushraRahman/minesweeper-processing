public class Space{
  private String type;
  private boolean flag;
  private boolean covered;
  private int adjacent;
  private int x;
  private int y;
  private int size;
  boolean unchecked;
  
  public Space(){
    this(0,0,10);
  }
  
  /*sets the Space's coordinates, sets the Space as covered and with an undefined type
  and displays the Space*/
  public Space(int x, int y, int size){
    flag = false;
    covered = true;
    type = "undefined";
    size = 20;
    this.x = x+offsetX;
    this.y = y+offsetY;
    this.size = size;
    drawSquare();
  }
  
  //accessor and modifier methods for type (undefined, mine, or notMine)
  public String getType(){
    return type;
  }
  
  public void changeType(String type){
    this.type = type;
  }
  
  //accessor and modifier methods for adjacent (how many Spaces with the type mine that the Space neighbors)
  public void changeAdjacent(int adj){
    adjacent = adj;
  }
  public int getAdjacent(){
    return adjacent;
  }
  
  //accessor and modifer methods for if it's been uncovered or not
  public boolean getCovered(){
    return covered;
  }
  public void uncover(){
    covered = false;
    drawSquare();
  }
  
  //adds or removes its flag and displays the Space
  public void changeFlag(){
    if (flag){
      flag = false;
    }else{
      flag = true;
    }
    drawSquare();
  }
  
  /*displays each Space as a square
  flagged Spaces have red rectangles
  uncovered mines are black with red circles
  uncovered notMines have a number with how many mines it's neighboring 
  or is blank if it's not neighboring any mines
  */
  public void drawSquare(){
    fill(255,203,164);
    square(x,y,size);
    noFill();
    if(covered && flag){
        rectMode(CENTER);
        fill(255,0,0);
        rect(x+size/2,y+size/2,size/2,size-10);
        noFill();
        rectMode(CORNER);
    }
    else if (!covered){
      if(type.equals("mine")){
        fill(0);
        square(x,y,size);
        ellipseMode(CENTER);
        fill(255,0,0);
        circle(x+size/2,y+size/2,size/2);
        noFill();
      }
      if(type.equals("notMine")){
        fill(255);
        square(x,y,size);
        if(adjacent!=0){
          textSize(size);
          fill(0);
          textAlign(CENTER);
          text(adjacent,x+size/2,y+size*0.8);
          fill(255);
  }
      }
    }
}
public void drawWrongFlag(){
  fill(255,203,164);
    square(x,y,size);
    noFill();
    rectMode(CENTER);
        fill(0);
        rect(x+size/2,y+size/2,size/2,size-10);
        noFill();
        rectMode(CORNER);
}
}
