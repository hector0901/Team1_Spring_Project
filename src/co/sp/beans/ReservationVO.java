package co.sp.beans;

import javax.validation.constraints.NotNull;

public class ReservationVO {
		
		/*CREATE TABLE reservation(
	      reservation_no      예약번호                NUMBER(10)       NOT NULL       PRIMARY KEY,
	      member_no           회원번호           NUMBER(10)       NOT NULL ,
	      shop_no             가게번호           NUMBER(10)       NOT NULL ,
	      reservation_rdate   예약일           DATE       NOT NULL,
	      reservation_time    예약시간            VARCHAR2(30 BYTE)       NOT NULL,
	      reservation_add     예약 추가사항           CLOB       NOT NULL ,->추가사항은 null도 가능하지않니..?
	      reservation_person  예약인원수       NUMBER(10)       NOT NULL,*/
		
		/*예약번호*/
		private int reservation_no;
		/*회원번호*/
		private int member_no;
		/*가게번호*/
		private int shop_no;
		/*예약일*/
		private String reservation_rdate;
		/*예약시간*/
		@NotNull
		private String reservation_time;
		/*예약 추가사항*/
		private String reservation_add;
		/*예약 인원수*/
		private int reservation_person;
		

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
		public int getReservation_person() {
			return reservation_person;
		}
		public void setReservation_person(int reservation_person) {
			this.reservation_person = reservation_person;
		}
		
		
		
	}


