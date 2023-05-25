public class Space{
  private String type;
  private boolean flag;
  private boolean uncovered;
  private int adjacent;
  private int x;
  private int y;
  private int size;
  
  public Space(){
    flag = false;
    uncovered = true;
    type = "undefined";
  }
  
  public String getType(){
    return type;
  }
  public void changeType(String type){
    this.type = type;
  }
  public void changeAdjacent(int adj){
    adjacent = adj;
  }
  public int getAdjacent(){
    return adjacent;
  }
  public boolean getUncovered(){
    return uncovered;
  }
  public void uncover(){
    uncovered = false;
    drawSquare();
  }
  public void changeFlag(){
    if (flag){
      flag = false;
    }else{
      flag = true;
    }
  }
  

  /*For now:
  flag is a red rectangle
  mine is a red circle
  */
  public void drawSquare(){
    fill(255,203,164);
    square(x,y,size);
    noFill();
    if(uncovered && flag){
        rectMode(CENTER);
        fill(255,0,0);
        rect(x+size/2,y+size/2,size/2,size-10);
        noFill();
        rectMode(CORNER);
    }
    else if (!uncovered){
      if(type.equals("mine")){
        ellipseMode(CENTER);
        fill(255,0,0);
        circle(x+size/2,y+size/2,size/2);
        noFill();
      }
      if(type.equals("notMine")){
        if(adjacent!=0){
          System.out.println("!!");
          textSize(size);
          fill(0);
          textAlign(CENTER);
          text(adjacent,x+size/2,y+size-2);
          fill(255);
  }
      }
    }
}
}
