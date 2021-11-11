package co.sp.beans;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

import org.springframework.web.multipart.MultipartFile;

public class ShopVO {

//	   shop_no NUMBER(10) NOT NULL PRIMARY KEY,
//     category_no NUMBER(10) NOT NULL ,
//     admin_no NUMBER(10) NOT NULL,
//     shop_name VARCHAR2(100) NOT NULL,
//     shop_content CLOB NOT NULL,
//     shop_map CLOB NOT NULL,
//     shop_main VARCHAR2(100) NOT NULL,
//     shop_thumb VARCHAR2(100),
//     shop_menu_img VARCHAR2(100) NOT NULL,
//     shop_inside_img VARCHAR2(100) NOT NULL,
//     shop_rdate DATE NOT NULL,
//     shop_total_seat NUMBER(10) NOT NULL,
//     shop_remain_seat NUMBER(10) NOT NULL,
	
	/** 가게 번호 **/
	private int shop_no;
	
	/** 카테고리 번호 **/
	private int category_no;
	
	/** 관리자 번호 **/
	private int admin_no;
	
	/** 가게 이름 **/
	@NotBlank
	private String shop_name;
	
	/** 가게 설명 **/
	@NotBlank
	private String shop_content;
	
	/** 가게 지도<위치> **/
	@NotBlank
	private String map;
	
	/** 가게 메인이미지 **/
	@NotBlank
	private String shop_main;
	private MultipartFile shop_mainMF;
	
	/** 가게 썸네일 **/
	private String shop_thumb;
	
	/** 가게 메뉴 이미지 **/
	@NotBlank
	private String shop_menu_img;
	private MultipartFile shop_menuimgMF;
	
	/** 가게 내부 이미지 **/
	@NotBlank
	private String shop_inside_img;
	private MultipartFile shop_insideimgMF;
	
	/** 가게 등록일 **/
	private String shop_rdate;
	
	/** 가게 총 좌석 수 **/
	@NotBlank
	private int shop_total_seat;
	
	/** 가게 잔여 좌석 수 **/
	@NotBlank
	private int shop_remain_seat;

	
	private String shop_zipcode;
	private String shop_address1;
	private String shop_address2;

	
	public MultipartFile getShop_mainMF() {
		return shop_mainMF;
	}

	public void setShop_mainMF(MultipartFile shop_mainMF) {
		this.shop_mainMF = shop_mainMF;
	}

	public MultipartFile getShop_menuimgMF() {
		return shop_menuimgMF;
	}

	public void setShop_menuimgMF(MultipartFile shop_menuimgMF) {
		this.shop_menuimgMF = shop_menuimgMF;
	}

	public MultipartFile getShop_insideimgMF() {
		return shop_insideimgMF;
	}

	public void setShop_insideimgMF(MultipartFile shop_insideimgMF) {
		this.shop_insideimgMF = shop_insideimgMF;
	}

	public int getShop_no() {
		return shop_no;
	}

	public void setShop_no(int shop_no) {
		this.shop_no = shop_no;
	}

	public int getCategory_no() {
		return category_no;
	}

	public void setCategory_no(int category_no) {
		this.category_no = category_no;
	}

	public int getAdmin_no() {
		return admin_no;
	}

	public void setAdmin_no(int admin_no) {
		this.admin_no = admin_no;
	}

	public String getShop_name() {
		return shop_name;
	}

	public void setShop_name(String shop_name) {
		this.shop_name = shop_name;
	}

	public String getShop_content() {
		return shop_content;
	}

	public void setShop_content(String shop_content) {
		this.shop_content = shop_content;
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

	public String getShop_thumb() {
		return shop_thumb;
	}

	public void setShop_thumb(String shop_thumb) {
		this.shop_thumb = shop_thumb;
	}

	public String getShop_menu_img() {
		return shop_menu_img;
	}

	public void setShop_menu_img(String shop_menu_img) {
		this.shop_menu_img = shop_menu_img;
	}

	public String getShop_inside_img() {
		return shop_inside_img;
	}

	public void setShop_inside_img(String shop_inside_img) {
		this.shop_inside_img = shop_inside_img;
	}

	public String getShop_rdate() {
		return shop_rdate;
	}

	public void setShop_rdate(String shop_rdate) {
		this.shop_rdate = shop_rdate;
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

	
}
