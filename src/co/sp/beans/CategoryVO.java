package co.sp.beans;

public class CategoryVO {
  
  //  category_no        NUMBER(10)         NOT NULL       PRIMARY KEY,
  //  category_name      VARCHAR2(50)       NOT NULL
  
  /** ī�װ� ��ȣ **/
  private int category_no;
  
  /** ī�װ� �̸� **/
  private String category_name;
  
  ////////////////////////////////////////////////////////////////////////////////////
  
  public int getCategory_no() {
    return category_no;
  }
  
  public void setCategory_no(int category_no) {
    this.category_no = category_no;
  }
  
  public String getCategory_name() {
    return category_name;
  }
  
  public void setCategory_name(String category_name) {
    this.category_name = category_name;
  }

}
