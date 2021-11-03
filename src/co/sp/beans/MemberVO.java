package co.sp.beans;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.springframework.web.multipart.MultipartFile;

public class MemberVO {
  
//  member_no                           NUMBER(10)       NOT NULL       PRIMARY KEY,
//  member_id                           VARCHAR2(50)       NOT NULL,
//  member_pw                           VARCHAR2(50)       NOT NULL,
//  member_name                         VARCHAR2(50)       NOT NULL,
//  member_social                       VARCHAR2(50)       NOT NULL,
//  member_nickname                     VARCHAR2(50)       NOT NULL,
//  member_tel                          VARCHAR2(20)       NOT NULL,
//  member_email                        VARCHAR2(100)       NOT NULL,
//  member_zipcode                      VARCHAR2(100)       NOT NULL,
//  member_address1                     VARCHAR2(100)       NOT NULL,
//  member_address2                     VARCHAR2(100)       NOT NULL,
//  member_profile                      VARCHAR2(200)       NULL ,
//  member_thumb                        VARCHAR2(200)       NULL ,
//  member_size                         NUMBER(10)       DEFAULT 0       NULL 
  
//  COMMENT ON TABLE member is 'È¸¿ø';
//  COMMENT ON COLUMN member.member_no is 'È¸¿ø ¹øÈ£';
//  COMMENT ON COLUMN member.member_id is 'È¸¿ø id';
//  COMMENT ON COLUMN member.member_pw is 'È¸¿ø pw';
//  COMMENT ON COLUMN member.member_name is 'È¸¿ø ÀÌ¸§';
//  COMMENT ON COLUMN member.member_social is 'È¸¿ø ÁÖ¹Îµî·Ï¹øÈ£';
//  COMMENT ON COLUMN member.member_nickname is 'È¸¿ø ´Ð³×ÀÓ';
//  COMMENT ON COLUMN member.member_tel is 'È¸¿ø ¿¬¶ôÃ³';
//  COMMENT ON COLUMN member.member_email is 'È¸¿ø ÀÌ¸ÞÀÏ';
//  COMMENT ON COLUMN member.member_zipcode is 'È¸¿ø ¿ìÆí¹øÈ£';
//  COMMENT ON COLUMN member.member_address1 is 'È¸¿ø ÁÖ¼Ò1';
//  COMMENT ON COLUMN member.member_address2 is 'È¸¿ø ÁÖ¼Ò2';
//  COMMENT ON COLUMN member.member_profile is 'È¸¿ø ÇÁ·ÎÇÊ»çÁø';
//  COMMENT ON COLUMN member.member_thumb  is 'È¸¿ø ¼¶³×ÀÏ';
//  COMMENT ON COLUMN member.member_size is 'È¸¿ø ÇÁ·ÎÇÊ ÀÌ¹ÌÁö Å©±â';
  
	/** È¸¿ø ¹øÈ£ **/
  private int member_no;
  
  /** È¸¿ø ¾ÆÀÌµð **/
  @Size(min=4, max=15)
  @Pattern(regexp = "[a-zA-Z0-9]*")
  private String member_id;
  
  /** È¸¿ø ºñ¹Ð¹øÈ£ **/
  @Size(min=4, max=15)
  @Pattern(regexp = "[a-zA-Z0-9]*")
  private String member_pw;
  
  /** È¸¿ø ºñ¹Ð¹øÈ£2 => ºñ¹Ð¹øÈ£ Ã¼Å© **/
  @Size(min=4, max=15)
  @Pattern(regexp = "[a-zA-Z0-9]*")
  private String member_pw2;

  /** È¸¿ø ÀÌ¸§ **/
  @Size(min=2, max=10)
  @Pattern(regexp = "[°¡-ÆR]*")
  private String member_name;
  
  /** È¸¿ø ÁÖ¹Îµî·Ï¹øÈ£ **/
  @Size(min=13, max=13)
  @Pattern(regexp = "[0-9]*")
  private String member_social;
  
  /** È¸¿ø ´Ð³×ÀÓ **/
  @Size(min=4, max=15)
  @Pattern(regexp = "[a-zA-Z0-9°¡-ÆR]*")
  private String member_nickname;
  
  /** È¸¿ø ¿¬¶ôÃ³ **/
  @Size(min=10, max=11)
  @Pattern(regexp = "[0-9]*")
  private String member_tel;
  
  /** È¸¿ø ÀÌ¸ÞÀÏ **/
  @Email
  @NotNull
  private String member_email;
  
