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
  public void changeAdjacent(){}
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
  
  public void drawSquare(int x, int y){}
}
