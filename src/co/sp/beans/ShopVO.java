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
	
	/** ���� ��ȣ **/
	private int shop_no;
	
	/** ī�װ��� ��ȣ **/
	private int category_no;
	
	/** ������ ��ȣ **/
	private int admin_no;
	
	/** ���� �̸� **/
	@NotBlank
	private String shop_name;
	
	/** ���� ���� **/
	@NotBlank
	private String shop_content;
	
	/** ���� ����<��ġ> **/
	@NotBlank
	private String shop_map;
	
	/** ���� �����̹��� **/
	@NotBlank
	private String shop_main;
	private MultipartFile shop_mainMF;
	
	/** ���� ����� **/
	private String shop_thumb;
	
	/** ���� �޴� �̹��� **/
	@NotBlank
	private String shop_menu_img;
	private MultipartFile shop_menuimgMF;
	
	/** ���� ���� �̹��� **/
	@NotBlank
	private String shop_inside_img;
	private MultipartFile shop_insideimgMF;
	
	/** ���� ����� **/
	private String shop_rdate;
	
	/** ���� �� �¼� �� **/
	@NotBlank
	private int shop_total_seat;
	
	/** ���� �ܿ� �¼� �� **/
	@NotBlank
	private int shop_remain_seat;
	
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

	public String getShop_map() {
		return shop_map;
	}

	public void setShop_map(String shop_map) {
		this.shop_map = shop_map;
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
	
	
	
	
	
}