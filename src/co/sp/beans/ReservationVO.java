package co.sp.beans;

import javax.validation.constraints.NotNull;

public class ReservationVO {

//  reservation_no                      NUMBER(10)       NOT NULL       PRIMARY KEY,
//  member_no                           NUMBER(10)       NOT NULL ,
//  shop_no                             NUMBER(10)       NOT NULL ,
//  reservation_rdate                   DATE       NOT NULL,
//  reservation_time                    VARCHAR(100)       NOT NULL,
//  reservation_date                  VARCHAR(100)        NOT NULL,
//  reservation_add                     CLOB                   NULL ,
//  reservation_person                  NUMBER(10)   default 1   NOT NULL,
//FOREIGN KEY (member_no) REFERENCES member (member_no),
//FOREIGN KEY (shop_no) REFERENCES shop (shop_no)

  /* �����ȣ */
  private int reservation_no;
  
  /* ȸ����ȣ */
  private int member_no;
  private String member_id;

/* ���Թ�ȣ */
  private int shop_no;
  
  /* ��������(������ ���� �ð�) */
  private String reservation_rdate;
  
  /* ����ð� */
  @NotNull
  private String reservation_time;
  
  /* ������ */
  private String reservation_date;
  
  /* ���� �߰����� */
  private String reservation_add;
  
  /* ���� �ο��� */
  private String reservation_person;
  
  ////////////////////////////////////////////////////////////////////////////////////////////////////
    
  /* ���Ը� */
  private String shop_name; 
  
  /* ���� ���� */
  private String map;
  
  ////////////////////////////////////////////////////////////////////////////////////////////////////
  
  /* ȸ�� �̸� */
  private String member_name;
  
  /* ȸ�� ����ó */
  private String member_tel;
 

  public int getReservation_no() {
    return reservation_no;
  }

  public void setReservation_no(int reservation_no) {
    this.reservation_no = reservation_no;
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

  public String getReservation_rdate() {
    return reservation_rdate;
  }

  public void setReservation_rdate(String reservation_rdate) {
    this.reservation_rdate = reservation_rdate;
  }

  public String getReservation_time() {
    return reservation_time;
  }

  public void setReservation_time(String reservation_time) {
    this.reservation_time = reservation_time;
  }

  public String getReservation_add() {
    return reservation_add;
  }

  public void setReservation_add(String reservation_add) {
    this.reservation_add = reservation_add;
  }

  public String getReservation_person() {
    return reservation_person;
  }

  public void setReservation_person(String reservation_person) {
    this.reservation_person = reservation_person;
  }

  public String getReservation_date() {
    return reservation_date;
  }

  public void setReservation_date(String reservation_date) {
    this.reservation_date = reservation_date;
  }

  public String getShop_name() {
    return shop_name;
  }

  public void setShop_name(String shop_name) {
    this.shop_name = shop_name;
  }

  public String getMap() {
    return map;
  }

  public void setMap(String map) {
    this.map = map;
  }

  public String getMember_name() {
    return member_name;
  }

  public void setMember_name(String member_name) {
    this.member_name = member_name;
  }

  public String getMember_tel() {
    return member_tel;
  }

  public void setMember_tel(String member_tel) {
    this.member_tel = member_tel;
  } 
  public String getMember_id() {
	return member_id;
}

public void setMember_id(String member_id) {
	this.member_id = member_id;
}
  
}
