package co.sp.beans;

import javax.validation.constraints.NotNull;

public class ReservationVO {
		
		/*CREATE TABLE reservation(
	      reservation_no      �����ȣ                NUMBER(10)       NOT NULL       PRIMARY KEY,
	      member_no           ȸ����ȣ           NUMBER(10)       NOT NULL ,
	      shop_no             ���Թ�ȣ           NUMBER(10)       NOT NULL ,
	      reservation_rdate   ������           DATE       NOT NULL,
	      reservation_time    ����ð�            VARCHAR2(30 BYTE)       NOT NULL,
	      reservation_add     ���� �߰�����           CLOB       NOT NULL ,->�߰������� null�� ���������ʴ�..?
	      reservation_person  �����ο���       NUMBER(10)       NOT NULL,*/
		
		/*�����ȣ*/
		private int reservation_no;
		/*ȸ����ȣ*/
		private int member_no;
		/*���Թ�ȣ*/
		private int shop_no;
		/*������*/
		private String reservation_rdate;
		/*����ð�*/
		@NotNull
		private String reservation_time;
		/*���� �߰�����*/
		private String reservation_add;
		/*���� �ο���*/
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


