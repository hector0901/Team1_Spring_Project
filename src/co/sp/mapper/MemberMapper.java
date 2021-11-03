package co.sp.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import co.sp.beans.MemberVO;

public interface MemberMapper {
	
	// ID 중복체크
	@Select("SELECT member_id " +
			       "FROM member " +
			       "WHERE member_id = #{member_id}")
	String double_id_check(String member_id);
	
	// 회원 등록 
	@Insert("INSERT INTO member(member_no, member_id, member_pw, member_name, member_social, member_nickname, " +
			"member_tel, member_email, member_zipcode, member_address1, member_address2, member_profile, member_thumb, member_size, member_rdate) " +
			"VALUES (member_no_seq.nextval, #{member_id}, #{member_pw}, #{member_name}, #{member_social}, #{member_nickname}, " +
			"#{member_tel}, '#{member_email}, #{member_zipcode}, #{member_address1}, #{member_address2}, #{member_profile}, #{member_thumb}, #{member_size}, sysdate)")
	void member_create(MemberVO joinMemberBean);


}










