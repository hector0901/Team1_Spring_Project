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

//  COMMENT ON TABLE member is '회원';
//  COMMENT ON COLUMN member.member_no is '회원 번호';
//  COMMENT ON COLUMN member.member_id is '회원 id';
//  COMMENT ON COLUMN member.member_pw is '회원 pw';
//  COMMENT ON COLUMN member.member_name is '회원 이름';
//  COMMENT ON COLUMN member.member_social is '회원 주민등록번호';
//  COMMENT ON COLUMN member.member_nickname is '회원 닉네임';
//  COMMENT ON COLUMN member.member_tel is '회원 연락처';
//  COMMENT ON COLUMN member.member_email is '회원 이메일';
//  COMMENT ON COLUMN member.member_zipcode is '회원 우편번호';
//  COMMENT ON COLUMN member.member_address1 is '회원 주소1';
//  COMMENT ON COLUMN member.member_address2 is '회원 주소2';
//  COMMENT ON COLUMN member.member_profile is '회원 프로필사진';
//  COMMENT ON COLUMN member.member_thumb  is '회원 섬네일';
//  COMMENT ON COLUMN member.member_size is '회원 프로필 이미지 크기';

  /** 회원 번호 **/
  private int member_no;

  /** 회원 아이디 **/
  @Size(min = 4, max = 15)
  @Pattern(regexp = "[a-zA-Z0-9]*")
  private String member_id;

  /** 회원 비밀번호 **/
  @Size(min = 4, max = 15)
  @Pattern(regexp = "[a-zA-Z0-9]*")
  private String member_pw;

  /** 회원 비밀번호2 => 비밀번호 체크 **/
  @Size(min = 4, max = 15)
  @Pattern(regexp = "[a-zA-Z0-9]*")
  private String member_pw2;

  /** 회원 이름 **/
  @Size(min = 2, max = 10)
  @Pattern(regexp = "[가-힣]*")
  private String member_name;

  /** 회원 주민등록번호 **/
  @Size(min = 13, max = 13)
  @Pattern(regexp = "[0-9]*")
  private String member_social;

  /** 회원 닉네임 **/
  @Size(min = 4, max = 15)
  @Pattern(regexp = "[a-zA-Z0-9가-힣]*")
  private String member_nickname;

  /** 회원 연락처 **/
  @Size(min = 10, max = 11)
  @Pattern(regexp = "[0-9]*")
  private String member_tel;

  /** 회원 이메일 **/
  @Email
  @Size(min = 1, max = 100)
  private String member_email;

  /** 회원 우편번호 **/
  @Size(min = 1, max = 100)
  private String member_zipcode;

  /** 회원 주소 **/
  @Size(min = 1, max = 100)
  private String member_address1;

  /** 회원 상세주소 **/
  @Size(min = 1, max = 100)
  private String member_address2;

  /** 회원 가입일 **/
  private String member_rdate;

  /** 이미지 관련 변수(사용여부 불투명) **/
  private String member_profile;
  private String member_thumb;
  private int member_size;

  /** 회원 메인 이미지 크기 용량 레이블 */
  private String member_size_label;
  private MultipartFile upload_file;

  /** id 중복체크 및 로그인 여부, 패스워드 찾기 성공 여부 관련 변수 **/
  private boolean idExist;
  private boolean memberLogin;
  private boolean pwfind;

  // 로그인이 되어있지 않은 초기값 + 아이디 중복 X
  public MemberVO() {
    this.idExist = false;
    this.memberLogin = false;
    this.pwfind = false;

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

  public String getMember_rdate() {
    return member_rdate;
  }

  public void setMember_rdate(String member_rdate) {
    this.member_rdate = member_rdate;
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

  public MultipartFile getUpload_file() {
    return upload_file;
  }

  public void setUpload_file(MultipartFile upload_file) {
    this.upload_file = upload_file;
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

  public boolean isPwfind() {
    return pwfind;
  }

  public void setPwfind(boolean pwfind) {
    this.pwfind = pwfind;
  }

}
