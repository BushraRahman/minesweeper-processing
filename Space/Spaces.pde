public class Space{
  private String type;
  private boolean flag;
  private boolean uncovered;
  private int adjacent;
  
  public Space(){
    flag = false;
    uncovered = true;
  }
  
  public String getType(){
    return type;
  }/*
  public void changeType(String new){
    type = new;
  }*/
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
  }
  public void changeFlag(){
    if (flag){
      flag = false;
    }else{
      flag = true;
    }
  }
  
  public void drawSquare(int x, int y, int size){
    square(x,y,size);
    if(uncovered && flag){
        rect(x,y,size/2,size-10);
    }
    else if (!uncovered){
      if(type.equals("mine")){
        circle(x,y,size);
      }
      if(type.equals("safe")){
        if(adjacent!=0){
          textSize(size);
          text(adjacent,x,y);
  }
      }
    }
}
}
