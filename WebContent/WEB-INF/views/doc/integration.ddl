DROP TABLE pay IF EXISTS;
DROP TABLE wating IF EXISTS;
DROP TABLE reservation IF EXISTS;
DROP TABLE shop IF EXISTS;
DROP TABLE member IF EXISTS;
DROP TABLE admin IF EXISTS;
DROP TABLE category IF EXISTS;

/**********************************/
/* Table Name: 카테고리 */
/**********************************/
CREATE TABLE category(
		category_no NUMBER(10) NOT NULL PRIMARY KEY,
		category_name VARCHAR2(50) NOT NULL
);

/**********************************/
/* Table Name: 관리자 */
/**********************************/
CREATE TABLE admin(
		admin_no NUMBER(10) NOT NULL PRIMARY KEY,
		admin_id VARCHAR2(50) NOT NULL,
		admin_pw VARCHAR2(50) NOT NULL,
		admin_name VARCHAR2(50) NOT NULL
);

/**********************************/
/* Table Name: 회원 */
/**********************************/
CREATE TABLE member(
		member_no NUMBER(10) NOT NULL PRIMARY KEY,
		member_id VARCHAR2(50) NOT NULL,
		member_pw VARCHAR2(50) NOT NULL,
		member_name VARCHAR2(50) NOT NULL,
		member_social VARCHAR2(50) NOT NULL,
		member_nickname VARCHAR2(50) NOT NULL,
		member_tel VARCHAR2(20) NOT NULL,
		member_email VARCHAR2(100) NOT NULL,
		member_zipcode VARCHAR2(100) NOT NULL,
		member_address1 VARCHAR2(100) NOT NULL,
		member_address2 VARCHAR2(100) NOT NULL,
		member_profile VARCHAR2(200),
		member_thumb  VARCHAR2(200),
		member_rdate DATE NOT NULL
);

/**********************************/
/* Table Name: 가게 */
/**********************************/
CREATE TABLE shop(
		shop_no NUMBER(10) NOT NULL PRIMARY KEY,
		shop_name VARCHAR2(100) NOT NULL,
		shop_content CLOB(10) NOT NULL,
		shop_reply CLOB(10),
		shop_map CLOB(10) NOT NULL,
		shop_main VARCHAR2(100) NOT NULL,
		shop_thumb VARCHAR2(100),
		shop_menu_img VARCHAR2(100) NOT NULL,
		shop_inside_img VARCHAR2(100) NOT NULL,
		shop_rdate DATE NOT NULL,
		shop_total_seat NUMBER(10) NOT NULL,
		shop_remain_seat NUMBER(10) NOT NULL,
		shop_reply VARCHAR2(1000),
		category_no NUMBER(10),
		admin_no NUMBER(10),
		member_no NUMBER(10),
  FOREIGN KEY (category_no) REFERENCES category (category_no),
  FOREIGN KEY (admin_no) REFERENCES admin (admin_no),
  FOREIGN KEY (member_no) REFERENCES member (member_no)
);

/**********************************/
/* Table Name: 예약 */
/**********************************/
CREATE TABLE reservation(
		reservation_no NUMBER(10) NOT NULL PRIMARY KEY,
		member_no DATE NOT NULL,
		shop_no DATE NOT NULL,
		reservation_rdate DATE NOT NULL,
		reservation_time DATE NOT NULL,
		reservation_add CLOB(10),
		reservation_person NUMBER(10) NOT NULL,
  FOREIGN KEY (member_no) REFERENCES member (member_no),
  FOREIGN KEY (shop_no) REFERENCES shop (shop_no)
);

/**********************************/
/* Table Name: 웨이팅 */
/**********************************/
CREATE TABLE wating(
		wating_no NUMBER(10) NOT NULL PRIMARY KEY,
		member_no NUMBER(10),
		shop_no NUMBER(10),
		waiting_count NUMBER(10) NOT NULL,
		waiting_rdate DATE NOT NULL,
  FOREIGN KEY (member_no) REFERENCES member (member_no),
  FOREIGN KEY (shop_no) REFERENCES shop (shop_no)
);

/**********************************/
/* Table Name: 결제 */
/**********************************/
CREATE TABLE pay(
		pay_no NUMBER(10) NOT NULL PRIMARY KEY,
		member_no NUMBER(10),
		reservation_no NUMBER(10),
		pay_method VARCHAR2(50) NOT NULL,
		pay_total NUMBER(50) NOT NULL,
		pay_rdate DATE NOT NULL,
  FOREIGN KEY (reservation_no) REFERENCES reservation (reservation_no),
  FOREIGN KEY (member_no) REFERENCES member (member_no)
);