  /** È¸¿ø ¿ìÆí¹øÈ£ **/
  @NotNull
  private String member_zipcode;
  
  /** È¸¿ø ÁÖ¼Ò **/
  @NotNull
  private String member_address1;
  
  /** È¸¿ø »ó¼¼ÁÖ¼Ò **/
  @NotNull
  private String member_address2;
  
  /** ÀÌ¹ÌÁö °ü·Ã º¯¼ö(»ç¿ë¿©ºÎ ºÒÅõ¸í) **/
  private String member_profile;
  private String member_thumb;
  private int member_size;
  
  /** È¸¿ø ¸ÞÀÎ ÀÌ¹ÌÁö Å©±â ¿ë·® ·¹ÀÌºí */
  private String member_size_label;
  private MultipartFile member_fileMF;
  
  /** id Áßº¹Ã¼Å© ¹× ·Î±×ÀÎ ¿©ºÎ °ü·Ã º¯¼ö **/
  private boolean idExist;
	private boolean memberLogin;
  
	//·Î±×ÀÎÀÌ µÇ¾îÀÖÁö ¾ÊÀº ÃÊ±â°ª + ¾ÆÀÌµð Áßº¹ X
	public MemberVO() {
		this.idExist = false;
		this.memberLogin = false;
	}
	
  //////////////////////////////////////////////////////////////////////////////////////////////////////////
  
  public int getMember_no() {
    return member_no;
  }
  
  public void setMember_no(int member_no) {
    this.member_no = member_no;
  }
  
  public String getMember_id() {
    return member_id;
  }
  
  public void setMember_id(String member_id) {
    this.member_id = member_id;
  }
  
  public String getMember_pw() {
    return member_pw;
  }
  
  public void setMember_pw(String member_pw) {
    this.member_pw = member_pw;
  }
  
  public String getMember_name() {
    return member_name;
  }
  
  public void setMember_name(String member_name) {
    this.member_name = member_name;
  }
  
  public String getMember_social() {
    return member_social;
  }
  
  public void setMember_social(String member_social) {
    this.member_social = member_social;
  }
  
  public String getMember_nickname() {
    return member_nickname;
  }
  
  public void setMember_nickname(String member_nickname) {
    this.member_nickname = member_nickname;
  }
  
  public String getMember_tel() {
    return member_tel;
  }
  
  public void setMember_tel(String member_tel) {
    this.member_tel = member_tel;
  }
  
  public String getMember_email() {
    return member_email;
  }
  
  public void setMember_email(String member_email) {
    this.member_email = member_email;
  }
  
  public String getMember_zipcode() {
    return member_zipcode;
  }
  
  public void setMember_zipcode(String member_zipcode) {
    this.member_zipcode = member_zipcode;
  }
  
  public String getMember_address1() {
    return member_address1;
  }
  
  public void setMember_address1(String member_address1) {
    this.member_address1 = member_address1;
  }
  
  public String getMember_address2() {
    return member_address2;
  }
  
  public void setMember_address2(String member_address2) {
    this.member_address2 = member_address2;
  }
  
  public String getMember_profile() {
    return member_profile;
  }
  
  public void setMember_profile(String member_profile) {
    this.member_profile = member_profile;
  }
  
  public String getMember_thumb() {
    return member_thumb;
  }
  
  public void setMember_thumb(String member_thumb) {
    this.member_thumb = member_thumb;
  }
  
  public int getMember_size() {
    return member_size;
  }
  
  public void setMember_size(int member_size) {
    this.member_size = member_size;
  }
  
  public String getMember_size_label() {
    return member_size_label;
  }
  
  public void setMember_size_label(String member_size_label) {
    this.member_size_label = member_size_label;
  }
  
  public MultipartFile getMember_fileMF() {
    return member_fileMF;
  }
  
  public void setMember_fileMF(MultipartFile member_fileMF) {
    this.member_fileMF = member_fileMF;
  }

	public String getMember_pw2() {
		return member_pw2;
	}

	public void setMember_pw2(String member_pw2) {
		this.member_pw2 = member_pw2;
	}

	public boolean isIdExist() {
		return idExist;
	}

	public void setIdExist(boolean idExist) {
		this.idExist = idExist;
	}

	public boolean isMemberLogin() {
		return memberLogin;
	}

	public void setMemberLogin(boolean memberLogin) {
		this.memberLogin = memberLogin;
	}

}
