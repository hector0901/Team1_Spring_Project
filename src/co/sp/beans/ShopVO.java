package co.sp.beans;

import javax.validation.constraints.Max;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

import org.springframework.web.multipart.MultipartFile;

public class ShopVO {

//  shop_no NUMBER(10) NOT NULL PRIMARY KEY,
//  shop_name VARCHAR2(100) NOT NULL,
//  shop_zipcode                      VARCHAR2(100)       NOT NULL,
//  shop_address1                     VARCHAR2(100)       NOT NULL,
//  shop_address2                     VARCHAR2(100)       NULL,
//  shop_content CLOB NOT NULL,
//  shop_reply CLOB NULL,
//  map CLOB NOT NULL,
//  shop_main VARCHAR2(100)  NULL,
//  shop_menu_img VARCHAR2(100)  NULL,
//  shop_inside_img VARCHAR2(100)  NULL,
//  shop_rdate DATE NOT NULL,
//  shop_total_seat NUMBER(10) NOT NULL,
//  shop_remain_seat NUMBER(10) NOT NULL,
//  category_no NUMBER(10) NOT NULL,
//  admin_no NUMBER(10) NOT NULL,
//FOREIGN KEY (category_no) REFERENCES category (category_no),
//FOREIGN KEY (admin_no) REFERENCES admin (admin_no)
  
  /** 가게 번호 **/
  private int shop_no;
  
  /** 관리자 번호 **/
  private int admin_no;
  
  /** 카테고리 번호 **/
  private int category_no;
  
  ////////////////////////////////////////////
  
  /** 가게명 **/
  @NotBlank
  private String shop_name;
  
  /** 가게 심플설명 **/
  @NotBlank
  private String shop_simple;
  
  /** 가게 설명 **/
  @NotBlank
  private String shop_content;
  
  /** 가게 우편번호 **/
  @NotBlank
  private String shop_zipcode;
  
  /** 가게 주소1 **/
  @NotBlank
  private String shop_address1;
  
  /** 가게 주소2 **/
  @NotBlank
  private String shop_address2;
  
  /** 가게 지도 **/
  @NotBlank
  private String map;
  
  /** 가게 메인이미지 & Multipart 사진 **/
  private String shop_main;
  private MultipartFile upload_file1;
  
  /** 가게 메뉴이미지 & Multipart 사진 **/
  private String shop_menu_img;
  private MultipartFile upload_file2;

  /** 가게 내부이미지 & Multipart 사진 **/
  private String shop_inside_img;
  private MultipartFile upload_file3;
  
  /** 가게 총좌석수 **/
  @Max(100)
  private int shop_total_seat;
  
  /** 가게 잔여 좌석수 **/
  @Max(100)
  private int shop_remain_seat;
  
  /** 가게 등록일 **/
  private String shop_rdate;
  
  /** 가게 영업시간 **/
  @NotBlank
  private String shop_time;
  
  //////////////////////////////////////////////
  
  public int getShop_no() {
    return shop_no;
  }
  public void setShop_no(int shop_no) {
    this.shop_no = shop_no;
  }
  public int getAdmin_no() {
    return admin_no;
  }
  public void setAdmin_no(int admin_no) {
    this.admin_no = admin_no;
  }
  public int getCategory_no() {
    return category_no;
  }
  public void setCategory_no(int category_no) {
    this.category_no = category_no;
  }
  public String getShop_name() {
    return shop_name;
  }
  public void setShop_name(String shop_name) {
    this.shop_name = shop_name;
  }
  public String getShop_simple() {
    return shop_simple;
  }
  public void setShop_simple(String shop_simple) {
    this.shop_simple = shop_simple;
  }
  public String getShop_content() {
    return shop_content;
  }
  public void setShop_content(String shop_content) {
    this.shop_content = shop_content;
  }
  public String getShop_zipcode() {
    return shop_zipcode;
  }
  public void setShop_zipcode(String shop_zipcode) {
    this.shop_zipcode = shop_zipcode;
  }
  public String getShop_address1() {
    return shop_address1;
  }
  public void setShop_address1(String shop_address1) {
    this.shop_address1 = shop_address1;
  }
  public String getShop_address2() {
    return shop_address2;
  }
  public void setShop_address2(String shop_address2) {
    this.shop_address2 = shop_address2;
  }
  public String getMap() {
    return map;
  }
  public void setMap(String map) {
    this.map = map;
  }
  public String getShop_main() {
    return shop_main;
  }
  public void setShop_main(String shop_main) {
    this.shop_main = shop_main;
  }
  public MultipartFile getUpload_file1() {
    return upload_file1;
  }
  public void setUpload_file1(MultipartFile upload_file1) {
    this.upload_file1 = upload_file1;
  }
  public String getShop_menu_img() {
    return shop_menu_img;
  }
  public void setShop_menu_img(String shop_menu_img) {
    this.shop_menu_img = shop_menu_img;
  }
  public MultipartFile getUpload_file2() {
    return upload_file2;
  }
  public void setUpload_file2(MultipartFile upload_file2) {
    this.upload_file2 = upload_file2;
  }
  public String getShop_inside_img() {
    return shop_inside_img;
  }
  public void setShop_inside_img(String shop_inside_img) {
    this.shop_inside_img = shop_inside_img;
  }
  public MultipartFile getUpload_file3() {
    return upload_file3;
  }
  public void setUpload_file3(MultipartFile upload_file3) {
    this.upload_file3 = upload_file3;
  }
  public int getShop_total_seat() {
    return shop_total_seat;
  }
  public void setShop_total_seat(int shop_total_seat) {
    this.shop_total_seat = shop_total_seat;
  }
  public int getShop_remain_seat() {
    return shop_remain_seat;
  }
  public void setShop_remain_seat(int shop_remain_seat) {
    this.shop_remain_seat = shop_remain_seat;
  }
  public String getShop_rdate() {
    return shop_rdate;
  }
  public void setShop_rdate(String shop_rdate) {
    this.shop_rdate = shop_rdate;
  }
  public String getShop_time() {
    return shop_time;
  }
  public void setShop_time(String shop_time) {
    this.shop_time = shop_time;
  }
  
}
