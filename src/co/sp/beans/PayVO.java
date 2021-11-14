package co.sp.beans;

public class PayVO {
/*CREATE TABLE pay(
      pay_no                              NUMBER(10)       NOT NULL       PRIMARY KEY,
      reservation_no                      NUMBER(10)       NULL ,
      pay_total                           NUMBER(10)       NOT NULL,
      pay_rdate                           DATE           NOT NULL,
      pay_method                          VARCHAR2(50)       NOT NULL,
  FOREIGN KEY (reservation_no) REFERENCES reservation (reservation_no)
);


COMMENT ON TABLE pay is '결제';
COMMENT ON COLUMN pay.pay_no is '결제 번호';
COMMENT ON COLUMN pay.reservation_no is '예약 번호';
COMMENT ON COLUMN pay.pay_total is '결제금액';
COMMENT ON COLUMN pay.pay_rdate is '결제일자';
COMMENT ON COLUMN pay.pay_method is '결제방법';
*/
	private int pay_no;
	private int reservation_no;
	private int pay_total;
	private String pay_rdate;
	private String pay_method;
	
	
	public int getPay_no() {
		return pay_no;
	}
	public void setPay_no(int pay_no) {
		this.pay_no = pay_no;
	}
	public int getReservation_no() {
		return reservation_no;
	}
	public void setReservation_no(int reservation_no) {
		this.reservation_no = reservation_no;
	}
	public int getPay_total() {
		return pay_total;
	}
	public void setPay_total(int pay_total) {
		this.pay_total = pay_total;
	}
	public String getPay_rdate() {
		return pay_rdate;
	}
	public void setPay_rdate(String pay_rdate) {
		this.pay_rdate = pay_rdate;
	}
	public String getPay_method() {
		return pay_method;
	}
	public void setPay_method(String pay_method) {
		this.pay_method = pay_method;
	}
	
	

}
