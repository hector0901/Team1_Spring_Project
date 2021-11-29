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

  /* 예약번호 */
  private int reservation_no;
  
  /* 회원번호 */
  private int member_no;
  private String member_id;

/* 가게번호 */
  private int shop_no;
  
  /* 예약등록일(예약이 눌린 시간) */
  private String reservation_rdate;
  
  /* 예약시간 */
  @NotNull
  private String reservation_time;
  
  /* 예약일 */
  private String reservation_date;
  
  /* 예약 추가사항 */
  private String reservation_add;
  
  /* 예약 인원수 */
  private String reservation_person;
  
  ////////////////////////////////////////////////////////////////////////////////////////////////////
    
  /* 가게명 */
  private String shop_name; 
  
  /* 가게 지도 */
  private String map;
  
  ////////////////////////////////////////////////////////////////////////////////////////////////////
  
  /* 회원 이름 */
  private String member_name;
  
  /* 회원 연락처 */
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
