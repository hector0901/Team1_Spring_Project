package co.sp.beans;

public class WaitingVO {
/*CREATE TABLE waiting(
      waiting_no                           NUMBER(10)       NOT NULL       PRIMARY KEY,
      member_no                           NUMBER(10)       NOT NULL ,
      shop_no                             NUMBER(10)       NOT NULL ,
      waiting_count                        NUMBER(10)       NOT NULL,
      waiting_rdate                        VARCHAR2(30 BYTE)       NOT NULL,
  FOREIGN KEY (shop_no) REFERENCES shop (shop_no),
  FOREIGN KEY (member_no) REFERENCES member (member_no)
);

COMMENT ON TABLE waiting is '������';
COMMENT ON COLUMN waiting.wating_no is '������ ��ȣ';
COMMENT ON COLUMN waiting.member_no is 'ȸ�� ��ȣ';
COMMENT ON COLUMN waiting.shop_no is '���� ��ȣ';
COMMENT ON COLUMN waiting.wating_count is '������ �ο�';
COMMENT ON COLUMN waiting.wating_rdate is '������ ��Ͻð�';
*/
	private int waiting_no;
	private int member_no;
	private int shop_no;
	private int waiting_count;
	private String waiting_rdate;
	private String shop_name;
	
	
	public int getWaiting_no() {
		return waiting_no;
	}
	public void setWaiting_no(int waiting_no) {
		this.waiting_no = waiting_no;
	}
	public int getMember_no() {
		return member_no;
	}
	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}
	public int getShop_no() {
		return shop_no;
	}
	public void setShop_no(int shop_no) {
		this.shop_no = shop_no;
	}
	public int getWaiting_count() {
		return waiting_count;
	}
	public void setWaiting_count(int waiting_count) {
		this.waiting_count = waiting_count;
	}
	public String getWaiting_rdate() {
		return waiting_rdate;
	}
	public void setWaiting_rdate(String waiting_rdate) {
		this.waiting_rdate = waiting_rdate;
	}
	public String getShop_name() {
		return shop_name;
	}
	public void setShop_name(String shop_name) {
		this.shop_name = shop_name;
	}
	
	
	
}
