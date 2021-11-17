package co.sp.beans;

import org.springframework.web.multipart.MultipartFile;

public class Shop_ReplyVO {
	private int shop_reply_no;
	private int member_no;
	private String member_nickname;
	private String member_profile;
	private MultipartFile upload_file1;
	private int shop_no;
	private String shop_reply_content;
	private String shop_reply_rdate;
	public int getShop_reply_no() {
		return shop_reply_no;
	}
	public void setShop_reply_no(int shop_reply_no) {
		this.shop_reply_no = shop_reply_no;
	}
	public int getMember_no() {
		return member_no;
	}
	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}
	public String getMember_nickname() {
		return member_nickname;
	}
	public void setMember_nickname(String member_nickname) {
		this.member_nickname = member_nickname;
	}
	public String getMember_profile() {
		return member_profile;
	}
	public void setMember_profile(String member_profile) {
		this.member_profile = member_profile;
	}
	public MultipartFile getUpload_file1() {
		return upload_file1;
	}
	public void setUpload_file1(MultipartFile upload_file1) {
		this.upload_file1 = upload_file1;
	}
	public int getShop_no() {
		return shop_no;
	}
	public void setShop_no(int shop_no) {
		this.shop_no = shop_no;
	}
	public String getShop_reply_content() {
		return shop_reply_content;
	}
	public void setShop_reply_content(String shop_reply_content) {
		this.shop_reply_content = shop_reply_content;
	}
	public String getShop_reply_rdate() {
		return shop_reply_rdate;
	}
	public void setShop_reply_rdate(String shop_reply_rdate) {
		this.shop_reply_rdate = shop_reply_rdate;
	}
	
	
}
