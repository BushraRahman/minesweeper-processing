public class Space{
  private String type;
  private boolean flag;
  private boolean covered;
  private int adjacent;
  
  public Space(){
    flag = false;
    covered = true;
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
  public boolean getCovered(){
    return covered;
  }
  public void uncover(){
    covered = false;
    //should add drawSquare to this
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
  public void drawSquare(int x, int y, int size){
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
